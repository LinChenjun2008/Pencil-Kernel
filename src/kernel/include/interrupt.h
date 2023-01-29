#ifndef __INTERRUPT_H__
#define __INTERRUPT_H__

#define PIC_M_CTRL 0x20	/* 8259A主片的控制端口是0x20 */
#define PIC_M_DATA 0x21	/* 8259A主片的数据端口是0x21 */
#define PIC_S_CTRL 0xa0	/* 8259A从片的控制端口是0xa0 */
#define PIC_S_DATA 0xa1	/* 8259A从片的数据端口是0xa1 */

enum intr_status
{
    INTR_OFF, /* 中断关闭 */
    INTR_ON   /* 中断打开 */
};

enum OffsetInStack
{
    Stack_Ds,
    Stack_Es,
    Stack_Fs,
    Stack_Gs,

    Stack_Rax,
    Stack_Rbx,
    Stack_Rcx,
    Stack_Rdx,
    Stack_Rbp,
    Stack_Rsi,
    Stack_Rdi,
    Stack_R8,
    Stack_R9,
    Stack_R10,
    Stack_R11,
    Stack_R12,
    Stack_R13,
    Stack_R14,
    Stack_R15,

    Stack_ErrorCode,
    Stack_Rip,
    Stack_Cs,
};

void init_interrupt();

enum intr_status intr_enable();
enum intr_status intr_disable();
enum intr_status intr_set_status(enum intr_status status);
enum intr_status intr_get_status();

#endif