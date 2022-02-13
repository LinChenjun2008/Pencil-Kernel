#include "thread.h"
#include "global.h"
#include "memory.h"
#include "stdint.h"
#include "string.h"

void init_thread(struct task_struct* thread,char* name,uint8_t priority)
{
    memset(thread,0,sizeof(*thread));
    //strcpy(thread->name,name);
    thread->status = TASK_RUNNING;
    thread->priority = priority;
    thread->self_kstack = ((uint32_t*)(((uint32_t)thread) + PG_SIZE));
    thread->stack_magic = 0x12345678;
    return;
}

void kernel_thread(thread_function* func,void* arg)
{
    func(arg);
}

void thread_create(struct task_struct* thread,thread_function func,void* arg)
{
    /* 预留栈空间 */
    thread->self_kstack -= sizeof(struct intr_stack);
    /* 预留线程栈空间 */
    thread->self_kstack -= sizeof(struct thread_stack);

    struct thread_stack* kthread_stack;
    kthread_stack = ((struct thread_stack*)(thread->self_kstack));

    kthread_stack->eip = kernel_thread; /* kernel_thread是个函数 */
    kthread_stack->func = func;
    kthread_stack->func_arg = arg;
    kthread_stack->ebp = 0;
    kthread_stack->ebx = 0;
    kthread_stack->esi = 0;
    kthread_stack->edi = 0;
    return;
}

struct task_struct* thread_start(char* name,uint8_t priority,thread_function func,void* arg)
{
    struct task_struct* thread = (struct task_struct*)get_kernel_page(1);
    init_thread(thread,name,priority);
    thread_create(thread,func,arg);
    asm volatile (
                    "movl %0,%%esp \n\t" \
                    "pop %%ebp     \n\t" \
                    "pop %%ebx     \n\t" \
                    "pop %%edi     \n\t" \
                    "pop %%esi     \n\t" \
                    "ret"
    ::"g"(thread->self_kstack):"memory");
    return thread;

}