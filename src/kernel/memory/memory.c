#include <common.h>
#include <global.h>
#include <debug.h>
#include <memory.h>
#include <list.h>
#include <graphic.h>
#include <interrupt.h>
#include <stdio.h>
#include <string.h>
#include <sync.h>

typedef enum
{
    FREE_MEMORY = 1,  // 可用内存: EfiConventionalMemory EfiBootServices(Code/Data) EfiLoader(Code/Data) EfiReservedMemoryType
    RESERVED_MEMORY,  // 保留(不可用): EfiRuntimeServices(Code/Data) EfiMemoryMappedIO EfiMemoryMappedIOPortSpace EfiPalCode
    ACPI_MEMORY,      // ACPI可回收内存: EfiACPIReclaimMemory
    ACPI_MEMORY_NVS,   // ACPI NVS内存: EfiACPIMemoryNVS
    UNUSEABLE_MEMORY, // 不可用的内存: EfiUnusableMemory
    MAX_MEMORY_TYPE,   // (EfiMaxMemoryType)
} memory_type_t;

typedef struct
{
    allocate_table_t free_page_desc_table;
} page_desc_t;

// 用于在free_block_list中代表一块内存
typedef list_node_t memory_block_t;

// 管理一个或多个页(由Zone::Large决定一个还是多个)
typedef struct
{
    memory_block_desc_t* desc; // 该内存区域属于哪个内存块类型,只有large为0时有效
    size_t cnt; // large:false -> 空闲内存单位数量. large:true -> 内存区页数
    BOOL large;
} zone_t;

// 描述全局的空闲页
PRIVATE page_desc_t global_page_desc;
PRIVATE allocate_table_entry_t page_desc_entries[1024];

memory_block_desc_t kernel_memory_block[NUMBER_OF_MEMORY_BLOCKES];

lock_t kernel_memory_lock;

uintptr_t addr_page_round_up(uintptr_t addr)
{
    return DIV_ROUND_UP(addr,PG_SIZE) * PG_SIZE;
}

uintptr_t addr_page_round_down(uintptr_t addr)
{
    return (addr & ~(PG_SIZE - 1UL));
}

PRIVATE memory_type_t type_uefi2os(EFI_MEMORY_TYPE efi_type)
{
    memory_type_t type;
    switch(efi_type)
    {
        case EfiConventionalMemory:
        case EfiBootServicesCode:
        case EfiBootServicesData:
        case EfiLoaderCode:
        case EfiLoaderData:
            type = FREE_MEMORY;
            break;
        case EfiRuntimeServicesCode:
        case EfiRuntimeServicesData:
        case EfiMemoryMappedIO:
        case EfiMemoryMappedIOPortSpace:
        case EfiPalCode:
        case EfiReservedMemoryType:
            type = RESERVED_MEMORY;
            break;
        case EfiACPIReclaimMemory:
            type = ACPI_MEMORY;
            break;
        case EfiACPIMemoryNVS:
            type = ACPI_MEMORY_NVS;
            break;
        case EfiUnusableMemory:
        case EfiMaxMemoryType:
            type = UNUSEABLE_MEMORY;
            break;
        default:
            type = MAX_MEMORY_TYPE; // 应该不会到这里
            break;
    }
    return type;
}

void memory_block_init(memory_block_desc_t* memory_block_desc)
{
    int idx;
    size_t block_size = 128;
    for(idx = 0;idx < NUMBER_OF_MEMORY_BLOCKES;idx++)
    {
        memory_block_desc[idx].block_size = block_size;
        memory_block_desc[idx].number_of_blocks = (PG_SIZE - sizeof(zone_t)) / memory_block_desc[idx].block_size;
        list_init(&(memory_block_desc[idx].free_block_list));
        // lock_init(&kernel_memory_lock);
        block_size *= 2;
    }
    return;
}

void init_memory()
{
    position_t pos;
    pos.x = 10;
    pos.y = 250;
    allocate_table_init(&global_page_desc.free_page_desc_table,page_desc_entries,1024);
    int i,number_of_memory_desct = g_boot_info.memory_map.map_size / g_boot_info.memory_map.descriptor_size;
    uintptr_t total_free = 0;
    EFI_MEMORY_DESCRIPTOR* efi_memory_desc = (EFI_MEMORY_DESCRIPTOR*)g_boot_info.memory_map.buffer;
    int MemoryLimit;
    char s[256];
    for(i = 0;i < number_of_memory_desct;i++)
    {
        // 检查内存类型,只有FreeMemory才记录
        if (type_uefi2os(efi_memory_desc[i].Type) == FREE_MEMORY)
        {
            uintptr_t start = efi_memory_desc[i].PhysicalStart;
            uintptr_t end = start + (efi_memory_desc[i].NumberOfPages << 12);
            // 继续寻找,直到不是FreeMemory
            int j;
            for(j = i + 1;j < number_of_memory_desct;j++)
            {
                if (type_uefi2os(efi_memory_desc[j].Type) != FREE_MEMORY || end != efi_memory_desc[j].PhysicalStart)
                {
                    break;
                }
                end += efi_memory_desc[j].NumberOfPages << 12;
            }
            i = j - 1; // 由于会 i++
            MemoryLimit = efi_memory_desc[i].PhysicalStart + (efi_memory_desc[i].NumberOfPages << 12);
            // 对齐到2MB
            start = addr_page_round_up(start) / PG_SIZE;
            if (start <= 4) {start = 5;}
            end = addr_page_round_down(end) / PG_SIZE;
            if (end > start && end - start >= 1) // 满1页
            {
                sprintf(s,"Free: %p - %p Page: %d\n",start * PG_SIZE,end * PG_SIZE,end - start);
                vput_utf8_str(&g_boot_info.graph_info,&pos,color(0,255,0),s,FONT_NORMAL);
                free_units(&global_page_desc.free_page_desc_table,start,end - start);
                total_free += (end - start) * PG_SIZE;
            }
        }
    }
    memory_block_init(kernel_memory_block);
    sprintf(s,"Memlim: %p == %d(MB)\ntotal free: %dMB",MemoryLimit,MemoryLimit / 0x100000,total_free / 0x100000);
    vput_utf8_str(&g_boot_info.graph_info,&pos,color(0,255,0),s,FONT_NORMAL);
    lock_init(&kernel_memory_lock);
    return;
}

