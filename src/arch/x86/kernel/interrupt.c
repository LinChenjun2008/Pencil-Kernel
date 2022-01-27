#include "interrupt.h"

#include "stdint.h"
#include "global.h"

#define PIC_M_CTRL 0x20	/* 8259A主片的控制端口是0x20 */
#define PIC_M_DATA 0x21	/* 8259A主片的数据端口是0x21 */
#define PIC_S_CTRL 0xa0	/* 8259A从片的控制端口是0xa0 */
#define PIC_S_DATA 0xa1	/* 8259A从片的数据端口是0xa1 */

#define IDT_DESC_CNT 0x2f /* 总共支持0x2f个中断 */

/*中断门描述符结构体*/
struct gate_desc {
   uint16_t offset_low; /* 偏移15~0 */
   uint16_t selector;   /* 目标代码段选择子 */
   uint8_t dcount;      /* 保留值和空值 */
   uint8_t attribute;   /* 属性 */
   uint16_t offset_high;/* 偏移31~16 */
};

struct gate_desc idt[IDT_DESC_CNT];
extern void* intr_entry_table[IDT_DESC_CNT];

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

    io_out8(PIC_M_DATA,  0xff  ); /* 11111011 PIC1以外全部禁止 */
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
    gd->offset_high = ((offset >> 16) & 0xffff);
    return;
}

void init_idt()
{
    idt_desc_init()
    init_pic()
    uint64_t idt_ptr = ((sizeof(idt)-1) | ((uint64_t)(((uint32_t)idt) << 16)));
    load_idt(&idt_ptr);
    return;
}