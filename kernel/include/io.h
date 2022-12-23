#ifndef __IO_H__
#define __IO_H__

#include "global.h"

#include "stdint.h"

static inline void io_hlt(void)
{
    __asm__ __volatile__ ("hlt":::"memory");
    return;
}

static inline void io_sti(void)
{
    __asm__ __volatile__ ("sti;":::"memory");
    return;
}

static inline void io_cli(void)
{
    __asm__ __volatile__ ("cli;":::"memory");
    return;
}

static inline void io_stihlt(void)
{
    __asm__ __volatile__ ("sti;hlt;":::"memory");
    return;
}

static inline uint32_t io_in8(uint32_t port)
{
    uint32_t data;
    __asm__ __volatile__
    (
        "inb %w[port],%b[data];"
        :[data]"=a"(data)
        :[port]"d"(port)
        :"memory"
    );
    return data;
}

static inline uint32_t io_in16(uint32_t port)
{
    uint32_t data;
    __asm__ __volatile__
    (
        "inw %w[port],%w[data];"
        :[data]"=a"(data)
        :[port]"d"(port)
        :"memory"
    );
    return data;
}

static inline uint32_t io_in32(uint32_t port)
{
    uint32_t data;
    __asm__ __volatile__
    (
        "inl %w[port],%k[data];"
        :[data]"=a"(data)
        :[port]"d"(port)
        :"memory"
    );
    return data;
}



static inline void io_out8(uint32_t port,uint32_t data)
{
    __asm__ __volatile__
    (
        "outb %b[data],%w[port];"
        :
        :[data]"a"(data),[port]"d"(port)
        :"memory"
    );
}

static inline void io_out16(uint32_t port,uint32_t data)
{
    __asm__ __volatile__
    (
        "outw %w[data],%w[port];"
        :
        :[data]"a"(data),[port]"d"(port)
        :"memory"
    );
}

static inline void io_out32(uint32_t port,uint32_t data)
{
    __asm__ __volatile__
    (
        "outl %k[data],%w[port];"
        :
        :[data]"a"(data),[port]"d"(port)
        :"memory"
    );
}

static inline uint32_t get_flages()
{
    uint32_t flages;
    __asm__ __volatile__
    (
        "pushf;"      /* 将flage寄存器压栈 */
        "pop %q[flages];" 
        :[flages]"=a"(flages)
        :
        :"memory"
    );
    return flages;
}

#endif /* __IO_H__ */

/* 内联汇编 格式
   asm [volatile](汇编代码:输出部分:输入部分:损坏部分);
*/