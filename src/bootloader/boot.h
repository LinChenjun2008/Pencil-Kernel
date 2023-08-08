#ifndef __BOOT_H__
#define __BOOT_H__

#include <Efi.h>
#include <Guid/Acpi.h>
#include <Uefi/UefiAcpiDataTable.h>

#include "common.h"

#define STOP() while(1);

struct Files
{
    CHAR16* Name;
    EFI_PHYSICAL_ADDRESS FileBufferBase;
    EFI_ALLOCATE_TYPE    FileBufferType;
    UINT32               Flag;
};

struct Files Files[] =
{
    {L"Kernel\\kernel.sys",0x100000,AllocateAddress,0x80000001},
    {L"Kernel\\typeface.sys",0x600000,AllocateAddress,0x80000002},
    {L"Kernel\\resource\\typeface.ttf",0x800000,AllocateAddress,0x80000003}
};

#define STAPS ((sizeof(Files) / sizeof(Files[0])) + 3)

#define HORIZONTAL_RESOLUTION 1920
#define VERTICAL_RESOLUTION   1080

EFI_STATUS EFIAPI EfiInit(IN EFI_HANDLE ImageHandle,
                          IN EFI_SYSTEM_TABLE* SystemTable);
EFI_STATUS ReadFile(IN CHAR16* FileName,
                    IN OUT EFI_PHYSICAL_ADDRESS *FileBufferBase,
                    IN EFI_ALLOCATE_TYPE BufferType,OUT UINT64* FileSize);
void SetVideoMode(int x,int y);
EFI_STATUS GetMemoryMap(memory_map_t* memmap);
void* GetRsdp();

#define PG_P 0x1
#define PG_RW_R 0x0
#define PG_RW_W 0x2
#define PG_US_S 0x0
#define PG_US_U 0x4
#define PG_SIZE_2M 0x80

VOID CreatePage(EFI_PHYSICAL_ADDRESS PML4E);

static inline pixel_t make_color(uint8_t red,uint8_t green,uint8_t blue);
void view_fill(graph_info_t* graph_info,pixel_t color,unsigned int x0,
               unsigned int y0,unsigned int x1,unsigned int y1);

int CompareGuid(EFI_GUID* guid1,EFI_GUID* guid2)
{
    return    ((guid1->Data1 == guid2->Data1)
            && (guid1->Data2 == guid2->Data2)
            && (guid1->Data3 == guid2->Data3)
            && (guid1->Data4[0] == guid2->Data4[0])
            && (guid1->Data4[1] == guid2->Data4[1])
            && (guid1->Data4[2] == guid2->Data4[2])
            && (guid1->Data4[3] == guid2->Data4[3])
            && (guid1->Data4[4] == guid2->Data4[4])
            && (guid1->Data4[5] == guid2->Data4[5])
            && (guid1->Data4[6] == guid2->Data4[6])
            && (guid1->Data4[7] == guid2->Data4[7]));
}

#endif