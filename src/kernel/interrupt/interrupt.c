#include <interrupt.h>
#include <graphic.h>
#include <io.h>
#include <pic.h>
#include <stdio.h>
#include <syscall.h>
#include <thread.h>

#define IDT_DESC_CNT 0x41

void* intr_handle_entry[IDT_DESC_CNT];

PRIVATE char* intr_name[IDT_DESC_CNT] =
{
    "#DE 除法异常 Divide Error\n",
    "#DB 调试异常 Debug Exception\n",
    "NMI中断 NMI Interrupt\n",
    "#BP 断点 Breakpoint Exception\n",
    "#OF 溢出异常 Overflow Exception\n",
    "#BR 超出范围异常 BOUND Range Exceeded Exception\n",
    "#UD 无效指令异常 Invalid Opcode Exception\n",
    "#NM 设备不可用异常 Device Not Available Exception\n",
    "#DF 双重异常 Double Fault Exception\n",
    "协处理器段错误 Coprocessor Segment Overrun\n",
    "#TS 无效TSS异常 Invalid TSS Exception\n",
    "#NP 段不存在 Segment Not Present\n",
    "#SS 栈异常 Stack Fault Exception\n",
    "#GP 一般保护性异常 General Protection Exception\n",
    "#PF 缺页异常 Page-Fault Exception\n",
    "Reserved\n",
    "#MF x87浮点异常 x87 FPU Floating-Point Error\n",
    "#AC Alignment Check Exception\n",
    "#MC Machine-Check Exception\n",
    "#XF SIMD Floating-Point Exception\n",
};

typedef struct
{
    uint16_t offset_low;  /* 偏移15~0 */
    uint16_t selector;    /* 目标代码段选择子 */
    uint8_t  ist;         /* ist和空值 */
    uint8_t  attribute;   /* 属性 */
    uint16_t offset_mid;  /* 偏移31~16 */
    uint32_t offset_high; /* 偏移63~32 */
    uint32_t reserved;    /* 保留 */
} __attribute__((packed)) gate_desc_t;

PRIVATE gate_desc_t idt[IDT_DESC_CNT];

/** set_gatedesc
 * @brief          创建中断描述符
 * @param gd       中断描述符指针
 * @param func     对应的中断处理函数指针
 * @param selector 目标代码段选择子
 * @param ar       属性
*/
PRIVATE void set_gatedesc(gate_desc_t* gd,void* func,int selector,int ar)
{
    gd->offset_low = ((uint64_t)func) & 0x000000000000ffff;
    gd->selector = selector;
    gd->ist = 0;
    gd->attribute = (ar & 0xff);
    gd->offset_mid = (uint32_t)((((uint64_t)func) >> 16) & 0x000000000000ffff);
    gd->offset_high = (uint32_t)((((uint64_t)func) >> 32) & 0x00000000ffffffff);
    return;
}

