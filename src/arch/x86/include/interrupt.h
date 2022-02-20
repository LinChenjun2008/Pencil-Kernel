#ifndef __INTERRUPT_H__
#define __INTERRUPT_H__

#include "stdint.h"

#define PIC_M_CTRL 0x20	/* 8259A主片的控制端口是0x20 */
#define PIC_M_DATA 0x21	/* 8259A主片的数据端口是0x21 */
#define PIC_S_CTRL 0xa0	/* 8259A从片的控制端口是0xa0 */
#define PIC_S_DATA 0xa1	/* 8259A从片的数据端口是0xa1 */

#define IDT_DESC_CNT 0x2f /* 总共支持0x2f个中断 */



enum intr_status
{
    INTR_OFF, /* 中断关闭 */
    INTR_ON   /* 中断打开 */
};

/*中断门描述符结构体*/
struct gate_desc
{
   uint16_t offset_low; /* 偏移15~0 */
   uint16_t selector;   /* 目标代码段选择子 */
   uint8_t dcount;      /* 保留值和空值 */
   uint8_t attribute;   /* 属性 */
   uint16_t offset_high;/* 偏移31~16 */
};

void load_idt(uint32_t limit,uint32_t addr);
void init_pic();
void idt_desc_init(void);
void set_gatedesc(struct gate_desc* gd,void* func,int selector,int ar);
void init_idt();
void exception_init();
void register_handler(int vector_no,void* func);

enum intr_status intr_enable();
enum intr_status intr_disable();
enum intr_status intr_set_status(enum intr_status status);
enum intr_status intr_get_status();

extern void asm_intr0x20_handler();

#endif /* __INTERRUPT_H__ */
