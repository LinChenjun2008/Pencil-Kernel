#include "timer.h"

#include "debug.h"
#include "graphic.h"
#include "interrupt.h"
#include "io.h"
#include "thread.h"

int ticks = 0;
int i = 0;
void init_pit(void)
{
    /* 往控制字寄存器端口0x43中写入控制字 */
    io_out8(PIT_CONTROL_PORT, 0x34);
    /* 先写入counter_value的低8位 */
    io_out8(CONTRER0_PORT, 0x9c);
    /* 再写入counter_value的高8位 */
    io_out8(CONTRER0_PORT, 0x2e);
    return;
}

void intr0x20_handler(uint32_t* esp)
{
    io_out8(PIC_M_CTRL,0x20); /* EIO */
    struct task_struct* cur_thread = running_thread();
    cur_thread->elapsed_ticks++;
    ticks++;
    if(cur_thread->ticks == 0)
    {
        schedule();
    }
    else
    {
        cur_thread->ticks--;
    }
    return;
}