#include "memory.h"
#include "global.h"
#include "stdint.h"

/* 物理地址管理 */
struct MEMMAN kernel_pool;
struct MEMMAN user_pool;

/* 虚拟地址管理 */
struct MEMMAN kernel_vaddr;
struct MEMMAN user_vaddr;

void init_memory()
{
    uint32_t k_Total;
    uint32_t u_Total;
    k_Total = (TotalMen_l - 0x00102000)/2;
    u_Total = Total_l - k_Total;
    mem_free_page(kernel_pool,0x00102000,k_Total);
    mem_free_page(kernel_pool,0x00102000,k_Total);

    mem_free_page(kernel_vaddr,0x00000000,0x00100000);
    mem_free_page(kernel_vaddr,0xc0000000,0x3fffffff);
    return;
}

void init_memmam(struct MEMMAN* memman)
{
    memman->frees = 0;
    memman->maxfrees = 0;
    memman->lostsize = 0;
    memman->lostcnt = 0;
    return;
}

uint32_t TotalFreeSize(struct MEMMAN* memman)
{
    uint32_t total = 0;
    int i;
    for(i = 0;i < (memman->frees);i++)
    {
        total += memman->free[i].size;
    }
    return total;
}

void* mem_alloc(struct MEMMAN* memman,uint32_t size)
{
    void* addr;
    int i;
    int j;
    /* 遍历所有内存使用信息,找到合适的大小 */
    for(i = 0;i < (memman->frees);i++)
    {
        /* 如果大小合适 */
        if(memman->free[i].size >= size)
        {
            /* 记录可用空间的大小 */
            addr = memman->free[i].addr;
            /* 可用地址向后推size大小 */
            (memman->free[i].addr) += size;
            /* 可用空间大小减小 */
            memman->free[i].size -= size;
            /* 如果没有可用空间,可用信息减掉一条 */
            if(memman->free[i].size == 0)
            {
                memman->frees --; /* 减一条 */
                /* 把空的那一条覆盖掉 */
                for(j = i;j < (memman->frees);j++)
                {
                    memman->free[j] = memman->free[j + 1];
                }
            }
            return addr;
        }
    }
    return NULL;
}

void* mem_alloc_page(struct MEMMAN* memman,uint32_t size)
{
    return mem_alloc(memman,((size + 0xfff) & 0xfffff000));
}

int mem_free(struct MEMMAN* memman,void* addr,uint32_t size)
{
    int i;
    int j;
    int k;
    /* 寻找memman->free[i],使memman->free[i - 1].addr < addr < free[i].addr */
    for(i = 0;i < (memman->frees);i++)
    {
        /* memman->free[i].addr > addr,那么memman->free[i - 1] < addr */
        if(memman->free[i].addr > addr)
        {
            break;
        }
    }
    /* 前面有可用的内存 */
    if(i > 0)
    {
        /* 可以和前面的归到一起 */
        if(((void*)((((uint8_t*)(memman->free[i - 1].addr)) + memman->free[i - 1].size))) == addr)
        {
            memman->free[i - 1].size += size;
            if(i < (memman->frees))
            {
                if(((void*)((uint8_t*)addr + size)) == memman->free[i].addr)
                {
                    memman->free[i - 1].size += memman->free[i].size;
                    memman->frees--;
                    for(j = i;j < (memman->frees);j++)
                    {
                        memman->free[j] = memman->free[j + 1];
                    }
                }
            }
            /* 完成 */
            return 0;
        }
    }
    /* 不能和前面归到一起的话会来到这里 */
    if(i < (memman->frees))
    {
        if(((void*)((uint8_t*)addr + size)) == memman->free[i].addr)
        {
            memman->free[i].addr = addr;
            memman->free[i].size += size;
            return 0;
        }
    }
    /* 前后都不能合并 */
    if((memman->frees) < MEMMAN_MAX)
    {
        /* free[i]往后移动,腾出空间 */
        for(k = (memman->frees);k > i;k++)
        {
            memman->free[k] = memman->free[k - 1];
        }
        memman->frees++;
        if((memman->maxfrees) < (memman->frees))
        {
            memman->maxfrees = memman->frees;
        }
        memman->free[i].addr = addr;
        memman->free[i].size = size;
        return 0;
    }
    /* 不能移动 */
    memman->lostcnt++;
    memman->lostsize += size;
    return 1;
}

int mem_free_page(struct MEMMAN* memman,void* addr,uint32_t size)
{
    return mem_free(memman,addr,((size + 0xfff) & 0xfffff000));
}