/**
 * @brief 通用中断处理函数
*/
PRIVATE void ASMCALL general_intr_handler(wordsize_t nr,intr_stack_t* stack)
{
    if (nr == 0x27)
    {
        return;
    }
    pixel_t col =
    {
        .red = 0,
        .green = 0,
        .blue = 132,
    };
    view_fill(&(g_boot_info.graph_info),col,0,0,g_boot_info.graph_info.horizontal_resolution - 1,g_boot_info.graph_info.vertical_resolution - 1);
    position_t pos = {10,10};
    char s[512];
    col.red = 255;
    col.green = 255;
    col.blue = 255;
    fontsize_t font_size = 7;
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,":",font_size);
    pos.y += 2 * font_size;
    pos.x -= 2 * font_size;
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,"(\n",font_size);
    pos.x = 10;
    font_size = FONT_NORMAL;
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,
    "你的设备遇到问题,需要重新启动.\n"
    "接下来显示错误信息,然后你可以重新启动.\n\n"
    ,font_size);
    sprintf(s,"rax=%016x rbx=%016x rcx=%016x rdx=%016x\n",stack->rax,stack->rbx,stack->rcx,stack->rdx);
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,s,font_size);
    sprintf(s,"rsp=%016x rbp=%016x rsi=%016x rdi=%016x\n",stack,stack->rbp,stack->rsi,stack->rdi);
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,s,font_size);
    sprintf(s,"r8 =%016x r9 =%016x r10=%016x r11=%016x\n",stack->r8,stack->r9,stack->r10,stack->r11);
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,s,font_size);
    sprintf(s,"r12=%016x r13=%016x r14=%016x r15=%016x\n",stack->r12,stack->r13,stack->r14,stack->r15);
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,s,font_size);
    uint64_t crN;
    __asm__ __volatile__("movq %%cr2,%%rax":"=a"(crN)::);
    sprintf(s,"cr2 = %016x\n",crN);
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,s,font_size);
    __asm__ __volatile__("movq %%cr3,%%rax":"=a"(crN)::);
    sprintf(s,"cr3 = %016x\n",crN);
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,s,font_size);
    sprintf(s,"CS:RIP %04x:%016x\n",stack->cs,stack->rip);
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,s,font_size);
    sprintf(s,"nr: 0x%02x 错误码 ERROR CODE: %016x\n",nr,stack->error_code);
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,s,font_size);
    if (nr <= 0x1f)
    {
        vput_utf8_str(&(g_boot_info.graph_info),&pos,col,"Error: ",font_size);
        vput_utf8_str(&(g_boot_info.graph_info),&pos,col,intr_name[nr],font_size);
    }
    pos.x = 10;
    sprintf(s,"线程: %s (ID: %d)\n",running_thread()->name,running_thread()->pid);
    vput_utf8_str(&(g_boot_info.graph_info),&pos,col,s,font_size);

    wordsize_t rbp = stack->rbp;
    char* name;
    // 打印内核层函数调用顺序
    if (address_available((wordsize_t)stack->rip))
    {
        name = address2symbol((wordsize_t)stack->rip);
        if (name)
        {
            vput_utf8_str(&(g_boot_info.graph_info),&pos,col,name,font_size);
        }
    }
    int i;
    for (i = 0;i < 8;i++)
    {
        if (address_available(*((wordsize_t*)rbp + 1)))
        {
            name = address2symbol(*((wordsize_t*)rbp + 1));
            if (name)
            {
                vput_utf8_str(&(g_boot_info.graph_info),&pos,col," <+--- ",font_size);
                vput_utf8_str(&(g_boot_info.graph_info),&pos,col,name,font_size);
            }
        }
        else
        {
            break;
        }
        rbp = *((wordsize_t*)rbp);
    }
    if (i >= 8)
    {
        vput_utf8_str(&(g_boot_info.graph_info),&pos,col," <+--- [...]",font_size);
    }
    while (1){;}
}

#define INTR_HANDLER(ENTRY,NR,ERROR_CODE) extern void ENTRY();
#include <intrlist.h>
#undef INTR_HANDLER

/**
 * @brief 创建idt和中断处理接口
*/
PRIVATE void idt_desc_init(void)
{
    int i;
    for (i = 0;i < IDT_DESC_CNT;i++)
    {
        set_gatedesc(&idt[i],asm_intr0x0d_handler,SELECTOR_CODE64_K,AR_IDT_DESC_DPL3);
        intr_handle_entry[i] = general_intr_handler;
    }
    #define INTR_HANDLER(ENTRY,NR,ERROR_CODE) set_gatedesc(&idt[NR],ENTRY,SELECTOR_CODE64_K,AR_IDT_DESC_DPL0);
    #include <intrlist.h>
    #undef INTR_HANDLER
    set_gatedesc(&idt[SYSCALL_INTR],asm_syscall_handler,SELECTOR_CODE64_K,AR_IDT_DESC_DPL3);
}

