#include <interrupt/interrupt.h>
#include <device/pic.h>
#include <thread/thread.h>
#include <io.h>

#define PIT_CTRL 0x0043
#define PIT_CNT0 0x0040

PUBLIC void intr_8254timer_handler()
{
    eoi(0x20);
    task_struct_t* cur_thread = running_thread();
    cur_thread->elapsed_ticks++;
    if (cur_thread->ticks == 0)
    {
        schedule();
    }
    else
    {
        cur_thread->ticks--;
    }
    return;
}

PUBLIC void init_pit()
{
    io_out8(PIT_CTRL,0x34);
    io_out8(PIT_CNT0,0x9c);
    io_out8(PIT_CNT0,0x2e);

    register_handle(0x20,intr_8254timer_handler);
    return;
}