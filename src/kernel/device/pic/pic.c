#include <device/pic.h>
#include <device/cpu.h>
#include <io.h>

extern apic_map_t apic_map;

PUBLIC bool check_apic();

PUBLIC void init_8259a();
PUBLIC void init_apic();

PUBLIC void init_pic()
{
    // if (check_apic())
    // {
    //     init_apic();
    // }
    // else
    {
        init_8259a();
    }
}

PUBLIC void eoi(uint8_t nr __attribute__((unused)))
{
    // if (check_apic())
    // {
    //     *(uint64_t*)KADDR_P2V(apic_map.local_apic_address + 0xb0) = 0;
    //     io_mfence();
    // }
    // else
    {
        io_out8(PIC_M_CTRL,0x20);
    }
}