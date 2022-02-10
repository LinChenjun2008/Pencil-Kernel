#ifndef __MEMORY_H__
#define __MEMORY_H__

#include "stdint.h"

#define MEMMAN_MAX 4000

struct MEMINFO
{
    void* addr;    /* 一块内存的起始地址物理地址 */
    uint32_t size; /* 大小(单位:页) */
};

struct MEMMAN
{
    uint32_t frees;                  /* 可用内存信息数量 */
    uint32_t maxfrees;               /* frees到达过的最大值(越大,内存越分散) */
    uint32_t lostsize;               /* 回收失败的内存大小 */
    uint32_t lostcnt;                /* 回收失败的次数 */
    struct MEMINFO free[MEMMAN_MAX]; /* 内存使用信息 */
};

/* 物理地址管理 */
extern struct MEMMAN kernel_pool;
extern struct MEMMAN user_pool;

/* 虚拟地址管理 */
extern struct MEMMAN kernel_vaddr;
extern struct MEMMAN user_vaddr;

void init_memory();
void init_memman(struct MEMMAN* memman);
uint32_t TotalFreeSize(struct MEMMAN* memman);
void* mem_alloc(struct MEMMAN* memman,uint32_t size);
void* mem_alloc_page(struct MEMMAN* memman,uint32_t size);
int mem_free(struct MEMMAN* memman,void* addr,uint32_t size);
int mem_free_page(struct MEMMAN* memman,void* addr,uint32_t size);

#endif /* __MEMORY_H__ */