#include <common.h>
#include <global.h>
#include <debug.h>
#include <memory.h>
#include <list.h>
#include <graphic.h>
#include <interrupt.h>
#include <stdio.h>
#include <string.h>

struct MEMDESC Mdesc;
struct ALLOCATE_TABLE_ENTRY MemDescEntries[1024];

struct MemoryDesc KernelMemoryBlock[NumberOfMemoryBlocks];

MEMORY_ADDRESS PageAddressRoundUp(MEMORY_ADDRESS Addr)
{
    return DIV_ROUND_UP(Addr,PG_SIZE) * PG_SIZE;
}

MEMORY_ADDRESS PageAddressRoundDown(MEMORY_ADDRESS Addr)
{
    return (Addr & ~(PG_SIZE - 1UL));
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
            Type = ACPIMemory;
            break;
        case EfiACPIMemoryNVS:
            Type = ACPIMemoryNVS;
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

void InitMemoryBlock(struct MemoryDesc* MemDesc)
{
    int idx;
    UINTN BlockSize = 128;
    for(idx = 0;idx < NumberOfMemoryBlocks;idx++)
    {
        MemDesc[idx].BlockSize = BlockSize;
        MemDesc[idx].Blocks = DIV_ROUND_UP((PG_SIZE - sizeof(struct Zone)),MemDesc[idx].BlockSize) - 1;
        list_init(&(MemDesc[idx].FreeBlockList));
        BlockSize *= 2;
    }
    return;
}

void init_memory()
{
    struct Position Pos;
    Pos.x = 10;
    Pos.y = 250;
    init_AllocateTable(&Mdesc.FreeMemDescTable,MemDescEntries,1024);
    int i,DescCnt = gBI.MemoryMap.MapSize / gBI.MemoryMap.DescriptorSize;
    MEMORY_ADDRESS total_free = 0;
    EFI_MEMORY_DESCRIPTOR* EfiMemDesc = (EFI_MEMORY_DESCRIPTOR*)gBI.MemoryMap.Buffer;
    int MemoryLimit;
    char s[256];
    for(i = 0;i < DescCnt;i++)
    {
        // 检查内存类型,只有FreeMemory才记录
        if (type_uefi2os(EfiMemDesc[i].Type) == FreeMemory)
        {
            MEMORY_ADDRESS Start = EfiMemDesc[i].PhysicalStart;
            MEMORY_ADDRESS End = Start + (EfiMemDesc[i].NumberOfPages << 12);
            // 继续寻找,直到不是FreeMemory
            int j;
            for(j = i + 1;j < DescCnt;j++)
            {
                if (type_uefi2os(EfiMemDesc[j].Type) != FreeMemory || End != EfiMemDesc[j].PhysicalStart)
                {
                    break;
                }
                End += EfiMemDesc[j].NumberOfPages << 12;
            }
            i = j - 1; // 由于会 i++
            MemoryLimit = EfiMemDesc[i].PhysicalStart + (EfiMemDesc[i].NumberOfPages << 12);
            // 对齐到2MB
            Start = PageAddressRoundUp(Start) / PG_SIZE;
            if(Start <= 4) {Start = 5;}
            End = PageAddressRoundDown(End) / PG_SIZE;
            if(End > Start && End - Start >= 1) // 满1页
            {
                sprintf(s,"Free: %p - %p Page: %d\n",Start * PG_SIZE,End * PG_SIZE,End - Start);
                vput_utf8_str(&gBI.GraphicsInfo,&Pos,color(0,255,0),s,FontNormal);
                FreeUnits(&Mdesc.FreeMemDescTable,Start,End - Start);
                total_free += (End - Start) * PG_SIZE;
            }
        }
    }
    InitMemoryBlock(KernelMemoryBlock);
    sprintf(s,"Memlim: %p == %d(MB)\ntotal free: %dMB",MemoryLimit,MemoryLimit / 0x100000,total_free / 0x100000);
    vput_utf8_str(&gBI.GraphicsInfo,&Pos,color(0,255,0),s,FontNormal);
    return;
}

PUBLIC void* AllocPage(int NumberOfPage)
{
    if(NumberOfPage == 0) {return NULL;}
    return (void*)(0UL + AllocateUnits(&Mdesc.FreeMemDescTable,NumberOfPage) * PG_SIZE);
}

PUBLIC void FreePage(void* Addr,int NumberOfPage)
{
    if(NumberOfPage == 0 || Addr == NULL || ((((MEMORY_ADDRESS)Addr) & 0x1fffff) != 0))
    {
        return;
    }
    // if(NumberOfPage == 0){return;}
    FreeUnits(&Mdesc.FreeMemDescTable,(MEMORY_ADDRESS)Addr / PG_SIZE,NumberOfPage);
    return;
}


PRIVATE struct MemoryBlock* Zone2Block(struct Zone* z,int idx)
{
    // 使地址对齐到大小的整倍数
    MEMORY_ADDRESS Addr = DIV_ROUND_UP(((MEMORY_ADDRESS)z) + sizeof(*z),z->Desc->BlockSize) * (z->Desc->BlockSize);
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
            z = AllocPage(1);
            ASSERT(z != NULL);
            if(z == NULL)
            {
                PANIC("No enough Memory.");
                return NULL;
            }
            // 初始化
            memset(z,0,PG_SIZE);
            z->Desc = &MemDesc[idx];
            z->Large = FALSE;
            z->Cnt = MemDesc[idx].Blocks;
            UINTN BlockIndex;
            enum intr_status old_status = intr_disable();
            // 将内存拆分成内存块,加入到FreeBlockList队列中
            for(BlockIndex = 0;BlockIndex <= MemDesc[idx].Blocks;BlockIndex++)
            {
                b = Zone2Block(z,BlockIndex);
                b->Free.container = b;
                ASSERT(!(list_find(&(z->Desc->FreeBlockList),&(b->Free))));
                list_append(&(z->Desc->FreeBlockList),&(b->Free));
            }
            intr_set_status(old_status);
        }
        /* 获取一个内存块 */
        b = list_pop(&(MemDesc[idx].FreeBlockList))->container;
        memset(b,0,MemDesc[idx].BlockSize);
        z = Block2Zone(b);
        z->Cnt--;
        return ((void*)b);
    }
    else // 要分配的内存大于最大内存块大小
    {
        // 直接分配整页内存
        UINTN NumberOfPages;
        NumberOfPages = DIV_ROUND_UP(Size + sizeof(*z),PG_SIZE);
        z = AllocPage(NumberOfPages);
        if(z == NULL)
        {
            ASSERT(z != NULL);
            return NULL;
        }
        z->Desc = NULL;
        z->Cnt = NumberOfPages;
        z->Large = TRUE;
        ASSERT(z->Desc == NULL && z->Cnt == NumberOfPages && z->Large == TRUE);
        return (void*)(z + 1); // 节约内存,不对齐
    }
    PANIC("No enough Memory.");
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
            FreePage(z,1);
        }
    }
    return;
}