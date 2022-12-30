#include <global.h>
#include <memory.h>
#include <bitmap.h>

struct MEMDESC MemoryDescriptor[MemoryDescriptorCnt];
int MemoryDescriptorNumber = 0;

byte PhysicalMemoryBitmapBytes[MemoryBitmapBytesLen];
struct Bitmap PhysicalMemoryBitmap;
byte VirtualMemoryBitmapBytes[MemoryBitmapBytesLen];
struct Bitmap VirtualMemoryBitmap;
byte UserPhysicalMemoryBitmapBytes[MemoryBitmapBytesLen];
struct Bitmap UserPhysicalMemoryBitmap;

PRIVATE enum MemoryType type_uefi2os(EFI_MEMORY_TYPE EfiType)
{
    enum MemoryType Type;
    switch(EfiType)
    {
        case EfiConventionalMemory:
        case EfiBootServicesCode:
        case EfiBootServicesData:
        case EfiLoaderCode:
        case EfiLoaderData:
            Type = FreeMemory;
            break;
        case EfiRuntimeServicesCode:
        case EfiRuntimeServicesData:
        case EfiMemoryMappedIO:
        case EfiMemoryMappedIOPortSpace:
        case EfiPalCode:
        case EfiReservedMemoryType:
            Type = ReservedMemory;
            break;
        case EfiACPIReclaimMemory:
            Type = APICMemory;
            break;
        case EfiACPIMemoryNVS:
            Type = APICMemoryNVS;
            break;
        case EfiUnusableMemory:
        case EfiMaxMemoryType:
            Type = UnuseableMemory;
            break;
        default:
            Type = MaxMemoryType; // 应该不会到这里
            break;
    }
    return Type;
}

PUBLIC void init_memory()
{
    // 合并内存块
    int i,PageCnt = gBI.MemoryMap.MapSize / gBI.MemoryMap.DescriptorSize;
    // 提前给第一项赋值
    MemoryDescriptor[0].AddrStart      = 0;
    MemoryDescriptor[0].MemoryPageSize = 0;
    MemoryDescriptor[0].Type           = FreeMemory;
    int MemoryDescriptorIndex = 1;
    for(i = 0;i < PageCnt;i++)
    {
        // 先检查内存类型
        // 如果内存类型与上一个不同,则无法合并
        if(type_uefi2os(((((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->Type)) == MemoryDescriptor[MemoryDescriptorIndex - 1].Type)
        {
            //能否合并?
            if(MemoryDescriptor[MemoryDescriptorIndex - 1].AddrStart + (MemoryDescriptor[MemoryDescriptorIndex - 1].MemoryPageSize << 12) == (((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->PhysicalStart)
            {
                //合并
                MemoryDescriptor[MemoryDescriptorIndex - 1].MemoryPageSize +=  (((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->NumberOfPages;
                continue; // 继续下一个
            }
        }
        // 不能合并
        MemoryDescriptor[MemoryDescriptorIndex].AddrStart = (((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->PhysicalStart;
        MemoryDescriptor[MemoryDescriptorIndex].MemoryPageSize = (((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->NumberOfPages;
        MemoryDescriptor[MemoryDescriptorIndex].Type = type_uefi2os((((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->Type);
        MemoryDescriptorIndex++;
    }
    MemoryDescriptorNumber = MemoryDescriptorIndex;
    for(i = 0;i < MemoryDescriptorNumber;i++)
    {
        //UEFI里1页等于4KB,内核里1页等于2MB
        MemoryDescriptor[i].MemoryByteSize = MemoryDescriptor[i].MemoryPageSize << 12;
        MemoryDescriptor[i].MemoryPageSize >>= 9;
    }
    // 初始化内存位图,为内存分配做准备
    PhysicalMemoryBitmap.map = PhysicalMemoryBitmapBytes;
    PhysicalMemoryBitmap.btmp_bytes_len = MemoryBitmapBytesLen;
    bitmap_init(&PhysicalMemoryBitmap);

    VirtualMemoryBitmap.map = VirtualMemoryBitmapBytes;
    VirtualMemoryBitmap.btmp_bytes_len = MemoryBitmapBytesLen;
    bitmap_init(&VirtualMemoryBitmap);

    UserPhysicalMemoryBitmap.map = UserPhysicalMemoryBitmapBytes;
    UserPhysicalMemoryBitmap.btmp_bytes_len = MemoryBitmapBytesLen;
    bitmap_init(&UserPhysicalMemoryBitmap);

    for(i = 0;i < MemoryBitmapBytesLen;i++)
    {
       bitmap_set(&PhysicalMemoryBitmap,i,1);
    }

    // 空闲物理内存
    for(i = 0;i < MemoryDescriptorNumber;i++)
    {
        // 只记录空闲内存
        if(MemoryDescriptor[i].Type == FreeMemory && MemoryDescriptor[i].MemoryPageSize > 1)
        {
            // 记录到bitmap
            int index = ((MemoryDescriptor[i].AddrStart + 0x1fffff) & ~0x1fffff) / PG_SIZE;
            UINTN j;
            for(j = index;j < (index + MemoryDescriptor[i].MemoryPageSize);j++)
            {
                bitmap_set(&PhysicalMemoryBitmap,j,0);
            }
        }
    }

    /*
        已用内存:内核所用内存+页表占用内存+字体文件占用内存
        内核占用:0x100000 - 0x1000000(0 - 16M) 前8页
    */
    for(i = 0;i < 8;i++)
    {
       bitmap_set(&PhysicalMemoryBitmap,i,1);
    }
    return;
}