PUBLIC void init_interrupt()
{
    idt_desc_init();
    uint128_t idt_ptr = (((uint128_t)0 + ((uint128_t)((uint64_t)idt))) << 16) | (sizeof(idt) - 1);
    __asm__ __volatile__ ("lidt %[idt_ptr]"::[idt_ptr]"m"(idt_ptr):);
    return;
}

PUBLIC void register_handle(uint8_t nr,void* handle)
{
    intr_handle_entry[nr] = handle;
    return;
}

#define INTR_HANDLER(ENTRY,NR,ERROR_CODE) \
__asm__ \
( \
    ".global "#ENTRY" \n\t" \
    #ENTRY": \n\t" \
    #ERROR_CODE"\n\t" \
 \
    "pushq %r15 \n\t" \
    "pushq %r14 \n\t" \
    "pushq %r13 \n\t" \
    "pushq %r12 \n\t" \
    "pushq %r11 \n\t" \
    "pushq %r10 \n\t" \
    "pushq %r9 \n\t" \
    "pushq %r8 \n\t" \
 \
    "pushq %rdi \n\t" \
    "pushq %rsi \n\t" \
    "pushq %rbp \n\t" \
    "pushq %rdx \n\t" \
    "pushq %rcx \n\t" \
    "pushq %rbx \n\t" \
    "pushq %rax \n\t" \
 \
    "movq  $0,%rax \n\t" \
    "movw  %gs,%ax \n\t" \
    "pushq %rax \n\t" \
    "movw  %fs,%ax \n\t" \
    "pushq %rax \n\t" \
    "movw  %es,%ax \n\t" \
    "pushq %rax \n\t" \
    "movw  %ds,%ax \n\t" \
    "pushq %rax \n\t" \
 \
    "movq $"#NR",%rdi \n\t" \
    "movq %rsp,%rsi \n\t" \
 \
    "leaq intr_handle_entry(%rip),%rax \n\t"/* rax = &intr_handle_entry */    \
    "movq $"#NR",%rbx \n\t"              /*rax = &intr_handle_entry[NR] */ \
    "callq *(%rax,%rbx,8) \n\t" \
    "jmp intr_exit" \
);

#include <intrlist.h>
#undef INTR_HANDLER

__asm__
(
    ".global intr_exit \n\t"
    "intr_exit: \n\t"

    "popq %rax \n\t"
    "movw  %ax,%ds \n\t"
    "popq %rax \n\t"
    "movw  %ax,%es \n\t"
    "popq %rax \n\t"
    "movw  %ax,%fs \n\t"
    "popq %rax \n\t"
    "movw  %ax,%gs \n\t"

    "popq %rax \n\t"
    "popq %rbx \n\t"
    "popq %rcx \n\t"
    "popq %rdx \n\t"
    "popq %rbp \n\t"
    "popq %rsi \n\t"
    "popq %rdi \n\t"

    "popq %r8 \n\t"
    "popq %r9 \n\t"
    "popq %r10 \n\t"
    "popq %r11 \n\t"
    "popq %r12 \n\t"
    "popq %r13 \n\t"
    "popq %r14 \n\t"
    "popq %r15 \n\t"

    "addq $8,%rsp \n\t"
    "iretq"
);

PUBLIC intr_status_t intr_enable()
{
    intr_status_t old_status;
    if (intr_get_status() == INTR_ON)
    {
        old_status = INTR_ON;
        return old_status;
    }
    else
    {
        old_status = INTR_OFF;
        io_sti();
        return old_status;
    }
}

PUBLIC intr_status_t intr_disable()
{
    intr_status_t old_status;
    if (intr_get_status() == INTR_ON)
    {
        old_status = INTR_ON;
        io_cli();
        return old_status;
    }
    else
    {
        old_status = INTR_OFF;
        return old_status;
    }
}

PUBLIC intr_status_t intr_set_status(intr_status_t status)
{
    return (status == INTR_ON ? intr_enable() : intr_disable());
}

PUBLIC intr_status_t intr_get_status()
{
    /* 判断flage寄存器的if位 */
    return ((get_flages() & 0x00000200) ? INTR_ON : INTR_OFF);
}