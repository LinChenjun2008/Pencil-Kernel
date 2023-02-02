#include <global.h>
#include <thread.h>
#include <debug.h>
#include <bitmap.h>
#include <sync.h>
#include <interrupt.h>
#include <list.h>
#include <memory.h>
#include <graphic.h>
#include <stdio.h>
#include <string.h>
#include <syscall.h>

#include <process.h>

PRIVATE struct task_struct* main_thread;
PRIVATE struct task_struct* idle_thread;
PUBLIC struct List ready_list;
PUBLIC struct List all_list;

struct
{
    struct Lock lock;
    struct Bitmap bitmap;
    pid_t first_pid;
}pid_pool;


/* 用于分配pid 可分配的pid为0~1024 */
PRIVATE uint8_t pid_bits[128] = { 0 };

PRIVATE pid_t alloc_pid()
{
    pid_t pid;
    lock_acquire(&(pid_pool.lock));
    int idx = bitmap_alloc(&(pid_pool.bitmap),1);
    bitmap_set(&(pid_pool.bitmap),idx,1);
    lock_release(&(pid_pool.lock));
    pid = idx + pid_pool.first_pid;
    return pid;
}

PRIVATE void kernel_thread(void)
{
    UINTN __func;
    UINTN __arg;
    // 获取暂存的值
    __asm__ __volatile__
    (
        "movq %%rsi,%[func] \n\t"
        "movq %%rdi,%[arg] \n\t"
        "movq $0,%%rsi \n\t"
        "movq $0,%%rdi \n\t"
        :[func]"=g"(__func),[arg]"=g"(__arg)
        :
        :"rsi","rdi"
    );
    intr_enable();
    thread_function* func = (thread_function*)__func;
    void* arg = (void*)__arg;
    func(arg);
    return;
}

PUBLIC void thread_init(struct task_struct* thread,char* name,UINTN priority)
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
    thread->ticks = 0;
    thread->elapsed_ticks = 0;
    thread->all_tag.container = thread;
    thread->general_tag.container = thread;
    thread->pid = alloc_pid();
    thread->self_kstack = (UINTN)(((MEMORY_ADDRESS)thread) + PCB_SIZE);
    ASSERT(thread->self_kstack != 0);
    thread->page_dir = NULL;
    memset(&thread->msg,0,sizeof(struct MESSAGE));
    thread->send_to = NO_TASK;
    thread->recv_from = NO_TASK;
    list_init(&(thread->sender_list));
    thread->stack_magic = StackMagic;
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
    ASSERT(thread->self_kstack != 0);
    struct thread_stack* kthread_stack;
    kthread_stack = ((struct thread_stack*)(thread->self_kstack));

    kthread_stack->rip = kernel_thread;
    kthread_stack->rbp = 0;
    kthread_stack->rbx = 0;
    kthread_stack->rsi = (UINTN)func; /* 借用rsi暂存 */
    kthread_stack->rdi = (UINTN)arg;  /* 借用rdi暂存 */
    return;
}

PUBLIC struct task_struct* thread_start(char* name,UINTN priority,thread_function func,void* arg)
{
    struct task_struct* thread = (struct task_struct*)kAddrP2V(kmalloc(PCB_SIZE));
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

PRIVATE void idle(void* arg __attribute__((unused)))
{
    while(1)
    {
        thread_block(TASK_BLOCKED);
        __asm__ __volatile__("sti\n\t""hlt\n\t":::);
    }
    return;
}

void init_thread()
{
    list_init(&(ready_list));
    list_init(&(all_list));
    pid_pool.first_pid = 0;
    pid_pool.bitmap.map = pid_bits;
    pid_pool.bitmap.btmp_bytes_len = 128;
    memset(pid_bits,0,128);
    bitmap_init(&pid_pool.bitmap);
    lock_init(&pid_pool.lock);

    make_main_thread();
    idle_thread = thread_start("idle",31,idle,NULL);
    return;
}

void switch_to(void* cur,void* next)
{
    __asm__ __volatile__
    (
        "movq %[cur],%%r8 \n\t"
        "movq %[next],%%r9 \n\t"
        "leaq asm_switch_to(%%rip),%%rax \n\t"
        "callq *%%rax \n\t"
        :
        :[cur]"r"(cur),[next]"r"(next)
    );
}

__asm__
(
    "asm_switch_to: \n\t"
    // 栈中这里是返回地址
    "pushq %rsi \n\t"
    "pushq %rdi \n\t"
    "pushq %rbx \n\t"
    "pushq %rbp \n\t"

    /* 接下来切换栈 */
    "movq %rsp,(%r8) \n\t"
    "movq (%r9),%rsp \n\t"
    /* 现在已经切换到next的栈了 */
    /* 所以下面pop的值并不是刚才push的值 */

    "popq %rbp \n\t"
    "popq %rbx \n\t"
    "popq %rdi \n\t"
    "popq %rsi \n\t"
    "ret \n\t"
);

PUBLIC void schedule()
{
    struct task_struct* cur_thread = running_thread();
    ASSERT(cur_thread->all_tag.container == running_thread());
    ASSERT(cur_thread->general_tag.container == running_thread());
    ASSERT(cur_thread->stack_magic == StackMagic); /* 确保栈不溢出 */
    if(cur_thread->status == TASK_RUNNING)
    {
        ASSERT(!(list_find(&ready_list,&cur_thread->general_tag)));
        list_append(&ready_list,&(cur_thread->general_tag));
        cur_thread->status = TASK_RUNNING;
    }
    struct task_struct* next = NULL;
    if(list_empty(&ready_list))
    {
        thread_unblock(idle_thread);
    }
    struct ListNode* next_thread_tag = NULL;
    next_thread_tag = list_pop(&ready_list);
    next = next_thread_tag->container;

    next->status = TASK_RUNNING;

    process_activate(next);

    switch_to(&cur_thread->self_kstack,&next->self_kstack);
    return;
}

PUBLIC void thread_block(enum task_status status)
{
    ASSERT(status != TASK_RUNNING && status != TASK_READY);
    enum intr_status old_status = intr_disable();
    struct task_struct* cur_thread = running_thread();
    cur_thread->status = status;
    ASSERT(cur_thread->status == status);
    schedule();
    intr_set_status(old_status);
    return;
}

PUBLIC void thread_unblock(struct task_struct* pthread)
{
    enum intr_status old_status = intr_disable();
    if(!list_find(&all_list,&pthread->all_tag))
    {
        PANIC("thread_unblock: Error: thread not create");
    }
    if(pthread->status != TASK_READY)
    {
        ASSERT(!list_find(&ready_list,&(pthread->general_tag)));
        if(list_find(&ready_list,&(pthread->general_tag)))
        {
            PANIC("thread unblock: blocked thread in ready list");
        }
        list_push(&ready_list,&(pthread->general_tag));
        pthread->status = TASK_READY;
    };
    intr_set_status(old_status);
    return;
}

/* list_traversal的回调函数pid_check */
PRIVATE BOOL pid_check(struct ListNode* pNode,pid_t pid)
{
    return (((struct task_struct*)pNode->container)->pid == pid);
}

PUBLIC struct task_struct* pid2thread(pid_t pid)
{
    if(pid > 1024)
    {
        return NULL;
    }
    struct ListNode* pNode = list_traversal(&all_list,pid_check,pid);
    if(pNode == NULL)
    {
        return NULL;
    }
    return (struct task_struct*)pNode->container;
}