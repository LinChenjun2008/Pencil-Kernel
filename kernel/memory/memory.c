#include <global.h>
#include <memory.h>

struct MEMDESC MemoryDescriptor[MemoryDescriptorCnt];
int MemoryDescriptorNumber = 0;
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
            Type = EfiMemory;
            break;
        case EfiMemoryMappedIO:
        case EfiMemoryMappedIOPortSpace:
            Type = MemoryMappedIO;
            break;
        case EfiACPIReclaimMemory:
        case EfiACPIMemoryNVS:
            Type = APICMemory;
            break;
        case EfiPalCode:
            Type = ReservedMemory;
            break;
        case EfiUnusableMemory:
        case EfiReservedMemoryType:
        case EfiMaxMemoryType:
            Type = Unuseable;
            break;
        default:
            Type = MaxMemoryType; // 应该不会到这里
            break;
    }
    return Type;
}

PUBLIC void init_memory()
{
    int i,PageCnt = gBI.MemoryMap.MapSize / gBI.MemoryMap.DescriptorSize;
    // 提前给第一项赋值
    MemoryDescriptor[0].AddrStart = ((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer)->PhysicalStart; //虚拟地址与物理地址相同,这里用物理地址
    MemoryDescriptor[0].Memory_4KB_Size = ((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer)->NumberOfPages; //UEFI里1页等于4kb
    MemoryDescriptor[0].Type = type_uefi2os(((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer)->Type);
    int MemoryDescriptorIndex = 1;
    for(i = 1;i < PageCnt;i++)
    {
        /*
        * 1.查看内存描述符可否合并
        * 2. 如果可以,则合并内存. 不可以,则填写下一个描述的内存大小 起始地址 内存类型等信息
        */
        // 先检查内存类型
        // 如果内存类型与上一个不同,则无法合并
        if(type_uefi2os(((((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->Type)) == MemoryDescriptor[MemoryDescriptorIndex - 1].Type)
        {
            //能否合并?
            if(MemoryDescriptor[MemoryDescriptorIndex - 1].AddrStart + (MemoryDescriptor[MemoryDescriptorIndex - 1].Memory_4KB_Size << 12) == (((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->PhysicalStart)
            {
                //合并
                MemoryDescriptor[MemoryDescriptorIndex - 1].Memory_4KB_Size +=  (((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->NumberOfPages;
                continue; // 继续下一个
            }
        }
        // 不能合并
        MemoryDescriptor[MemoryDescriptorIndex].AddrStart = (((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->PhysicalStart;
        MemoryDescriptor[MemoryDescriptorIndex].Memory_4KB_Size = (((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->NumberOfPages; //UEFI里1页等于4kb
        MemoryDescriptor[MemoryDescriptorIndex].Type = type_uefi2os((((EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer) + i)->Type);
        MemoryDescriptorIndex++;
    }
    MemoryDescriptorNumber = MemoryDescriptorIndex;
    return;
}