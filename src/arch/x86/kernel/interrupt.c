#include "interrupt.h"

#include "global.h"
#include "io.h"
#include "print.h"
#include "stdint.h"


struct gate_desc idt[IDT_DESC_CNT];         /* idt描述符 */
extern void* intr_entry_table[IDT_DESC_CNT];/* interrupt.asm中的中断程序入口地址表 */
char* intr_name[IDT_DESC_CNT];              /* 保存异常的名字 */
void* idt_table[IDT_DESC_CNT];              /* 处理中断的函数 */

void init_pic()
{
    io_out8(PIC_M_CTRL, 0x11  ); /* 边沿触发模式 */
    io_out8(PIC_M_DATA, 0x20  ); /* IRQ0-7由INT20-27接收 */
    io_out8(PIC_M_DATA, 1 << 2); /* PIC1由IRQ2连接*/
    io_out8(PIC_M_DATA, 0x01  );

    io_out8(PIC_S_CTRL, 0x11  ); /* 与上方类似 */
    io_out8(PIC_S_DATA, 0x28  ); /* IRQ8-15 INT28-2f */
    io_out8(PIC_S_DATA, 2     ); /* PIC1 IRQ2 */
    io_out8(PIC_S_DATA, 0x01  );

    io_out8(PIC_M_DATA,  0xfe  ); /* 11111011 PIC1以外全部禁止 */
    io_out8(PIC_S_DATA,  0xff  ); /* 11111111 禁止所有中断 */

    return;
}

/* idt_desc_init
* 功能:初始化中断描述符表
*/
void idt_desc_init(void)
{
    int i;
    for(i = 0;i < IDT_DESC_CNT;i++)
    {
        set_gatedesc(&idt[i],intr_entry_table[i],SelectorCode32,AR_IDT_DESC_DPL0);
    }
    return;
}

/* set_gatedesc
* 功能:创建中断描述符
* gd       :中断描述符指针
* func     :对应的中断处理函数指针
* selector :目标代码段选择子
* ar       :属性
*/
void set_gatedesc(struct gate_desc* gd,void* func,int selector,int ar)
{
    gd->offset_low = ((uint32_t)func) & 0x0000ffff;
    gd->selector = selector;
    gd->dcount = ((ar >> 8) & 0xff);
    gd->attribute = (ar & 0xff);
    gd->offset_high = ((((uint32_t)func) >> 16) & 0xffff);
    return;
}

void init_idt()
{
    idt_desc_init();
    init_pic();
    uint64_t idt_ptr = ((sizeof(idt)-1) | ((uint64_t)(((uint32_t)idt) << 16)));
    exception_init();
    asm volatile("lidt %0"::"m"(idt_ptr));
    return;
}

void general_intr_handler(uint8_t vector_nr)
{
    io_out8(PIC_S_CTRL,0x20);
    io_out8(PIC_M_CTRL,0x20);
    if(vector_nr == 0x27 || vector_nr == 0x2f)
    {
        return;
    }
    return;
}

void exception_init()
{
    int i;
    for (i = 0; i < IDT_DESC_CNT; i++)
    {
        idt_table[i] = general_intr_handler;
        intr_name[i] = "unknown";
    }
    intr_name[0] = "#DE Divide Error";
    intr_name[1] = "#DB Debug Exception";
    intr_name[2] = "NMI Interrupt";
    intr_name[3] = "#BP Breakpoint Exception";
    intr_name[4] = "#OF Overflow Exception";
    intr_name[5] = "#BR BOUND Range Exceeded Exception";
    intr_name[6] = "#UD Invalid Opcode Exception";
    intr_name[7] = "#NM Device Not Available Exception";
    intr_name[8] = "#DF Double Fault Exception";
    intr_name[9] = "Coprocessor Segment Overrun";
    intr_name[10] = "#TS Invalid TSS Exception";
    intr_name[11] = "#NP Segment Not Present";
    intr_name[12] = "#SS Stack Fault Exception";
    intr_name[13] = "#GP General Protection Exception";
    intr_name[14] = "#PF Page-Fault Exception";
    intr_name[15] = "Reserved";
    intr_name[16] = "#MF x87 FPU Floating-Point Error";
    intr_name[17] = "#AC Alignment Check Exception";
    intr_name[18] = "#MC Machine-Check Exception";
    intr_name[19] = "#XF SIMD Floating-Point Exception";
    return;
}

/* intr_enable
* 功能:开中断,并返回开中断前的状态
*/
enum intr_status intr_enable()
{
    enum intr_status old_status;
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

/* intr_disable
* 功能:关中断,并返回关中断前的状态
*/
enum intr_status intr_disable()
{
    enum intr_status old_status;
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

/* intr_set_status
* 功能:将中断状态设为status
*/
enum intr_status intr_set_status(enum intr_status status)
{
    return (status == INTR_ON ? intr_enable() : intr_disable());
}

/* intr_get_status
* 功能:获取当前中断状态
*/
enum intr_status intr_get_status()
{
    return ((get_flages() & 0x00000200) ? INTR_ON : INTR_OFF);
}