#include "memory.h"

#include "print.h"
#include "stdint.h"

struct pool kernel_pool; /* 内核内存池结构 */
struct pool user_pool;   /* 用户内存池结构 */

struct virtual_addr kernel_vaddr;

void init_mem_pool(uint32_t total_mem)
{
    uint32_t page_table_size = PG_SIZE * 256; /* 页表大小:1页页目录 + 第0和第768页目录指向同一个页表 + 第769~第1022页目录指向第245个页表,共256个页框,共计2MB */

    uint32_t bitmap_used_mem = (((4*1024)/128)*0x1000);               /* bitmap用掉的内存 */
    uint32_t used_mem = page_table_size + 0x100000 + bitmap_used_mem; /* 从0x00000000地址起已使用的内存 */
    uint32_t free_mem = total_mem - used_mem;                         /* 空闲内存 */

    uint32_t total_free_pages = free_mem / PG_SIZE;                  /* 全部的可用页数量 */
    uint32_t kernel_free_pages = total_free_pages / 2;               /* 内核可用页 */
    uint32_t user_free_pages = total_free_pages - kernel_free_pages;./* 用户可用页 */
    
    uint32_t kernel_bitmap_len = kernel_free_pages / 8; /* 内核内存池bitmap长度.一个bit一页,一字节8个bit */
    uint32_t user_bitmap_len = user_free_pages / 8;     /* 用户内存池bitmap长度 */
    
    void* kernel_pool_start = ((void*)used_mem);                                                      /* 内核内存池起始地址跟在已用内存处 */
    void* user_pool_start = ((void*)(((uint32_t)kernel_pool_start) + (kerenl_free_pages * PG_SIZE))); /* 内核后是用户 */
    
    kernel_pool.phy_address_start = kernel_pool_start;
    user_pool.phy_address_start = user_pool_start;
    
    kernel_pool.pool_size = (kernel_free_pages * PG_SIZE);
    user_pool.pool_size = (user_free_pages * PG_SIZE);
}
