#ifndef __PIC_H__
#define __PIC_H__

#include <device/acpi.h>
#include <kernel/global.h>

#define PIC_M_CTRL 0x20	/* 8259A主片的控制端口是0x20 */
#define PIC_M_DATA 0x21	/* 8259A主片的数据端口是0x21 */
#define PIC_S_CTRL 0xa0	/* 8259A从片的控制端口是0xa0 */
#define PIC_S_DATA 0xa1	/* 8259A从片的数据端口是0xa1 */

#pragma pack(1)
// MADT
typedef struct
{
    ACPI_DESCRIPTION_HEADER_t Header;
    uint32_t                  LocalApicAddress;
    uint32_t                  Flags;
} MADT_t;
#pragma pack()

typedef struct
{
    uint64_t  local_apic_address;
    uint32_t  ioapic_address;
    uint8_t  *ioapic_index_address;
    uint32_t *ioapic_data_address;
    uint32_t *ioapic_EOI_address;
    uint8_t   number_of_cores;
    uint8_t   lapic_id[256];
} apic_map_t;

PUBLIC bool check_apic();

PUBLIC void init_pic();
PUBLIC void eoi(uint8_t nr);

#endif