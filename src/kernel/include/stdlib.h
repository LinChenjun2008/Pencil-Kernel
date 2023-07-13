#ifndef __STDLIB_H__
#define __STDLIB_H__

typedef unsigned long long int size_t;

// #define malloc pmalloc
// #define free pfree
#include <memory.h>
static inline void* malloc(int x){return pmalloc(x);}
static inline void free(void* addr){pfree(addr);}

#endif