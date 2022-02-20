#ifndef __MATH_H__
#define __MATH_H__

/* sqrt
* 平方根
* "t"是第一个浮点数寄存器
*/
static inline double sqrt(double x)
{
    double result;
    asm volatile
    (
        "fsqrt"
        :"=t"(result)
        :"t"(x)
        :"memory"
    );
    return result;
}

#endif /* __MATH_H__ */
