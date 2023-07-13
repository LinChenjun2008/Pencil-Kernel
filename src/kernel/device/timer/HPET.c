#include <interrupt.h>
#include <io.h>
#include <pic.h>
#include <thread.h>

PRIVATE void intr_HPETtimer_handler()
{
    eoi();
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

void init_pit()
{
    uint32_t x,*p;
    uint8_t *HPET_addr = (uint8_t *)0xfed00000;
    io_out32(0xcf8,0x8000f8f0);
    x = io_in32(0xcfc);
    x &= 0xffffc000;
    p = (uint32_t*)((uintptr_t)x + 0x3404);
    *p = 0x80;
    io_mfence();

    *(uint64_t*)(HPET_addr +  0x10) = 3;
    io_mfence();

    *(uint64_t*)(HPET_addr + 0x100) = 0x004c;
    io_mfence();

    // 14318179 = 1s => 14318 = 1 ms
    *(uint64_t*)(HPET_addr + 0x108) = 14318;
    io_mfence();

    *(uint64_t*)(HPET_addr + 0xf0) = 0;
    io_mfence();

    register_handle(0x20,intr_HPETtimer_handler);
}