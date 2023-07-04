#include <memory.h>
#include <bitmap.h>
#include <debug.h>
#include <interrupt.h>
#include <serial.h>
#include <stdio.h>
#include <string.h>
#include <sync.h>
#include <Efi.h>

#define PAGE_BITMAP_BYTES_LEN 2048

typedef enum
{
    FREE_MEMORY = 1,  // 可用内存: EfiConventionalMemory EfiBootServices(Code/Data) EfiLoader(Code/Data) EfiReservedMemoryType
    RESERVED_MEMORY,  // 保留(不可用): EfiRuntimeServices(Code/Data) EfiMemoryMappedIO EfiMemoryMappedIOPortSpace EfiPalCode
    ACPI_MEMORY,      // ACPI可回收内存: EfiACPIReclaimMemory
    ACPI_MEMORY_NVS,   // ACPI NVS内存: EfiACPIMemoryNVS
    UNUSEABLE_MEMORY, // 不可用的内存: EfiUnusableMemory
    MAX_MEMORY_TYPE,   // (EfiMaxMemoryType)
} memory_type_t;

// 不同大小和类型的内存组
typedef struct
{
    size_t   block_size;            /* 内存块单元的大小 */
    uint64_t flags;                 /* 目前没有用处 */
    lock_t   lock;
    list_t   free_block_list;       /* 组中所有的内存块 */
} memory_group_t;

PRIVATE memory_group_t global_memory_groups[NUMBER_OF_MEMORY_BLOCK_TYPES];

PRIVATE bitmap_t page_bitmap;
PRIVATE uint8_t  page_bitmap_map[PAGE_BITMAP_BYTES_LEN];
PRIVATE lock_t   physical_page_lock;

typedef list_node_t memory_block_t;

typedef struct
{
    memory_group_t *group;  // 该内存区域属于哪个内存块类型,只有large为0时有效
    uint64_t        number_of_blocks;
    size_t          cnt;   // large:false -> 空闲内存单位数量. large:true -> 内存区页数
    BOOL            large;
} zone_t;

size_t page_index_high(uintptr_t page_addr)
{
    return DIV_ROUND_UP(page_addr,PG_SIZE);
}

