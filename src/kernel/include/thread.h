#ifndef __THREAD_H__
#define __THREAD_H__

#include <global.h>
#include <list.h>

typedef unsigned long long int pid_t;

#include <message.h>

typedef void thread_function_t(void*);

#define PCB_SIZE (64 * 1024) /* 64KB */
#define STACK_MAGIC 0x55aa55aa55aa55aa

typedef enum
{
    TASK_RUNNING,
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
    /* 以下是中断处理程序入栈的值 */
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
    /* 以下是CPU 特权级切换时自动入栈的内容 */
    wordsize_t error_code;
    void (*rip)(void);
    wordsize_t cs;
    wordsize_t rflages;
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
    void* rip;
} thread_stack_t;

/* 程序控制块pcb */
typedef struct
{
    thread_stack_t* self_kstack;               /* 线程内核栈指针 */
    volatile task_status_t status;        /* 状态 */
    pid_t pid;                            /* 进程或线程 pid */
    char name[32];                        /* 名称 */
    unsigned long long int priority;      /* 优先级 */
    unsigned long long int ticks;         /* 在CPU上运行的时间 */
    unsigned long long int elapsed_ticks; /* 总共运行的时间 */

    list_node_t all_tag;                  /* 用于加入全部线程队列 */
    list_node_t general_tag;              /* 用于加入就绪线程队列 */

    wordsize_t* page_dir;                 /* 线程的页表 */
    // struct MEMMAN prog_vaddr;          /* 进程的虚拟地址 */
    // struct mem_desc u_desc[MEM_DESCS];

    message_t msg;                        /* 进程消息体 */
    pid_t send_to;                        /* 记录进程想要向谁发送消息 */
    pid_t recv_from;                      /* 记录进程想要从谁获取消息 */
    list_t sender_list;                   /* 如果有进程A向这个进程发送消息,但本进程没有要接收消息,进程A将自己的send_tag加入这个队列 */

    wordsize_t stack_magic;               /* 用于检测是否栈溢出 */
} task_struct_t;

void init_thread();
PUBLIC task_struct_t* thread_start(char* name,unsigned long long int priority,thread_function_t func,void* arg);
PUBLIC void thread_init(task_struct_t* thread,char* name,unsigned long long int priority);
void thread_create(task_struct_t* thread,thread_function_t func,void* arg);
PUBLIC task_struct_t* running_thread();
PUBLIC void schedule();

PUBLIC void thread_block(task_status_t status);
PUBLIC void thread_unblock(task_struct_t* pthread);
PUBLIC task_struct_t* pid2thread(pid_t pid);

extern list_t ready_list;
extern list_t all_list;
#endif