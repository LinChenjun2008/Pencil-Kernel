#include "memory.h"

#include "print.h"
#include "stdint.h"

void init_mem_pool(uint32_t total_mem)
{
    uint32_t page_table_size = PG_SIZE * 256; /* 页表大小:1页页目录 + 第0和第768页目录指向同一个页表 + 第769~第1022页目录指向第245个页表,共256个页框,共计2MB */

    uint32_t bitmap_used_mem = (((4*1024)/128)*0x1000);               /* bitmap用掉的内存 */
    uint32_t used_mem = page_table_size + 0x100000 + bitmap_used_mem; /* 已使用内存 */
    uint32_t free_mem = total_mem - used_mem;                         /* 空闲内存 */

    uint32_t total_free_pages = free_mem / PG_SIZE;                  /* 全部的可用页数量 */
    uint32_t kernel_free_pages = total_free_pages / 2;               /* 内核可用页 */
    uint32_t user_free_pages = total_free_pages - kernel_free_pages;./* 用户可用页 */
    
    
}
