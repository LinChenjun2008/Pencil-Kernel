#ifndef __TIMER_H__
#define __TIMER_H__

#include "stdint.h"

#define IRQ0_FREQUENCY 100                              /* 每秒中断次数 */
#define INPUT_FREQUENCY 1193180                         /* 中断信号频率 */
#define COUNTER0_VALUE INPUT_FREQUENCY / IRQ0_FREQUENCY /* 计数器0的初始值 */
#define CONTRER0_PORT 0x40                              /*  */
#define COUNTER0_NO 0
#define COUNTER_MODE 2
#define READ_WRITE_LATCH 3
#define PIT_CONTROL_PORT 0x43

void init_pit(void);

#endif /* __TIMER_H__ */