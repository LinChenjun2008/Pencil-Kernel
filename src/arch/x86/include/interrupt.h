#ifndef __INTERRUPT_H__
#define __INTERRUPT_H__

enum intr_status
{
    INTR_OFF, /* 中断关闭 */
    INTR_ON   /* 中断打开 */
};

void load_idt(uint64_t* idt_ptr);

#endif /* __INTERRUPT_H__ */