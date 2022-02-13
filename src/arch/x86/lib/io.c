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
        "sti"
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
        "cli"
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
        "hlt"
        :
        :
        :"memory"
    );
    return;
}


/* io端口操作函数(内联汇编版) */
static inline uint32_t io_in8(uint32_t port)
{
    uint32_t data;
    asm volatile
    (
        "inb %w1,%b0"
        :"=al"(data)
        :"dx"(port)
        :"memory"
    );
    return data;
}

static inline uint32_t io_in16(uint32_t port)
{
    uint32_t data;
    asm volatile
    (
        "inb %w1,%w0"
        :"=ax"(data)
        :"dx"(port)
        :"memory"
    );
    return data;
}

static inline uint32_t io_in32(uint32_t port)
{
    uint32_t data;
    asm volatile
    (
        "inb %w1,%l0" /* 看清楚!是%l0,l0不是数字10,大写是L0! */
        :"=eax"(data)
        :"dx"(port)
        :"memory"
    );
    return data;
}



static inline void io_out8(uint32_t port,uint32_t data)
{
    asm volatile
    (
        "outb %b0,%w1"
        :
        :"al"(data),"dx"(port)
        :"memory"
    );
}

static inline void io_out16(uint32_t port,uint32_t data)
{
    asm volatile
    (
        "outw %w0,%w1"
        :
        :"ax"(data),"dx"(port)
        :"memory"
    );
}

static inline void io_out32(uint32_t port,uint32_t data)
{
    asm volatile
    (
        "outw %l0,%w1"
        :
        :"eax"(data),"dx"(port)
        :"memory"
    );
}

static inline uint32_t get_flages()
{
    uint32_t flages;
    asm volatile
    (
        "pushfd;"
        "popl eax;"
        :"=eax"(flages)
        :
        :"memory"
    );
    return flages;
}