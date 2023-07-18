#include <pic.h>
#include <cpu.h>
#include <io.h>

PUBLIC BOOL check_apic();

PUBLIC void init_8259a();
PUBLIC void init_apic();

PUBLIC void init_pic()
{
    init_8259a();
    // if (check_apic())
    // {
    //     init_apic();
    // }
    // else
    // {
    //     init_8259a();
    // }
}

PUBLIC void eoi()
{
    // if (check_apic())
    // {
    //     *(uint64_t*)0xfee000b0 = 0;
    //     io_mfence();
    //     //wrmsr(0x80b,0x00);
    // }
    // else
    // {
        io_out8(PIC_M_CTRL,0x20);
    // }
}