size_t page_index_low(uintptr_t page_addr)
{
    return page_addr / PG_SIZE;
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

void init_memory()
{
    page_bitmap.map = page_bitmap_map;
    page_bitmap.btmp_bytes_len = PAGE_BITMAP_BYTES_LEN;
    bitmap_init(&page_bitmap);
    int number_of_memory_desct;
    number_of_memory_desct = g_boot_info.memory_map.map_size / g_boot_info.memory_map.descriptor_size;
    uintptr_t total_free = 0;
    uintptr_t memory_limit __attribute__((unused)) = 0;
    int i;
    for (i = 0;i < number_of_memory_desct;i++)
    {
        EFI_MEMORY_DESCRIPTOR* efi_memory_desc = (EFI_MEMORY_DESCRIPTOR*)g_boot_info.memory_map.buffer;
        uintptr_t start = efi_memory_desc[i].PhysicalStart;
        uintptr_t end   = start + (efi_memory_desc[i].NumberOfPages << 12);
        memory_limit = efi_memory_desc[i].PhysicalStart + (efi_memory_desc[i].NumberOfPages << 12);
        // 将非 FREE_MEMORY 的内存占用
        if (type_uefi2os(efi_memory_desc[i].Type) != FREE_MEMORY)
        {
            // 这样可能浪费一些内存,但可以保证可用内存不超出范围
            start = page_index_low(start);
            end   = page_index_high(end);
            uint64_t j;
            for(j = start;j < end;j++)
            bitmap_set(&page_bitmap,j,1);
        }
        // 空闲内存
        else
        {
            start = page_index_high(start);
            end   = page_index_low(end);
            if(end >= start)
            {
                total_free += (end - start) * PG_SIZE;
            }
        }
    }
    // 剔除被占用的内存
    for (i = 0;i < 4;i++)
    {
        bitmap_set(&page_bitmap,i,1);
    }
    for (i = 0;i <= g_boot_info.loaded_files;i++)
    {

    }
    lock_init(&physical_page_lock);
    // 初始化内存组
    int group_block_size = MIN_ALLOCATE_MEMORY_SIZE;
    for (i = 0;i < NUMBER_OF_MEMORY_BLOCK_TYPES;i++)
    {
        global_memory_groups[i].block_size            = group_block_size;
        global_memory_groups[i].flags                 = 0;
        lock_init(&global_memory_groups[i].lock);
        list_init(&global_memory_groups[i].free_block_list);
        group_block_size *= 2;
    }
    group_block_size = MIN_ALLOCATE_MEMORY_SIZE;
    for (i = 0;i < NUMBER_OF_MEMORY_BLOCK_TYPES;i++)
    {
        kmalloc(group_block_size);
        group_block_size *= 2;
    }
    return;
}

PUBLIC void* alloc_page(int number_of_pages)
{
    ASSERT(number_of_pages > 0);
    lock_acquire(&physical_page_lock);
    signed int index = bitmap_alloc(&page_bitmap,number_of_pages);
    uintptr_t paddr = 0;
    if (index != -1)
    {
        int i;
        for (i = index;i < index + number_of_pages;i++)
        {
            bitmap_set(&page_bitmap,i,1);
        }
        paddr = (0UL + (uintptr_t)index * PG_SIZE);
        memset((void*)paddr,0,number_of_pages * PG_SIZE);
    }
    lock_release(&physical_page_lock);
    return (void*)paddr;
}

PUBLIC void free_page(void* addr,int number_of_pages)
{
    if (number_of_pages == 0 || addr == NULL || ((((uintptr_t)addr) & 0x1fffff) != 0))
    {
        pr_log(COM1_PORT,"Free Address fail");
        return;
    }
    lock_acquire(&physical_page_lock);
    uintptr_t i;
    for (i = (uintptr_t)addr / PG_SIZE;i < (uintptr_t)addr / PG_SIZE + number_of_pages;i++)
    {
        bitmap_set(&page_bitmap,i,0);
    }
    lock_release(&physical_page_lock);
    return;
}

PRIVATE memory_block_t* znoe2block(zone_t* z,int idx)
{
    uintptr_t addr = (uintptr_t)z + sizeof(*z) + (PG_SIZE - sizeof(*z)) % z->group->block_size;
    return ((memory_block_t*)(addr + (idx * (z->group->block_size))));
}

PRIVATE zone_t* block2zone(memory_block_t* b)
{
    return ((zone_t*)((uintptr_t)b & 0xffffffffffe00000));
}

void* kmalloc(size_t size)
{
    int i;
    zone_t *z;
    memory_block_t *b;
    if (size > MAX_ALLOCATE_MEMORY_SIZE)
    {
        size_t number_of_pages;
        number_of_pages = DIV_ROUND_UP(size + sizeof(*z),PG_SIZE);
        z = alloc_page(number_of_pages);
        if (z == NULL)
        {
            pr_log(COM1_PORT,__func__);
            pr_log(COM1_PORT," NO MEMORY\n");
            return NULL;
        }
        z->group = NULL;
        z->cnt = number_of_pages;
        z->large = TRUE;
        return (void*)(z + 1);
    }
    for (i = 0;i < NUMBER_OF_MEMORY_BLOCK_TYPES;i++)
    {
        if (size <= global_memory_groups[i].block_size)
        {
            break;
        }
    }
    lock_acquire(&global_memory_groups[i].lock);
    // 内存块用完
    if (list_empty(&global_memory_groups[i].free_block_list))
    {
        // 初始化内存块
        z = alloc_page(1);
        if (z == NULL)
        {
            pr_log(COM1_PORT,__func__);
            pr_log(COM1_PORT," NO MEMORY\n");
            lock_release(&global_memory_groups[i].lock);
            return NULL;
        }
        memset(z,0,PG_SIZE);
        z->group            = &global_memory_groups[i];
        z->large            = FALSE;
        z->number_of_blocks = (PG_SIZE - sizeof(*z)
                                - (PG_SIZE - sizeof(*z)) % z->group->block_size)
                                / z->group->block_size;
        z->cnt              = z->number_of_blocks;
        size_t block_index;
        intr_status_t intr_status = intr_disable();
        for (block_index = 0;block_index < z->cnt;block_index++)
        {
            b = znoe2block(z,block_index);
            list_append(&z->group->free_block_list,b);
        }
        intr_set_status(intr_status);
    }
    b = list_pop(&global_memory_groups[i].free_block_list);
    memset(b,0,global_memory_groups[i].block_size);
    z = block2zone(b);
    z->cnt--;
    lock_release(&z->group->lock);
    return (void*)b;
}


PUBLIC void kfree(void* addr)
{
    if (addr == NULL)
    {
        return;
    }
    zone_t* z;
    memory_block_t* b;
    b = addr;
    z = block2zone(b);
    if (z->group == NULL && z->large == TRUE)
    {
        free_page(z,z->cnt);
        return;
    }
    lock_acquire(&z->group->lock);
    list_append(&z->group->free_block_list,b);
    z->cnt++;
    // 如果内存区域全部为空,则删除整个Zone
    if (z->cnt == z->number_of_blocks)
    {
        size_t idx;
        for (idx = 0;idx < z->number_of_blocks;idx++)
        {
            b = znoe2block(z,idx);
            ASSERT(list_find(&(z->group->free_block_list),b));
            list_remove(b);
        }
        free_page(z,1);
    }
    lock_release(&z->group->lock);
    return;
}