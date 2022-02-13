#ifndef __IO_H__
#define __IO_H__

/* io端口操作函数 内联汇编版(还是用了内联汇编...)
* 由于函数都是static和inline,所以直接写在了头文件里
* 注:io.asm已经不用了,可以删了
*/
#include "stdint.h"

static inline void io_hlt(void)
{
    asm volatile
    (
        "hlt"
        :
        :
        :"memory"
    );
    return;
}

static inline void io_sti(void)
{
    asm volatile
    (
        "sti;"
        :
        :
        :"memory"
    );
    return;
}

static inline void io_cli(void)
{
    asm volatile
    (
        "cli;"
        :
        :
        :"memory"
    );
    return;
}

static inline void io_stihlt(void)
{
    asm volatile
    (
        "sti;"
        "hlt;"
        :
        :
        :"memory"
    );
    return;
}

static inline uint32_t io_in8(uint32_t port)
{
    uint32_t data;
    asm volatile
    (
        "inb %w[port],%b[data];"
        :[data]"=a"(data)
        :[port]"dx"(port)
        :"memory"
    );
    return data;
}

static inline uint32_t io_in16(uint32_t port)
{
    uint32_t data;
    asm volatile
    (
        "inw %w[port],%w[data];"
        :[data]"=a"(data)
        :[port]"dx"(port)
        :"memory"
    );
    return data;
}

static inline uint32_t io_in32(uint32_t port)
{
    uint32_t data;
    asm volatile
    (
        "inl %w[port],%k[data];"
        :[data]"=eax"(data)
        :[port]"dx"(port)
        :"memory"
    );
    return data;
}



static inline void io_out8(uint32_t port,uint32_t data)
{
    asm volatile
    (
        "outb %b[data],%w[port];"
        :
        :[data]"a"(data),[port]"dx"(port)
        :"memory"
    );
}

static inline void io_out16(uint32_t port,uint32_t data)
{
    asm volatile
    (
        "outw %w[data],%w[port];"
        :
        :[data]"ax"(data),[port]"dx"(port)
        :"memory"
    );
}

static inline void io_out32(uint32_t port,uint32_t data)
{
    asm volatile
    (
        "outl %k[data],%w[port];"
        :
        :[data]"eax"(data),[port]"dx"(port)
        :"memory"
    );
}

static inline uint32_t get_flages()
{
    uint32_t flages;
    asm volatile
    (
        "pushf;"      /* 将flage寄存器压栈 */
        "popl %[flages];" 
        :[flages]"=m"(flages)
        :
        :"memory"
    );
    return flages;
}

#endif /* __IO_H__ */
