#ifndef __MEMORY_H__
#define __MEMORY_H__

#include "bitmap.h"

#define PG_SIZE 4096 /* 页表尺寸,4096字节,4KB */
#define MemBitmapBaseAddress 0xc0100000 /* 内存bitmap的起始地址,0xc0100000~0xc011fff共计32页是bitmap,可管理4GB内存 */
#define KernelHeapStart 0xc0120000 /* 内核堆起始地址 */

struct virtual_addr
{
    struct bitmap vaddr_bitmap; /* 虚拟地址用到的内存bitmap */
    uint32_t vaddr_start;       /* 虚拟地址起始处 */
};

struct pool
{
    struct bitmap pool_bitmap;  /* 用于管理物理内存的bitmao */
    uint32_t phy_address_start; /* 所管理的物理内存起始地址 */
    uint32_t pool_size;         /* 内存池字节容量 */
};

extern struct pool kernel_pool;
extern struct pool user_pool;

void init_mem();

#endif /* __MEMORY_H__ */
