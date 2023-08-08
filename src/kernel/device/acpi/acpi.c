/**
 * @note 部分机器上在开中断后不能获取sdt,而有的机器又可以.不确定是否是代码有bug.
 * 在解决这个问题之前,应该在开中断前保存sdt.
*/

#include <device/acpi.h>
#include <device/serial.h>
#include <std/string.h>

PRIVATE bool acpi_checksum(ACPI_DESCRIPTION_HEADER_t* addr)
{
    uint8_t sum = 0;
    uint32_t i;
    for (i = 0;i < addr->Length;i++)
    {
        sum += ((uint8_t*)addr)[i];
    }
    return sum == 0;
}

PUBLIC void* acpi_get_table(uint32_t signature)
{
    RSDP_t* rsdp = KADDR_P2V(g_boot_info.rsdp);
    if (rsdp->Revision != 2)
    {
        return NULL;
    }
    XSDT_TABLE_t* xsdt = KADDR_P2V(rsdp->XsdtAddress);
    if (!acpi_checksum(KADDR_P2V(&xsdt->Header)))
    {
        return NULL;
    }
    int entries = \
                (xsdt->Header.Length - sizeof(xsdt->Header)) / sizeof(uint64_t);
    uint64_t* point_to_other_sdt = KADDR_P2V(&xsdt->Entry);
    int i;
    for (i = 0;i < entries;i++)
    {
        ACPI_DESCRIPTION_HEADER_t* h = \
                (ACPI_DESCRIPTION_HEADER_t*)KADDR_P2V(point_to_other_sdt[i]);
        if (acpi_checksum(h) && h->Signature == signature)
        {
            return h;
        }
    }
    return NULL;
}