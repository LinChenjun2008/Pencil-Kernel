#ifndef __THREAD_H__
#define __THREAD_H__

#include "global.h"
#include "stdint.h"

typedef void thread_function(void*);

/* 线程状态 */
enum task_status
{
    TASK_RUNNING,   /* 运行态 */
    TASK_READY,     /* 就绪态 */
    TASK_BLOCKED,   /* 阻塞态 */
    TASK_SENDING,   /* 发送消息状态 */
    TASK_RECEIVING, /* 接收消息状态 */
    TASK_WAITING,
    TASK_HANGING,
    TASK_DIED,
};

/* 中断栈 */
struct intr_stack
{
    /* 低地址 */

    /* 以下由中断处理程序压入栈 */
    uint32_t vector_no;
    /* pushad入栈的寄存器 */
    uint32_t edi;
    uint32_t esi;
    uint32_t ebp;
    uint32_t _esp; /* esp会被popad忽略 */
    uint32_t ebx;
    uint32_t edx;
    uint32_t ecx;
    uint32_t eax;
    /* 手动入栈的寄存器 */
    uint32_t gs;
    uint32_t fs;
    uint32_t es;
    uint32_t ds;
    /* 以下由cpu特权级由低到高时自动压入 */
    uint32_t err_code;  /* 错误码 */
    void (*eip) (void); /* eip指针 */
    uint32_t cs;        /* cs寄存器 */
    uint32_t eflags;    /* eflages寄存器 */
    void* esp;          /* 栈指针 */
    uint32_t ss;        /* ss段寄存器 */

    /* 高地址 */
};

/* 线程栈 */
struct thread_stack
{
    /* ABI规范要求保护下面寄存器的值 */
    uint32_t ebp;
    uint32_t ebx;
    uint32_t edi;
    uint32_t esi;
    /* 在线中程执行的函数 */
    void (*eip)(thread_function* function,void* arg);
    /* 以下是第一次上cpu是用的 */
    void* (return_addr); /* 占位的,没用 */
    thread_function* func;
    void* func_arg;
};

/* 程序控制块pcb */
struct task_struct
{
    uint32_t* self_kstack;   /* 线程内核栈指针 */
    enum task_status status; /* 状态 */
    char name[16];           /* 名称 */

    uint8_t priority;        /* 优先级 */
    uint8_t ticks;           /* 在CPU上运行的时间 */
    uint32_t elapsed_ticks;  /* 总共运行的时间 */

    uint32_t* page_dir;      /* 线程的页表 */

    uint32_t stack_magic;    /* 用于检测是否栈溢出 */
};

void init_thread();
void thread_init(struct task_struct* thread,char* name,uint8_t priority);
void kernel_thread(thread_function* func,void* arg);
void thread_create(struct task_struct* thread,thread_function func,void* arg);
struct task_struct* thread_start(char* name,uint8_t priority,thread_function func,void* arg);

#endif /* __THREAD_H__ */
