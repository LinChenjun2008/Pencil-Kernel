#include <memory.h>
#include <bitmap.h>
#include <Efi.h>
#include <interrupt/interrupt.h>
#include <device/serial.h>

#include <device/acpi.h>

#include <std/string.h>
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


typedef list_node_t memory_block_t;

typedef struct
{
    memory_group_t *group;  // 该内存区域属于哪个内存块类型,只有large为0时有效
    uint64_t        number_of_blocks;
    size_t          cnt;   // large:false -> 空闲内存单位数量. large:true -> 内存区页数
    bool            large;
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
            type = MAX_MEMORY_TYPE;
            break;
    }
    return type;
}


PRIVATE void init_memory_group()
{
    int group_block_size = MIN_ALLOCATE_MEMORY_SIZE;
    int i;
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
        pmalloc(group_block_size);
        group_block_size *= 2;
    }
    return;
}

PRIVATE void make_page_table(uintptr_t max_address)
{
    uint8_t* paddr;
    for ( paddr = (void*)0x10000000UL;
          paddr <= (uint8_t*)max_address;
          paddr += PG_SIZE )
    {
        page_map((uint64_t*)KERNEL_PAGE_DIR_TABLE_POS,paddr,paddr);
    }
    return;
}

void init_memory()
{
    page_bitmap.map = page_bitmap_map;
    page_bitmap.btmp_bytes_len = PAGE_BITMAP_BYTES_LEN;
    bitmap_init(&page_bitmap);
    int number_of_memory_desct;
    number_of_memory_desct = g_boot_info.memory_map.map_size
                           / g_boot_info.memory_map.descriptor_size;
    uintptr_t total_free = 0;
    uintptr_t max_address = 0;
    int i;
    for (i = 0;i < number_of_memory_desct;i++)
    {
        EFI_MEMORY_DESCRIPTOR* efi_memory_desc =
                          (EFI_MEMORY_DESCRIPTOR*)g_boot_info.memory_map.buffer;
        uintptr_t start = efi_memory_desc[i].PhysicalStart;
        uintptr_t end   = start + (efi_memory_desc[i].NumberOfPages << 12);
        max_address     = efi_memory_desc[i].PhysicalStart
                          + (efi_memory_desc[i].NumberOfPages << 12);
        if (type_uefi2os(efi_memory_desc[i].Type) != FREE_MEMORY)
        {
            start = page_index_low(start);
            end   = page_index_high(end);
            uint64_t j;
            for(j = start;j < end;j++)
            {
                bitmap_set(&page_bitmap,j,1);
            }
        }
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
    if (max_address / PG_SIZE < PAGE_BITMAP_BYTES_LEN)
    {
        page_bitmap.btmp_bytes_len = max_address / PG_SIZE;
    }
    // 剔除被占用的内存(0 - 16M)
    for (i = 0;i < 8;i++)
    {
        bitmap_set(&page_bitmap,i,1);
    }
    init_memory_group();
    if (max_address > 0xffffffff)
    {
        make_page_table(max_address);
    }
    return;
}

PUBLIC void* alloc_physical_page(uint64_t number_of_pages)
{
    if (number_of_pages == 0)
    {
        return NULL;
    }
    intr_status_t intr_status = intr_disable();
    signed int index = bitmap_alloc(&page_bitmap,number_of_pages);
    uintptr_t paddr = 0;
    if (index != -1)
    {
        uint64_t i;
        for (i = index;i < index + number_of_pages;i++)
        {
            bitmap_set(&page_bitmap,i,1);
        }
        paddr = (0UL + (uintptr_t)index * PG_SIZE);
        memset(KADDR_P2V(paddr),0,number_of_pages * PG_SIZE);
    }
    intr_set_status(intr_status);
    return (void*)paddr;
}

PUBLIC void free_physical_page(void* addr,uint64_t number_of_pages)
{
    if (number_of_pages == 0 || addr == NULL
        || ((((uintptr_t)addr) & 0x1fffff) != 0))
    {
        pr_log(COM1_PORT,"free_physical_page: Not a page addr");
        return;
    }
    intr_status_t intr_status = intr_disable();
    uintptr_t i;
    for (i = (uintptr_t)addr / PG_SIZE;
         i < (uintptr_t)addr / PG_SIZE + number_of_pages;i++)
    {
        bitmap_set(&page_bitmap,i,0);
    }
    intr_set_status(intr_status);
    return;
}

PRIVATE memory_block_t* znoe2block(zone_t* z,int idx)
{
    uintptr_t addr = (uintptr_t)z + sizeof(*z) + (PG_SIZE - sizeof(*z))
                    % z->group->block_size;
    return ((memory_block_t*)(addr + (idx * (z->group->block_size))));
}

PRIVATE zone_t* block2zone(memory_block_t* b)
{
    return ((zone_t*)((uintptr_t)b & 0xffffffffffe00000));
}

PUBLIC void* pmalloc(size_t size)
{
    int i;
    zone_t *z;
    memory_block_t *b;
    if (size > MAX_ALLOCATE_MEMORY_SIZE)
    {
        size_t number_of_pages;
        number_of_pages = DIV_ROUND_UP(size + sizeof(*z),PG_SIZE);
        z = KADDR_P2V(alloc_physical_page(number_of_pages));
        if (z == NULL)
        {
            pr_log(COM1_PORT,__func__);
            pr_log(COM1_PORT," Out of memory\n");
            return NULL;
        }
        z->group = NULL;
        z->cnt = number_of_pages;
        z->large = TRUE;
        return (void*)KADDR_V2P(z + 1);
    }
    for (i = 0;i < NUMBER_OF_MEMORY_BLOCK_TYPES;i++)
    {
        if (size <= global_memory_groups[i].block_size)
        {
            break;
        }
    }
    lock_acquire(&global_memory_groups[i].lock);
    if (list_empty(&global_memory_groups[i].free_block_list))
    {
        z = KADDR_P2V(alloc_physical_page(1));
        if (z == NULL)
        {
            pr_log(COM1_PORT,__func__);
            pr_log(COM1_PORT," Out of memory\n");
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
    return (void*)KADDR_V2P(b);
}


PUBLIC void pfree(void* addr)
{
    if (addr == NULL)
    {
        return;
    }
    zone_t* z;
    memory_block_t* b;
    b = KADDR_P2V(addr);
    z = block2zone(b);
    if (z->group == NULL && z->large == TRUE)
    {
        free_physical_page(KADDR_V2P(z),z->cnt);
        return;
    }
    lock_acquire(&z->group->lock);
    list_append(&z->group->free_block_list,b);
    z->cnt++;
    if (z->cnt == z->number_of_blocks)
    {
        size_t idx;
        for (idx = 0;idx < z->number_of_blocks;idx++)
        {
            b = znoe2block(z,idx);
            list_remove(b);
        }
        free_physical_page(KADDR_V2P(z),1);
    }
    lock_release(&z->group->lock);
    return;
}

PUBLIC uint64_t* pml4t_entry(void* pml4t,void* vaddr)
{
    return (uint64_t*)pml4t + ADDR_PML4T_INDEX(vaddr);
}

PUBLIC uint64_t* pdpt_entry(void* pml4t,void* vaddr)
{
    return (uint64_t*)(*pml4t_entry(pml4t,vaddr) & ~0xfff)
            + ADDR_PDPT_INDEX(vaddr);
}

PUBLIC uint64_t* pdt_entry(void* pml4t,void* vaddr)
{
    return (uint64_t*)(*pdpt_entry(pml4t,vaddr) & ~0xfff)
            + ADDR_PDT_INDEX(vaddr);
}

PUBLIC void* to_physical_address(void* pml4t,void* vaddr)
{
    return (void*)
        ( (*pdt_entry(pml4t,vaddr) & ~0xfff)
        + ADDR_OFFSET(vaddr));
}

/**
 * @brief 将paddr映射到虚拟地址vaddr处
 * @param pml4t 页目录表地址
 * @param paddr 物理地址
 * @param vaddr 虚拟地址
*/
PUBLIC void page_map(uint64_t* pml4t,void* paddr,void* vaddr)
{
    paddr = (void*)((uintptr_t)paddr & ~(PG_SIZE - 1));
    vaddr = (void*)((uintptr_t)vaddr & ~(PG_SIZE - 1));
    uint64_t *v_pml4t,*v_pml4e;
    uint64_t *v_pdpt,*pdpt,*v_pdpte,*pdpte;
    uint64_t *v_pdt,*pdt,*v_pde,*pde;
    v_pml4t = KADDR_P2V(pml4t);
    v_pml4e = v_pml4t + ADDR_PML4T_INDEX(vaddr);
    if (!(*v_pml4e & PG_P))
    {
        pdpt = pmalloc(PT_SIZE);
        v_pdpt = KADDR_P2V(pdpt);
        memset(v_pdpt,0,PT_SIZE);
        *v_pml4e = (uint64_t)pdpt | PG_US_U | PG_RW_W | PG_P;
    }
    pdpt = (uint64_t*)(*v_pml4e & (~0xfff));
    pdpte = pdpt + ADDR_PDPT_INDEX(vaddr);
    v_pdpte = KADDR_P2V(pdpte);
    if (!(*v_pdpte & PG_P))
    {
        pdt = pmalloc(PT_SIZE);
        v_pdt = KADDR_P2V(pdt);
        memset(v_pdt,0,PT_SIZE);
        *v_pdpte = (uint64_t)pdt | PG_US_U | PG_RW_W | PG_P;
    }
    pdt = (uint64_t*)(*v_pdpte & (~0xfff));
    pde = pdt + ADDR_PDT_INDEX(vaddr);
    v_pde = KADDR_P2V(pde);
    *v_pde = (uint64_t)paddr | PG_US_U | PG_RW_W | PG_P | PG_SIZE_2M;
}

/**
 * @brief 取消内存的映射
 * @param pml4t 页目录地址
 * @param vaddr 要取消映射的虚拟地址
*/
void page_unmap(uint64_t* pml4t,void* vaddr)
{
    vaddr = (void*)((uintptr_t)vaddr & ~(PG_SIZE - 1));
    uint64_t *v_pml4t,*v_pml4e;
    uint64_t *pdpt,*v_pdpte,*pdpte;
    uint64_t *pdt,*v_pde,*pde;
    v_pml4t = KADDR_P2V(pml4t);
    v_pml4e = v_pml4t + ADDR_PML4T_INDEX(vaddr);
    if (!(*v_pml4e & PG_P))
    {
        return;
    }
    pdpt = (uint64_t*)(*v_pml4e & (~0xfff));
    pdpte = pdpt + ADDR_PDPT_INDEX(vaddr);
    v_pdpte = KADDR_P2V(pdpte);
    if (!(*v_pdpte & PG_P))
    {
        return;
    }
    pdt = (uint64_t*)(*v_pdpte & (~0xfff));
    pde = pdt + ADDR_PDT_INDEX(vaddr);
    v_pde = KADDR_P2V(pde);
    *v_pde &= ~PG_P;
}