#include <global.h>
#include <debug.h>
#include <memory.h>
#include <list.h>
#include <bitmap.h>
#include <string.h>
#include <interrupt.h>

#include <graphic.h>

/** @brief 内核内存块描述符,用于kmalloc和kfree */
struct MemoryDesc KernelMemoryBlock[NumberOfMemoryBlocks];

/** @brief 物理内存页位图 */
byte PhysicalMemoryBitmapBytes[MemoryBitmapBytesLen];
struct Bitmap PhysicalMemoryBitmap;

/** @brief 虚拟内存页位图 */
byte VirtualMemoryBitmapBytes[MemoryBitmapBytesLen];
struct Bitmap VirtualMemoryBitmap;

void InitMemoryBlock(struct MemoryDesc* MemDesc)
{
    int idx;
    UINTN BlockSize = 128;
    for(idx = 0;idx < NumberOfMemoryBlocks;idx++)
    {
        MemDesc[idx].BlockSize = BlockSize;
        MemDesc[idx].Blocks = DIV_ROUND_UP((PG_SIZE - sizeof(struct Zone)),MemDesc[idx].BlockSize);
        list_init(&(MemDesc[idx].FreeBlockList));
        BlockSize *= 2;
    }
    return;
}

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
    /* 内存描述符 */
    struct MEMDESC MemoryDescriptor[MemoryDescriptorCnt];
    int MemoryDescriptorNumber = 0;

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
            UINTN StartAddr = ((MemoryDescriptor[i].AddrStart + 0x1fffff) & 0xffffffffffe00000);
            UINTN EndAddr = (MemoryDescriptor[i].AddrStart + MemoryDescriptor[i].MemoryByteSize) & 0xffffffffffe00000;
            /* 内存不足一页 */
            if(StartAddr == EndAddr)
            {
                continue;
            }
            int index = ((MemoryDescriptor[i].AddrStart + 0x1fffff) & 0xffffffffffe00000) / PG_SIZE;
            UINTN j;
            for(j = index;j < ((EndAddr - StartAddr) / PG_SIZE);j++)
            {
                bitmap_set(&PhysicalMemoryBitmap,j,0);
            }
        }
    }
    /*
        已用内存:内核所用内存+页表占用内存+字体文件占用内存
        内核占用:0x100000 - 0x800000(0 - 8M) 即总内存前4页
    */
    for(i = 0;i < 4;i++)
    {
       bitmap_set(&PhysicalMemoryBitmap,i,1);
    }
    InitMemoryBlock(KernelMemoryBlock);
    return;
}

/**
 * @brief 分配指定页数
 * @param NumberOfPages 要分配的内存页数
 * @return 分配的内存页起始地址
*/
PUBLIC void* AllocatePage(UINTN NumberOfPages)
{
    if(NumberOfPages == 0)
    {
        return NULL;
    }
    INTN PageIndex = bitmap_alloc(&PhysicalMemoryBitmap,NumberOfPages);
    if(PageIndex == -1) // 分配失败
    {
        return NULL;
    }
    UINTN i;
    for(i = PageIndex;i < (PageIndex + NumberOfPages);i++)
    {
        bitmap_set(&PhysicalMemoryBitmap,i,1);
    }
    if(PageIndex < (0x100000000 / PG_SIZE)) // 在4GB以内
    {
        return (void*)(PageIndex * PG_SIZE);
    }
    else // 以后处理
    {
        return NULL;
    }
}

/**
 * @brief 释放指定页数
 * @param Addr 释放内存页的起始地址(对齐到2MB边界)
 * @param NumberOfPages 要释放的内存页数
 * @return 分配的内存页起始地址
*/
PUBLIC void FreePage(void* Addr,UINTN NumberOfPages)
{
    ASSERT(((((MEMORY_ADDRESS)Addr) & 0x1fffff) == 0));
    if(NumberOfPages == 0 || Addr == NULL || ((((MEMORY_ADDRESS)Addr) & 0x1fffff) != 0))
    {
        return;
    }
    INTN PageIndex = (MEMORY_ADDRESS)Addr / PG_SIZE;
    UINTN i;
    for(i = PageIndex;i < (PageIndex + NumberOfPages);i++)
    {
        bitmap_set(&PhysicalMemoryBitmap,i,0);
    }
    if(PageIndex < (0x100000000 / PG_SIZE)) // 在4GB以内
    {
        return;
    }
    else // 以后处理
    {
        return;
    }
}

