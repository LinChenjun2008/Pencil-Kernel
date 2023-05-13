#include <process.h>
#include <debug.h>
#include <interrupt.h>
#include <list.h>
#include <memory.h>
#include <string.h>
#include <tss.h>

void start_process(void* process_name)
{
    void* func = process_name;
    task_struct_t* cur = running_thread();
    cur->self_kstack += sizeof(thread_stack_t);
    intr_stack_t* proc_stack = (intr_stack_t*)cur->self_kstack;
    /* 寄存器初始值,置为0 */
    proc_stack->gs = SELECTOR_DATA64_U;
    proc_stack->fs = SELECTOR_DATA64_U;
    proc_stack->es = SELECTOR_DATA64_U;
    proc_stack->ds = SELECTOR_DATA64_U;
    proc_stack->rip = func;
    proc_stack->cs = SELECTOR_CODE64_U;
    proc_stack->rflages = (EFLAGS_IOPL_0 | EFLAGS_MBS | EFLAGS_IF_1);

    proc_stack->rsp = ((uintptr_t)kmalloc(PCB_SIZE)) + PCB_SIZE;

    // asm("int $0x80");
    proc_stack->ss = SELECTOR_DATA64_U;
    __asm__ __volatile__
    (
        "movq %0, %%rsp\n\t"
        ".1: jmp .1 \n\t"
        "leaq intr_exit(%%rip),%%rax \n\t"
        "jmp *%%rax \n\t"
        :
        :"g"(proc_stack)
        :"memory"
    );
}

/* page_dir_activate
* 激活页表
*/
void page_dir_activate(task_struct_t* pthread)
{
    void* page_dir_table_pos = (void*)KERNEL_PAGE_DIR_TABLE_POS;
    if (pthread->page_dir != NULL)
    {
        page_dir_table_pos = pthread->page_dir;
    }
    ASSERT(page_dir_table_pos != NULL)
    __asm__ __volatile__
    (
        "movq %0,%%cr3"
        :
        :"r"(page_dir_table_pos)
        :"memory"
    );
    return;
}

/* process_activate
* 激活页表,并更新0特权级下的栈
*/
void process_activate(task_struct_t* pthread)
{
    ASSERT(pthread != NULL);
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
UINTN* create_page_dir(void)
{
    UINTN pgdir_v = (UINTN)kmalloc(4096);
    if (pgdir_v == (UINTN)NULL)
    {
        return NULL;
    }
    memcpy((UINTN*)(pgdir_v + 0x800),(UINTN*)(KERNEL_PAGE_DIR_TABLE_POS + 0x800),2048);
    memcpy((UINTN*)(pgdir_v + 0x000),(UINTN*)(KERNEL_PAGE_DIR_TABLE_POS + 0x000),2048);
    return (UINTN*)pgdir_v;
}

/* create_user_vaddr_memman
* 为进程创建memman
*/
void create_user_vaddr_memman(task_struct_t* user_prog __attribute__((unused)))
{
    return;
}

void process_execute(void* process_name,char* name)
{
    intr_status_t status = intr_disable();
    task_struct_t* pthread;
    pthread = thread_start(name,31,start_process,process_name);
    pthread->page_dir = create_page_dir();
    intr_set_status(status);
    return;
}