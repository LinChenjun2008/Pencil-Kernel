#ifndef __CPU_H__
#define __CPU_H__

#include <global.h>
static __inline__ wordsize_t rdmsr(wordsize_t aaddress)
{
    wordsize_t edx = 0;
    wordsize_t eax = 0;
    __asm__ __volatile__ ("rdmsr":"=d"(edx),"=a"(eax):"c"(address):"memory");
    return (edx << 32) | eax;
}

static __inline__ void wrmsr(wordsize_t aaddress,uint64_t value)
{
    __asm__ __volatile__ ("wrmsr"::"d"(value >> 32),"a"(value & 0xffffffff):"c"(address):"memory");
    return (edx << 32) | eax;
}

#endif