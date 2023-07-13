#ifndef __BOOT_H__
#define __BOOT_H__

#include <Efi.h>
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
    {L"Kernel\\typeface.sys",0x600000,AllocateAddress,0x00000002},
    {L"Kernel\\resource\\typeface.ttf",0x800000,AllocateAddress,0x80000003}
};

#define STAPS ((sizeof(Files) / sizeof(Files[0])) + 3)

#define HORIZONTAL_RESOLUTION 1920
#define VERTICAL_RESOLUTION   1080

EFI_STATUS EFIAPI EfiInit(IN EFI_HANDLE ImageHandle,IN EFI_SYSTEM_TABLE* SystemTable);
EFI_STATUS ReadFile(IN CHAR16* FileName,IN OUT EFI_PHYSICAL_ADDRESS *FileBufferBase,IN EFI_ALLOCATE_TYPE BufferType,OUT UINT64* FileSize);
void SetVideoMode(int x,int y);
EFI_STATUS GetMemoryMap(memory_map_t* memmap);

#define PG_P 0x1
#define PG_RW_R 0x0
#define PG_RW_W 0x2
#define PG_US_S 0x0
#define PG_US_U 0x4
#define PG_SIZE_2M 0x80

VOID CreatePage(EFI_PHYSICAL_ADDRESS PML4E);

static inline pixel_t make_color(uint8_t red,uint8_t green,uint8_t blue);
void view_fill(graph_info_t* graph_info,pixel_t color,unsigned int x0,unsigned int y0,unsigned int x1,unsigned int y1);
#endif