PRIVATE struct MemoryBlock* Zone2Block(struct Zone* z,int idx)
{
    // 使地址对齐到大小的整倍数
    MEMORY_ADDRESS Addr = DIV_ROUND_UP(((MEMORY_ADDRESS)z) + sizeof(struct Zone),z->Desc->BlockSize) * (z->Desc->BlockSize);
    return ((struct MemoryBlock*)(Addr + (idx * (z->Desc->BlockSize))));
}

PRIVATE struct Zone* Block2Zone(struct MemoryBlock* b)
{
    return ((struct Zone*)((MEMORY_ADDRESS)b & 0xffffffffffe00000));
}

PUBLIC void* kmalloc(UINTN Size)
{
    struct Zone* z;
    struct MemoryBlock* b;
    struct MemoryDesc* MemDesc = KernelMemoryBlock;
    if(Size <= MaxAllocateSize)
    {
        int idx;
        for(idx = 0;idx < NumberOfMemoryBlocks;idx++)
        {
            if(Size <= MemDesc[idx].BlockSize)
            {
                break;
            }
        }
        if(list_empty(&(MemDesc[idx].FreeBlockList))) // 内存池已满
        {
            z = AllocatePage(1);
            if(z == NULL)
            {
                ASSERT(z != NULL);
                return NULL;
            }
            // 初始化
            // vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,"init new memzone. ");
            memset(z,0,PG_SIZE);
            z->Desc = &MemDesc[idx];
            z->Large = FALSE;
            z->Cnt = MemDesc[idx].Blocks;
            UINTN BlockIndex;
            enum intr_status old_status = intr_disable();
            // 将内存拆分成内存块,加入到FreeBlockList队列中
            for(BlockIndex = 0;BlockIndex < MemDesc[idx].Blocks;BlockIndex++)
            {
                b = Zone2Block(z,BlockIndex);
                ASSERT(!(list_find(&(z->Desc->FreeBlockList),&(b->Free))));
                list_append(&(z->Desc->FreeBlockList),&(b->Free));
            }
            intr_set_status(old_status);
        }
        /* 获取一个内存块 */
        // vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,"GET A MEMORY. ");
        b = container_of(struct MemoryBlock,Free,list_pop(&(MemDesc[idx].FreeBlockList)));
        memset(b,0,MemDesc[idx].BlockSize);
        z = Block2Zone(b);
        z->Cnt--;
        return ((void*)b);
    }
    else // 要分配的内存大于最大内存块大小
    {
        // 直接分配整页内存
        UINTN NumberOfPages;
        NumberOfPages = DIV_ROUND_UP(Size + sizeof(struct Zone),PG_SIZE);
        z = AllocatePage(NumberOfPages);
        if(z == NULL)
        {
            ASSERT(z != NULL);
            return NULL;
        }
        z->Desc = NULL;
        z->Cnt = NumberOfPages;
        z->Large = TRUE;
        ASSERT(z->Desc == NULL && z->Cnt == NumberOfPages && z->Large == TRUE);
        // vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,"Large memzone. ");
        return (void*)(z + 1); // 节约内存,不对齐
    }
    return NULL;
}

PUBLIC void kfree(void* Addr)
{
    if(Addr == NULL)
    {
        return;
    }
    struct Zone* z;
    struct MemoryBlock* b;
    b = Addr;
    z = Block2Zone(b);
    if(z->Desc == NULL && z->Large == TRUE)
    {
        // vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,"Free Large memzone. ");
        FreePage(z,z->Cnt);
    }
    else
    {
        list_append(&(z->Desc->FreeBlockList),&(b->Free));
        z->Cnt++;
        // 如果内存区域全部为空,则删除整个Zone
        if(z->Cnt == z->Desc->Blocks)
        {
            UINTN idx;
            for(idx = 0;idx < z->Desc->Blocks;idx++)
            {
                b = Zone2Block(z,idx);
                ASSERT(list_find(&(z->Desc->FreeBlockList),&(b->Free)));
                list_remove(&(b->Free));
            }
            // vput_utf8_str(&(gBI.GraphicsInfo),&Pos,col,"Free Total memzone. ");
            FreePage(z,1);
        }
    }
    return;
}