#ifndef __MATH_H__
#define __MATH_H__

#include "global.h"

/* sqrt
* 平方根
* "t"是第一个浮点数寄存器
*/
static inline double sqrt(double x)
{
    double result;
    __asm__ __volatile__
    (
        "fsqrt"
        :"=t"(result)
        :"t"(x)
        :"memory"
    );
    return result;
}

static inline double sin(double x)
{
    double result;
    __asm__ __volatile__
    (
        "fsin"
        :"=t"(result)
        :"t"(x)
        :"memory"
    );
    return result;
}

#endif /* __MATH_H__ */
