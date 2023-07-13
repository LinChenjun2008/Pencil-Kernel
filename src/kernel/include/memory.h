#ifndef __MEMORY_H__
#define __MEMORY_H__

#include <list.h>
#include <sync.h>
#include <stddef.h>

// 所支持分配的最小内存块大小
#define MIN_ALLOCATE_MEMORY_SIZE 8192

// 所支持分配的最大内存块大小,超过这个数就直接分配整页
#define MAX_ALLOCATE_MEMORY_SIZE 524288

// 内存块种类的数量
#define NUMBER_OF_MEMORY_BLOCK_TYPES 7

// 地址的PML4E索引值
#define ADDR_PML4T_INDEX(ADDR) ((((uintptr_t)ADDR) & 0x0000ff8000000000) >> 39)

// 地址的PDPTE索引值
#define ADDR_PDPT_INDEX(ADDR)  ((((uintptr_t)ADDR) & 0x0000007fc0000000) >> 30)

#define ADDR_PDT_INDEX(ADDR)   ((((uintptr_t)ADDR) & 0x000000003fe00000) >> 21)

#define ADDR_OFFSET(ADDR)      ((((uintptr_t)ADDR) & 0x00000000001fffff) >>  0)

#define flush_tlb() __asm__ __volatile__("movq %%cr3,%%rax\n\t""movq %%rax,%%cr3":::"rax")

PUBLIC void init_memory();

/**
 * @brief 分配指定页数
 * @param number_of_pages 要分配的内存页数
 * @return 分配的内存页起始地址
*/
PUBLIC void* alloc_physical_page(uint64_t number_of_pages);

/**
 * @brief 释放指定页数
 * @param addr 释放内存页的起始地址(对齐到2MB边界)
 * @param number_of_pages 要释放的内存页数
 * @return 分配的内存页起始地址
*/
PUBLIC void free_physical_page(void* addr,uint64_t number_of_pages);

PUBLIC void* pmalloc(size_t size);
PUBLIC void pfree(void* addr);

PUBLIC uint64_t* pml4t_entry(void* vaddr);
PUBLIC uint64_t* pdpt_entry(void* vaddr);
PUBLIC uint64_t* pdt_entry(void* vaddr);

PUBLIC void* to_physical_address(void* vaddr);

PUBLIC void page_map(uint64_t* pml4t,void* paddr,void* vaddr);
#endif