#include <pic.h>
#include <cpu.h>
#include <global.h>
#include <io.h>

#define IA32_APIC_BASE        0x0000001b
#define IA32_APIC_BASE_BSP    0x100
#define IA32_APIC_BASE_ENABLE 0x800

#define IOREGSEL 0xfec00000
#define IOWIN    0xfec00010
#define EOI      0xfec00040

struct
{
    uint32_t address;
    uint8_t *index_address;
    uint32_t *data_address;
    uint32_t *EOI_address;
} ioapic_map;

PUBLIC BOOL check_apic()
{
    unsigned int a,b,c,d;
    cpuid(1,0,&a,&b,&c,&d);
    return (d & (1 << 9)) && (c & (1 << 21));
}

PRIVATE void local_apic_init()
{
    uint64_t volatile val;
    val = rdmsr(IA32_APIC_BASE);
    val |= IA32_APIC_BASE_ENABLE;
    wrmsr(IA32_APIC_BASE,val);

    // enable SVR[8]
    rdmsr(0x80f);
    val = val | (1 << 12) | (1 << 8);
    wrmsr(0x80f,val);

    // val =  *(uint64_t*)0xfee000f0;
    // io_mfence();
    // val = val | (1 << 12) | (1 << 8);
    // *(uint64_t*)0xfee000f0 = val;
    // io_mfence();

    // mask LVT
    wrmsr(0x82f,0x10000);
    wrmsr(0x832,0x10000);
    wrmsr(0x833,0x10000);
    wrmsr(0x834,0x10000);
    wrmsr(0x835,0x10000);
    wrmsr(0x836,0x10000);
    wrmsr(0x837,0x10000);

    // *(uint64_t*)0xfee002f0 = 0x10000;
    // io_mfence();
    // *(uint64_t*)0xfee00320 = 0x10000;
    // io_mfence();
    // *(uint64_t*)0xfee00330 = 0x10000;
    // io_mfence();
    // *(uint64_t*)0xfee00340 = 0x10000;
    // io_mfence();
    // *(uint64_t*)0xfee00350 = 0x10000;
    // io_mfence();
    // *(uint64_t*)0xfee00360 = 0x10000;
    // io_mfence();
    // *(uint64_t*)0xfee00370 = 0x10000;
    // io_mfence();
    return;
}

PRIVATE void ioapic_map_init()
{
    ioapic_map.address = IOREGSEL;
    ioapic_map.index_address = (void*)(0xffff800000000000 + IOREGSEL);
    ioapic_map.data_address  = (void*)ioapic_map.index_address + 0x10;
    ioapic_map.EOI_address   = (void*)ioapic_map.index_address + 0x40;
    return;
}

PRIVATE uint64_t ioapic_rte_read(uint8_t index)
{
    uint64_t ret;
    *ioapic_map.index_address = index + 1;
    io_mfence();
    ret = *ioapic_map.data_address;
    ret <<= 32;
    io_mfence();

    *ioapic_map.index_address = index;
    io_mfence();
    ret |= *ioapic_map.data_address;
    io_mfence();

    return ret;
}

PRIVATE void ioapic_rte_write(uint8_t index,uint64_t value)
{
    *ioapic_map.index_address = index;
    io_mfence();
    *ioapic_map.data_address = value & 0xffffffff;
    value >>= 32;
    io_mfence();

    *ioapic_map.index_address = index + 1;
    io_mfence();
    *ioapic_map.data_address = value & 0xffffffff;
    io_mfence();
}

/**
 * @brief 允许I/O APIC pin引脚的中断
 * @param pin 中断引脚
 * @param vector 中断向量号
*/
PUBLIC void ioapic_enable(uint64_t pin,uint64_t vector)
{
    uint64_t value = 0;
    value = ioapic_rte_read(pin * 2 + 0x10);
    value = value & (~0x100ffUL);
    ioapic_rte_write(pin * 2 + 0x10,value | vector);
}

PUBLIC void IOAPIC_disable(uint64_t irq)
{
    uint64_t value = 0;
    value = ioapic_rte_read((irq - 32) * 2 + 0x10);
    value = value | 0x10000UL;
    ioapic_rte_write((irq - 32) * 2 + 0x10,value);
}

PRIVATE void ioapic_init()
{
    /* 屏蔽所有中断 */
    int i;
    for (i = 0x10;i < 0x40;i += 2)
    {
        ioapic_rte_write(i,0x10000);
    }
    ioapic_enable(2,0x20);
    return;
}

PUBLIC void init_apic()
{
    ioapic_map_init();
    // mask 8259a
    io_out8(PIC_M_DATA, 0xff ); /* 11111111 禁止所有中断 */
    io_out8(PIC_S_DATA, 0xff ); /* 11111111 禁止所有中断 */

    // //enable IMCR
    // io_out8(0x22,0x70);
    // io_mfence();
    // io_out8(0x23,0x01);
    // io_mfence();

    local_apic_init();
    ioapic_init();
    return;
}