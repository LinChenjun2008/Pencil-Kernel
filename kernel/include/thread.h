#ifndef __THREAD_H__
#define __THREAD_H__

#include <global.h>
#include <list.h>

typedef UINTN pid_t;
typedef void thread_function(void*);

#define PCB_SIZE (64 * 1024) /* 64KB */
#define StackMagic 0x55aa55aa55aa55aa

enum task_status
{
    TASK_RUNNING,
    TASK_READY,
    TASK_BLOCKED,
    TASK_SENDING,
    TASK_RECEIVING,
    TASK_WAITING,
    TASK_HANGING,
    TASK_DIED,
};

struct intr_stack
{
    /* 低地址 */
    /* 以下是中断处理程序入栈的值 */
    UINTN ds;
    UINTN es;
    UINTN fs;
    UINTN gs;

    UINTN rax;
    UINTN rbx;
    UINTN rcx;
    UINTN rdx;
    UINTN rbp;
    UINTN rsi;
    UINTN rdi;

    UINTN r8;
    UINTN r9;
    UINTN r10;
    UINTN r11;
    UINTN r12;
    UINTN r13;
    UINTN r14;
    UINTN r15;
    /* 以下是CPU 特权级切换时自动入栈的内容 */
    UINTN ErrorCode;
    void (*rip)(void);
    UINTN cs;
    UINTN rflages;
    UINTN rsp;
    UINTN ss;
    /* 高地址 */
};

/* 线程栈 */
struct thread_stack
{
    /* ABI规范要求保护下面寄存器的值 */
    UINTN rbp;
    UINTN rbx;
    UINTN rdi;
    UINTN rsi;
    /* 线程中执行的函数 */
    void* rip;
};

/* 程序控制块pcb */
struct task_struct
{
    UINTN self_kstack;               /* 线程内核栈指针 */
    volatile enum task_status status; /* 状态 */
    pid_t pid;                        /* 进程或线程 pid */
    char name[32];                    /* 名称 */
    UINTN priority;                   /* 优先级 */
    UINTN ticks;                      /* 在CPU上运行的时间 */
    UINTN elapsed_ticks;              /* 总共运行的时间 */

    struct ListNode all_tag;          /* 用于加入全部线程队列 */
    struct ListNode general_tag;      /* 用于加入就绪线程队列 */

    UINTN* page_dir;                     /* 线程的页表 */
    // struct MEMMAN prog_vaddr;            /* 进程的虚拟地址 */
    // struct mem_desc u_desc[MEM_DESCS];

    // struct MESSAGE msg;                  /* 进程消息体 */
    // pid_t send_to;                       /* 记录进程想要向谁发送消息 */
    // pid_t recv_from;                     /* 记录进程想要从谁获取消息 */
    // int int_msg;                         /* 如果进程在等待中断发生,用于记录中断号 */
    // struct List sender_list;             /* 如果有进程A向这个进程发送消息,但本进程没有要接收消息,进程A将自己的send_tag加入这个队列 */

    UINTN stack_magic;                   /* 用于检测是否栈溢出 */
};

void init_thread();
PUBLIC struct task_struct* thread_start(char* name,UINTN priority,thread_function func,void* arg);
PUBLIC struct task_struct* running_thread();
PUBLIC void schedule();

PUBLIC void thread_block(enum task_status status);
PUBLIC void thread_unblock(struct task_struct* pthread);
#endif