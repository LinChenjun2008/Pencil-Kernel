#ifndef __MATH_H__
#define __MATH_H__

/* sqrt
* 平方根
* "t"是第一个浮点数寄存器
*/
static inline double sqrt(double x)
{
    double res;
    __asm__ __volatile__
    (
        "fsqrt"
        :"=t"(res)
        :"0"(x)
    );
    return res;
}

/**
 * @brief x的y次方
*/
static inline double pow(double x,double y)
{
	double res = 1;
    int i = 1;
    if(y == 0)
    {
        return res;
    }
    while(i++ <= y)
    {
        res *= x;
    }
	return res;
}

static inline double sin(double x)
{
    double res;
    __asm__ __volatile__
    (
        "fsin"
        :"=t"(res)
        :"0"(x)
    );
    return res;
}

static inline double cos(double x)
{
	double res;
	__asm__ __volatile__
    (
        "fcos"
        :"=t"(res)
        :"0"(x)
    );
	return res;
}

static inline double atan2(double x,double y)
{
	double res;
   __asm__ __volatile__
   (
        "fpatan\n\t"
        "fld %%st(0)\n\t"
        : "=t" (res)
        : "0" (y), "u" (x)
   );
	return res;
}

static inline double acos(double x)
{
    return atan2(sqrt (1.0 - x * x), x);
}

static inline double floor(double x)
{
    register double res;
    unsigned short int temp1, temp2;
    __asm__ __volatile__ ("fnstcw %0" : "=m" (temp1));
    temp2 = (temp1 & 0xf3ff) | 0x0400; /* rounding down */
    __asm__ __volatile__ ("fldcw %0" : : "m" (temp2));
    __asm__ __volatile__ ("frndint" : "=t" (res) : "0" (x));
    __asm__ __volatile__ ("fldcw %0" : : "m" (temp1));
    return res;
}

static inline double ceil(double x)
{
    register double ret;
    unsigned short int temp1, temp2;
    __asm__ __volatile__ ("fnstcw %0" : "=m" (temp1));
    temp2 = (temp1 & 0xf3ff) | 0x0800; /* rounding up */
    __asm__ __volatile__ ("fldcw %0" : : "m" (temp2));
    __asm__ __volatile__ ("frndint" : "=t" (ret) : "0" (x));
    __asm__ __volatile__ ("fldcw %0" : : "m" (temp1));
    return ret;
}

static inline double fmod(double x,double y)
{
    return x - (int)(x / y) * y;
}

static inline double fabs(double x)
{
	double res;
	__asm__ __volatile__
    (
        "fabs"
        :"=t"(res)
        :"0"(x)
    );
	return res;
}

#endif