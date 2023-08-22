#include <process.h>
#include <interrupt/interrupt.h>
#include <memory.h>
#include <std/string.h>
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
    proc_stack->rflags = (EFLAGS_IOPL_0 | EFLAGS_MBS | EFLAGS_IF_1);

    // 分配用户态下的栈
    void* pstack = alloc_physical_page(1);
    cur->self_ustack = pstack;
    page_map(cur->page_dir,pstack,(void*)USER_STACK_VADDR_BASE);
    proc_stack->rsp = USER_STACK_VADDR_BASE + PG_SIZE;
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
    uint64_t* pgdir_v = KADDR_P2V(pmalloc(PT_SIZE));
    if (pgdir_v == NULL)
    {
        return NULL;
    }
    memset(pgdir_v,0,PT_SIZE);
    memcpy(pgdir_v + 0x100,(uint64_t*)KADDR_P2V(KERNEL_PAGE_DIR_TABLE_POS)
                            + 0x100,2048);
    return (uint64_t*)KADDR_V2P(pgdir_v);
}

PRIVATE void user_vaddr_table_init(task_struct_t* pthread)
{
    size_t entry_size          = sizeof(*pthread->vaddr_table.entries);
    uint64_t number_of_entries = 1024;
    void* p;
    p = KADDR_P2V(pmalloc(entry_size * number_of_entries));
    allocate_table_init(&pthread->vaddr_table,p,number_of_entries);

    uint64_t index = USER_VADDR_START / PG_SIZE;
    uint64_t cnt   = (USER_STACK_VADDR_BASE - USER_VADDR_START) / PG_SIZE;
    free_units(&pthread->vaddr_table,index,cnt);
    return;
}

PUBLIC task_struct_t* process_execute(void* process_name,char* name)
{
    task_struct_t* pthread = KADDR_P2V(pmalloc(PCB_SIZE));
    thread_init(pthread,name,31);
    thread_create(pthread,start_process,process_name);
    pthread->page_dir = create_page_dir();
    user_vaddr_table_init(pthread);
    /* 加入队列,等待调度 */
    pthread->general_tag.container = pthread;
    pthread->all_tag.container     = pthread;

    intr_status_t intr_status = intr_disable();
    list_append(&all_list,&(pthread->all_tag));
    list_append(&ready_list,&(pthread->general_tag));
    intr_set_status(intr_status);
    return pthread;
}