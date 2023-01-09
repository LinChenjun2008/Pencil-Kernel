#include <global.h>
#include <thread.h>
#include <debug.h>
#include <list.h>
#include <memory.h>
#include <string.h>

PRIVATE struct task_struct* main_thread;
PRIVATE struct ListNode* This_thread_tag;
PUBLIC struct List ready_list;
PUBLIC struct List all_list;

PRIVATE void kernel_thread(thread_function* func,void* arg)
{
    func(arg);
}

void thread_init(struct task_struct* thread,char* name,UINTN priority)
{
    memset(thread,0,sizeof(*thread));
    strcpy(thread->name,name);
    if(thread != main_thread)
    {
        thread->status = TASK_READY;
    }
    else
    {
        thread->status = TASK_RUNNING;
    }
    thread->priority = priority;
    thread->self_kstack = (UINTN*)(((UINTN)thread) + PCB_SIZE);
    thread->page_dir = NULL;

    thread->stack_magic = 0x12345678;
    return;
}

PUBLIC struct task_struct* running_thread()
{
    UINTN rsp;
    __asm__ __volatile__
    (
        "movq %%rsp,%0"
        :"=g"(rsp)
        :
        :
    );
    return (struct task_struct*)(rsp & 0xffffffffffff0000);
}

void thread_create(struct task_struct* thread,thread_function func,void* arg)
{
    thread->self_kstack -= sizeof(struct intr_stack);
    thread->self_kstack -= sizeof(struct thread_stack);

    struct thread_stack* kthread_stack;
    kthread_stack = ((struct thread_stack*)(thread->self_kstack));

    kthread_stack->rip = kernel_thread;
    kthread_stack->func = func;
    kthread_stack->func_arg = arg;
    kthread_stack->rbp = 0;
    kthread_stack->rbx = 0;
    kthread_stack->rsi = 0;
    kthread_stack->rdi = 0;
    return;
}

PUBLIC struct task_struct* thread_start(char* name,UINTN priority,thread_function func,void* arg)
{
    struct task_struct* thread = (struct task_struct*)kmalloc(PCB_SIZE);
    thread_init(thread,name,priority);
    thread_create(thread,func,arg);
    /* 加入就绪队列 */
    ASSERT(!list_find(&ready_list,&(thread->general_tag)));
    list_append(&ready_list,&(thread->general_tag));
    /* 加入线程队列 */
    ASSERT(!list_find(&all_list,&(thread->all_tag)));
    list_append(&all_list,&(thread->all_tag));
    return thread;
}

PRIVATE void make_main_thread(void)
{
    main_thread = running_thread();
    thread_init(main_thread,"Main thread",31);
    list_append(&all_list,&main_thread->all_tag);
    return;
}

void init_thread()
{
    list_init(&(ready_list));
    list_init(&(all_list));
    make_main_thread();
    return;
}

extern void switch_to(UINTN*,UINTN*);
__asm__
(
    "switch_to: \n\t"
    "pushq %rsi \n\t"
    "pushq %rdi \n\t"
    "pushq %rbx \n\t"
    "pushq %rbp \n\t"
    /* 接下来切换栈 */
    "movq %rsp,(%rcx) \n\t" // (%rcx)是current->self_kstack
    "movq (%rdx),%rsp \n\t" // (%rdx)是next->self_kstack
    /* 现在已经切换到next的栈了 */
    /* 所以下面pop的值并不是刚才push的值 */
    "popq %rbp \n\t"
    "popq %rbx \n\t"
    "popq %rdi \n\t"
    "popq %rsi \n\t"
    "ret"
);

PUBLIC void schedule()
{
    struct task_struct* cur_thread = running_thread();
    ASSERT(cur_thread->stack_magic == 0x12345678)
    {
        ASSERT(!(list_find(&ready_list,&cur_thread->general_tag)));
        list_append(&ready_list,&(cur_thread->general_tag));
        cur_thread->status = TASK_RUNNING;
    }
    struct task_struct* next = NULL;
    This_thread_tag = NULL;
    if(list_empty(&ready_list))
    {
        ASSERT(list_empty(&ready_list));
    }
    This_thread_tag = list_pop(&ready_list);
    next = container_of(struct task_struct,general_tag,This_thread_tag);
    next->status = TASK_RUNNING;
    switch_to(cur_thread->self_kstack,next->self_kstack);
    return;
}