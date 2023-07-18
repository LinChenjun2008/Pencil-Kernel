#ifndef __ASSERT_H__
#define __ASSERT_H__

#include <debug.h>
#define assert(x) ASSERT(x);
/* #define assert(x) if (x){}else{__asm__ __volatile__("int3");} */
#endif