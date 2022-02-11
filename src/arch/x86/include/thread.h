#ifndef __THREAD_H__
#define __THREAD_H__

#include "stdint.h"

typedef void thread_function(void*);

enum task_status
{
    TASK_RUNNING, /* 运行态 */
    TASK_READY,   /* 就绪态 */
    TASK_BLOCKED, /* 阻塞态 */
    TASK_WAITING,
    TASK_HANGING,
    TASK_DIED,
};

/* 中断栈 */
struct intr_stack
{
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
    uint32_t err_code;
    void (*eip) (void);
    uint32_t cs;
    uint32_t eflags;
    void* esp;
    uint32_t ss;
};

/* 线程栈 */
struct thread_stack
{
    uint32_t ebp;
    uint32_t ebx;
    uint32_t edi;
    uint32_t esi;
    void (*eip)(thread_function* function,void* arg);
    /* 以下是第一次上cpu是用的 */
    void* (return_addr); /* 占位的,没用 */
    thread_function* func;
    void* func_arg;
};

/* 程序控制块pcb */
struct task_struct
{
    uint32_t* self_kstack;
    enum task_status status;
    uint8_t priority;
    char name[16];
    uint32_t stack_magic;
};

void init_thread(struct task_struct* thread,char* name,uint8_t priority);
void kernel_thread(thread_function* func,void* arg);
void thread_create(struct task_struct* thread,thread_function func,void* arg);
struct task_struct* thread_start(char* name,uint8_t priority,thread_function func,void* arg);

#endif /* __THREAD_H__ */