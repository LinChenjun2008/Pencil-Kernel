#include <thread.h>
#include <bitmap.h>
#include <debug.h>
#include <interrupt.h>
#include <memory.h>
#include <process.h>
#include <string.h>
#include <sync.h>
#include <syscall.h>

PRIVATE task_struct_t* main_thread;
PRIVATE task_struct_t* idle_thread;
PUBLIC list_t ready_list;
PUBLIC list_t all_list;

struct
{
    lock_t lock;
    bitmap_t bitmap;
    pid_t first_pid;
} pid_pool;


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
    uintptr_t  func;
    wordsize_t arg;
    fpu_init();
    // 获取暂存的值
    __asm__ __volatile__
    (
        "movq %%rsi,%[func] \n\t"
        "movq %%rdi,%[arg] \n\t"
        "movq $0,%%rsi \n\t"
        "movq $0,%%rdi \n\t"
        :[func]"=g"(func),[arg]"=g"(arg)
        :
        :"rsi","rdi"
    );
    intr_enable();
    ((thread_function_t*)func)((void*)arg);
    return;
}

PUBLIC void thread_init(task_struct_t* thread,char* name,unsigned long long int priority)
{
    memset(thread,0,sizeof(*thread));
    strcpy(thread->name,name);
    if (thread != main_thread)
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
    thread->self_kstack = (uint64_t*)((uintptr_t)thread + PCB_SIZE);
    thread->page_dir = NULL;
    memset(&thread->msg,0,sizeof(message_t));
    thread->send_to = NO_TASK;
    thread->recv_from = NO_TASK;
    list_init(&(thread->sender_list));
    thread->stack_magic = STACK_MAGIC;
    return;
}

PUBLIC task_struct_t* running_thread()
{
    wordsize_t rsp;
    __asm__ __volatile__
    (
        "movq %%rsp,%0"
        :"=g"(rsp)
        :
        :
    );
    return (task_struct_t*)(rsp & ~(PCB_SIZE - 1));
}

PUBLIC void thread_create(task_struct_t* thread,thread_function_t func,void* arg)
{
    thread->self_kstack -= sizeof(intr_stack_t);
    thread->self_kstack -= sizeof(unsigned long long int);
    thread_stack_t* kthread_stack;
    kthread_stack = (thread_stack_t*)thread->self_kstack;

    kthread_stack->rip = kernel_thread;
    kthread_stack->rbp = 0;
    kthread_stack->rbx = 0;
    kthread_stack->rsi = (wordsize_t)func; /* 借用rsi暂存 */
    kthread_stack->rdi = (wordsize_t)arg;  /* 借用rdi暂存 */
    return;
}

PUBLIC task_struct_t* thread_start(char* name,unsigned long long int priority,thread_function_t func,void* arg)
{
    task_struct_t* thread = (task_struct_t*)KADDR_P2V(pmalloc(PCB_SIZE));
    thread_init(thread,name,priority);
    thread_create(thread,func,arg);

    list_append(&ready_list,&(thread->general_tag));
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
    while (1)
    {
        thread_block(TASK_BLOCKED);
        __asm__ __volatile__("sti\n\t""hlt\n\t":::);
    }
    return;
}

PUBLIC void init_thread()
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

PRIVATE void switch_to(void* cur,void* next)
{
    __asm__ __volatile__
    (
        "pushq %[cur] \n\t"
        "pushq %[next] \n\t"
        "leaq asm_switch_to(%%rip),%%rax \n\t"
        "callq *%%rax \n\t"
        :
        :[cur]"g"(cur),[next]"g"(next)
    );
}

__asm__
(
    "asm_switch_to: \n\t"
    // cur
    // next
    // 栈中这里是返回地址
    "pushq %rsi \n\t"
    "pushq %rdi \n\t"
    "pushq %rbx \n\t"
    "pushq %rbp \n\t"

    "pushq %r12 \n\t"
    "pushq %r13 \n\t"
    "pushq %r14 \n\t"
    "pushq %r15 \n\t"

    /* 接下来切换栈 */
    "movq 80(%rsp),%rax \n\t"
    "movq %rsp,(%rax) \n\t"
    "movq 88(%rsp),%rax \n\t"
    "movq (%rax),%rsp \n\t"
    /* 现在已经切换到next的栈了 */
    /* 所以下面pop的值并不是刚才push的值 */
    "popq %r15 \n\t"
    "popq %r14 \n\t"
    "popq %r13 \n\t"
    "popq %r12 \n\t"

    "popq %rbp \n\t"
    "popq %rbx \n\t"
    "popq %rdi \n\t"
    "popq %rsi \n\t"

    "retq \n\t"
);

PUBLIC void schedule()
{
    task_struct_t* cur_thread = running_thread();
    ASSERT(cur_thread->all_tag.container == running_thread());
    ASSERT(cur_thread->general_tag.container == running_thread());
    ASSERT(cur_thread->stack_magic == STACK_MAGIC); /* 确保栈不溢出 */
    if (cur_thread->status == TASK_RUNNING)
    {
        ASSERT(!(list_find(&ready_list,&cur_thread->general_tag)));
        list_append(&ready_list,&(cur_thread->general_tag));
        cur_thread->status = TASK_RUNNING;
    }
    task_struct_t* next = NULL;
    if (list_empty(&ready_list))
    {
        thread_unblock(idle_thread);
    }
    list_node_t* next_thread_tag = NULL;
    next_thread_tag = list_pop(&ready_list);
    next = next_thread_tag->container;

    next->status = TASK_RUNNING;

    process_activate(next);
    fpu_set(cur_thread,next);
    switch_to(&cur_thread->self_kstack,&next->self_kstack);
    return;
}

PUBLIC void thread_block(task_status_t status)
{
    ASSERT(status != TASK_RUNNING && status != TASK_READY);
    intr_status_t old_status = intr_disable();
    task_struct_t* cur_thread = running_thread();
    cur_thread->status = status;
    ASSERT(cur_thread->status == status);
    schedule();
    intr_set_status(old_status);
    return;
}

PUBLIC void thread_unblock(task_struct_t* pthread)
{
    intr_status_t old_status = intr_disable();
    if (!list_find(&all_list,&pthread->all_tag))
    {
        PANIC("thread_unblock: Error: thread not create");
    }
    if (pthread->status != TASK_READY)
    {
        ASSERT(!list_find(&ready_list,&(pthread->general_tag)));
        if (list_find(&ready_list,&(pthread->general_tag)))
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
PRIVATE BOOL pid_check(list_node_t* node,pid_t pid)
{
    return (((task_struct_t*)node->container)->pid == pid);
}

PUBLIC task_struct_t* pid2thread(pid_t pid)
{
    if (pid > 1024)
    {
        return NULL;
    }
    list_node_t* node = list_traversal(&all_list,pid_check,pid);
    if (node == NULL)
    {
        return NULL;
    }
    return (task_struct_t*)node->container;
}