#include <interrupt.h>
#include <thread.h>
#include <debug.h>
#include <io.h>

#define PIT_CTRL 0x0043
#define PIT_CNT0 0x0040

void intr0x20_handler()
{
    io_out8(PIC_M_CTRL,0x20);

    task_struct_t* cur_thread = running_thread();

    ASSERT(cur_thread->stack_magic == STACK_MAGIC);

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

void init_pit()
{
    io_out8(PIT_CTRL,0x34);
    io_out8(PIT_CNT0,0x9c);
    io_out8(PIT_CNT0,0x2e);

    register_handle(0x20,intr0x20_handler);
    return;
}