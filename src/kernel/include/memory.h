#ifndef __MEMORY_H__
#define __MEMORY_H__

#include <alloc_table.h>
#include <list.h>
#include <sync.h>
#include <stddef.h>

// 描述一种类型的内存块
typedef struct
{
    size_t block_size;
    size_t number_of_blocks;
    list_t free_block_list;
} memory_block_desc_t;

// 所支持分配的最大内存块大小,超过这个数就直接分配整页
#define MAX_ALLOCATE_MEMORY_SIZE 524288

// 内存块种类的数量
#define NUMBER_OF_MEMORY_BLOCKES 13

PUBLIC void init_memory();

/**
 * @brief 分配指定页数
 * @param number_of_pages 要分配的内存页数
 * @return 分配的内存页起始地址
*/
PUBLIC void* alloc_page(int number_of_pages);

/**
 * @brief 释放指定页数
 * @param addr 释放内存页的起始地址(对齐到2MB边界)
 * @param number_of_pages 要释放的内存页数
 * @return 分配的内存页起始地址
*/
PUBLIC void free_page(void* addr,int number_of_pages);

PUBLIC void* kmalloc(size_t size);
PUBLIC void kfree(void* addr);

#endif