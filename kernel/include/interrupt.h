#ifndef __INTERRUPT_H__
#define __INTERRUPT_H__

enum intr_status
{
    INTR_OFF, /* 中断关闭 */
    INTR_ON   /* 中断打开 */
};

void init_interrupt();

enum intr_status intr_enable();
enum intr_status intr_disable();
enum intr_status intr_set_status(enum intr_status status);
enum intr_status intr_get_status();

#endif