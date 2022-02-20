#ifndef __MATH_H__
#define __MATH_H__

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
