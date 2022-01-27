#ifndef __MEMORY_H__
#define __MEMORY_H__

#include "bitmap.h"

#define PG_SIZE 4096

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