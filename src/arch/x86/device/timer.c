#include "timer.h"

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