PUBLIC void* alloc_page(int number_of_pages)
{
    if (number_of_pages == 0) {return NULL;}
    return (void*)(0UL + allocate_units(&global_page_desc.free_page_desc_table,number_of_pages) * PG_SIZE);
}

PUBLIC void free_page(void* addr,int number_of_pages)
{
    if (number_of_pages == 0 || addr == NULL || ((((uintptr_t)addr) & 0x1fffff) != 0))
    {
        return;
    }
    free_units(&global_page_desc.free_page_desc_table,(uintptr_t)addr / PG_SIZE,number_of_pages);
    return;
}

PRIVATE memory_block_t* znoe2block(zone_t* z,int idx)
{
    // 使地址对齐到大小的整倍数
    uintptr_t addr = DIV_ROUND_UP(((uintptr_t)z) + sizeof(*z),z->desc->block_size) * (z->desc->block_size);
    return ((memory_block_t*)(addr + (idx * (z->desc->block_size))));
}

PRIVATE zone_t* block2zone(memory_block_t* b)
{
    return ((zone_t*)((uintptr_t)b & 0xffffffffffe00000));
}

PUBLIC void* kmalloc(size_t size)
{
    zone_t* z;
    memory_block_t* b;
    memory_block_desc_t* memory_block_desc = kernel_memory_block;
    lock_acquire(&kernel_memory_lock);
    if (size <= MAX_ALLOCATE_MEMORY_SIZE)
    {
        int idx;
        for(idx = 0;idx < NUMBER_OF_MEMORY_BLOCKES;idx++)
        {
            if (size <= memory_block_desc[idx].block_size)
            {
                break;
            }
        }
        if (list_empty(&(memory_block_desc[idx].free_block_list))) // 内存池已满
        {
            z = alloc_page(1);
            ASSERT(z != NULL);
            if (z == NULL)
            {
                PANIC("No enough Memory.");
                lock_release(&kernel_memory_lock);
                return NULL;
            }
            // 初始化
            memset(z,0,PG_SIZE);
            z->desc = &memory_block_desc[idx];
            z->large = FALSE;
            z->cnt = memory_block_desc[idx].number_of_blocks;
            size_t block_index;
            // 将内存拆分成内存块,加入到FreeBlockList队列中
            for(block_index = 0;block_index < memory_block_desc[idx].number_of_blocks;block_index++)
            {
                b = znoe2block(z,block_index);
                ASSERT(!(list_find(&(z->desc->free_block_list),b)));
                list_append(&(z->desc->free_block_list),b);
            }
        }
        /* 获取一个内存块 */
        b = list_pop(&(memory_block_desc[idx].free_block_list));
        ASSERT(b != NULL);
        memset(b,0,memory_block_desc[idx].block_size);
        z = block2zone(b);
        z->cnt--;
        lock_release(&kernel_memory_lock);
        return ((void*)b);
    }
    else // 要分配的内存大于最大内存块大小
    {
        // 直接分配整页内存
        size_t number_of_pages;
        number_of_pages = DIV_ROUND_UP(size + sizeof(*z),PG_SIZE);
        z = alloc_page(number_of_pages);
        if (z == NULL)
        {
            ASSERT(z != NULL);
            lock_release(&kernel_memory_lock);
            return NULL;
        }
        z->desc = NULL;
        z->cnt = number_of_pages;
        z->large = TRUE;
        ASSERT(z->desc == NULL && z->cnt == number_of_pages && z->large == TRUE);
        lock_release(&kernel_memory_lock);
        return (void*)(z + 1); // 节约内存,不对齐
    }
    PANIC("No enough Memory.");
    lock_release(&kernel_memory_lock);
    return NULL;
}

PUBLIC void kfree(void* addr)
{
    if (addr == NULL)
    {
        return;
    }
    zone_t* z;
    memory_block_t* b;
    lock_acquire(&kernel_memory_lock);
    b = addr;
    z = block2zone(b);
    if (z->desc == NULL && z->large == TRUE)
    {
        free_page(z,z->cnt);
    }
    else
    {
        list_append(&(z->desc->free_block_list),b);
        z->cnt++;
        // 如果内存区域全部为空,则删除整个Zone
        if (z->cnt == z->desc->number_of_blocks)
        {
            size_t idx;
            for(idx = 0;idx < z->desc->number_of_blocks;idx++)
            {
                b = znoe2block(z,idx);
                ASSERT(list_find(&(z->desc->free_block_list),b));
                list_remove(b);
            }
            free_page(z,1);
        }
    }
    lock_release(&kernel_memory_lock);
    return;
}