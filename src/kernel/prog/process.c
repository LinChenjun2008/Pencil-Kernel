#include <process.h>
#include <interrupt.h>
#include <memory.h>
#include <string.h>
#include <tss.h>

PRIVATE void start_process(void* process_name)
{
    void* func = process_name;
    task_struct_t* cur = running_thread();
    cur->self_kstack += sizeof(thread_stack_t);
    intr_stack_t* proc_stack = (intr_stack_t*)cur->self_kstack;
    /* 寄存器初始值,置为0 */

    proc_stack->r15 = 0;
    proc_stack->r14 = 0;
    proc_stack->r13 = 0;
    proc_stack->r12 = 0;
    proc_stack->r11 = 0;
    proc_stack->r10 = 0;
    proc_stack->r9 = 0;
    proc_stack->r8 = 0;

    proc_stack->rdi = 0;
    proc_stack->rsi = 0;
    proc_stack->rbp = 0;
    proc_stack->rdx = 0;
    proc_stack->rcx = 0;
    proc_stack->rbx = 0;
    proc_stack->rax = 0;

    proc_stack->gs = SELECTOR_DATA64_U;
    proc_stack->fs = SELECTOR_DATA64_U;
    proc_stack->es = SELECTOR_DATA64_U;
    proc_stack->ds = SELECTOR_DATA64_U;
    proc_stack->rip = func;
    proc_stack->cs = SELECTOR_CODE64_U;
    proc_stack->rflages = (EFLAGS_IOPL_0 | EFLAGS_MBS | EFLAGS_IF_1);

    // 分配用户态下的栈
    void* pstack = pmalloc(PCB_SIZE);
    page_map(cur->page_dir,pstack,(void*)USER_STACK_VADDR_BASE);
    // 基地址 + pcb在页中的偏移 + pcb大小
    proc_stack->rsp = USER_STACK_VADDR_BASE + ((uintptr_t)pstack & (PG_SIZE - 1)) + PCB_SIZE;

    proc_stack->ss = SELECTOR_DATA64_U;
    __asm__ __volatile__
    (
        "movq %0, %%rsp\n\t"
        "jmp intr_exit"
        :
        :"g"(proc_stack)
        :"memory"
    );
}

/* page_dir_activate
* 激活页表
*/
PRIVATE void page_dir_activate(task_struct_t* pthread)
{
    void* page_dir_table_pos = (void*)KERNEL_PAGE_DIR_TABLE_POS;
    if (pthread->page_dir != NULL)
    {
        page_dir_table_pos = pthread->page_dir;
    }
    __asm__ __volatile__("movq %0,%%cr3"::"r"(page_dir_table_pos):"memory");
    return;
}

/* process_activate
* 激活页表,并更新0特权级下的栈
*/
PUBLIC void process_activate(task_struct_t* pthread)
{
    page_dir_activate(pthread);
    if (pthread->page_dir != NULL)
    {
        update_tss_rsp0(pthread);
    }
    return;
}

/* create_page_dir
* 为进程创建页目录表
*/
PRIVATE uint64_t* create_page_dir(void)
{
    uint64_t pgdir_v = (uint64_t)pmalloc(PT_SIZE);
    if (pgdir_v == (uint64_t)NULL)
    {
        return NULL;
    }
    memcpy((uint64_t*)(pgdir_v + 0x800),(uint64_t*)(KERNEL_PAGE_DIR_TABLE_POS + 0x800),2048);
    memcpy((uint64_t*)(pgdir_v + 0x000),(uint64_t*)(KERNEL_PAGE_DIR_TABLE_POS + 0x000),2048);
    return (uint64_t*)pgdir_v;
}

PUBLIC task_struct_t* process_execute(void* process_name,char* name)
{
    task_struct_t* pthread = pmalloc(PCB_SIZE);
    thread_init(pthread,name,31);
    thread_create(pthread,start_process,process_name);
    pthread->page_dir = create_page_dir();

    /* 加入队列,等待调度 */
    pthread->general_tag.container = pthread;
    pthread->all_tag.container     = pthread;

    intr_status_t intr_status = intr_disable();
    list_append(&all_list,&(pthread->all_tag));
    list_append(&ready_list,&(pthread->general_tag));
    intr_set_status(intr_status);
    return pthread;
}