#ifndef __THREAD_H__
#define __THREAD_H__

#include <alloc_table.h>
#include <kernel/global.h>
#include <lib/list.h>
#include <device/fpu.h>

typedef uint64_t pid_t;

#include <message.h>

typedef void thread_function_t(void*);

#define MAX_TASKS   256

#define PCB_SIZE    (64 * 1024) /* 64KB */
#define STACK_MAGIC 0x55aa55aa55aa55aa

typedef enum
{
    TASK_RUNNING = 1,
    TASK_READY,
    TASK_BLOCKED,
    TASK_SENDING,
    TASK_RECEIVING,
    TASK_WAITING,
    TASK_HANGING,
    TASK_DIED,
} task_status_t;

typedef struct
{
    /* 低地址 */
    wordsize_t ds;
    wordsize_t es;
    wordsize_t fs;
    wordsize_t gs;

    wordsize_t rax;
    wordsize_t rbx;
    wordsize_t rcx;
    wordsize_t rdx;
    wordsize_t rbp;
    wordsize_t rsi;
    wordsize_t rdi;

    wordsize_t r8;
    wordsize_t r9;
    wordsize_t r10;
    wordsize_t r11;
    wordsize_t r12;
    wordsize_t r13;
    wordsize_t r14;
    wordsize_t r15;

    wordsize_t error_code;
    void       (*rip)(void);
    wordsize_t cs;
    wordsize_t rflags;
    wordsize_t rsp;
    wordsize_t ss;
    /* 高地址 */
} intr_stack_t;

/* 线程栈 */
typedef struct
{
    /* ABI规范要求保护下面寄存器的值 */
    wordsize_t r15;
    wordsize_t r14;
    wordsize_t r13;
    wordsize_t r12;

    wordsize_t rbp;
    wordsize_t rbx;
    wordsize_t rdi;
    wordsize_t rsi;
    /* 线程中执行的函数 */
    void*      rip;
} thread_stack_t;

/* 程序控制块pcb */
typedef struct
{
    uint64_t              *self_kstack;   /* 线程内核栈指针 */
    uint64_t              *self_ustack;   /* 用户态栈指针(物理地址) */

    volatile task_status_t status;        /* 状态 */
    pid_t                  pid;           /* 进程或线程 pid */
    char                   name[32];      /* 名称 */
    uint64_t               priority;      /* 优先级 */
    uint64_t               ticks;         /* 在CPU上运行的时间 */
    uint64_t               elapsed_ticks; /* 总共运行的时间 */

    list_node_t            all_tag;       /* 用于加入全部线程队列 */
    list_node_t            general_tag;   /* 用于加入线程队列 */

    uint64_t              *page_dir;      /* 线程的页表 */
    allocate_table_t       vaddr_table;   /* 虚拟地址表,仅在page_dir != NULL 时有效*/
    message_t              msg;           /* 进程消息体 */
    pid_t                  send_to;       /* 记录进程想要向谁发送消息 */
    pid_t                  recv_from;     /* 记录进程想要从谁获取消息 */
    list_t                 sender_list;   /* 如果有进程A向这个进程发送消息,但本进程没有要接收消息,进程A将自己的general_tag加入这个队列 */

    fpu_t fpu_regs;

    uint64_t               stack_magic;  /* 用于检测是否栈溢出 */
} task_struct_t;

PUBLIC void thread_init(task_struct_t* thread,char* name,uint64_t priority);
PUBLIC task_struct_t* running_thread();
PUBLIC void thread_create(task_struct_t* thread,thread_function_t func,
                          void* arg);
PUBLIC task_struct_t* thread_start(char* name,uint64_t priority,
                                   thread_function_t func,void* arg);
PUBLIC void init_thread();

PUBLIC void schedule();

PUBLIC void thread_block(task_status_t status);
PUBLIC void thread_unblock(task_struct_t* pthread);
PUBLIC task_struct_t* pid2thread(pid_t pid);

extern list_t ready_list;
extern list_t all_list;
#endif