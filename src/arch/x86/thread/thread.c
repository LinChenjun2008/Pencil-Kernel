#include "thread.h"
#include "fifo.h"
#include "global.h"
#include "interrupt.h"
#include "memory.h"
#include "stdint.h"
#include "string.h"

struct task_struct* main_thread;
struct FIFO ready_thread;
struct FIFO all_thread;

static void make_main_thread();

void init_thread()
{
    init_fifo(&ready_thread,get_kernel_page(1),32,PG_SIZE / sizeof(uint32_t));
    init_fifo(&all_thread,get_kernel_page(1),32,PG_SIZE / sizeof(uint32_t));
    make_main_thread();
    return;
}

void thread_init(struct task_struct* thread,char* name,uint8_t priority)
{
    memset(thread,0,sizeof(*thread));
    strcpy(thread->name,name);
    if(thread == main_thread)
    {
        thread->status = TASK_RUNNING;
    }
    else
    {
        thread->status = TASK_READY;
    }
    thread->priority = priority;
    thread->self_kstack = ((uint32_t*)(((uint32_t)thread) + PG_SIZE)); /* 线程内核态下的栈顶地址 */
    thread->stack_magic = 0x12345678;
    return;
}

struct task_struct* running_thread()
{
    uint32_t esp;
    __asm__ __volatile__
    (
        "mov %%esp,%0;"
        :"=g"(esp)
        :
        :
    );
    return (struct task_struct*)(esp & 0xfffff000);
}

void kernel_thread(thread_function* func,void* arg)
{
    intr_enable();
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
    thread_init(thread,name,priority);
    thread_create(thread,func,arg);
    /* 加入就绪队列 */
    fifo_put(&ready_thread,&thread);
    /* 加入线程队列 */
    fifo_put(&all_thread,&thread);

// #if false
//     __asm__ __volatile__
//     (
//         "movl %[kstack],%%esp;"
//         "pop %%ebp;"
//         "pop %%ebx;"
//         "pop %%edi;"
//         "pop %%esi;"
//         "ret"
//         :
//         :[kstack]"g"(thread->self_kstack)
//         :
//     );
//     return thread;
// #endif
    return thread;
}

static void make_main_thread(void)
{
    main_thread = running_thread();
    thread_init(main_thread,"main",31);
    fifo_put(&all_thread,&main_thread);
    return;
}

void schedule()
{
    struct task_struct* cur_thread = running_thread();
    if(cur_thread->status == TASK_RUNNING)
    {
        fifo_put(&ready_thread,&cur_thread);
        cur_thread->ticks = cur_thread->priority;
        cur_thread->status = TASK_RUNNING;
    }
    else
    {

    }
    struct task_struct* next;
    fifo_get(&ready_thread,&next);
    next->status = TASK_RUNNING;
    switch_to(cur_thread,next);


}