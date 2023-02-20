#ifndef __STDLIB_H__
#define __STDLIB_H__

typedef unsigned long long int size_t;

// #define malloc kmalloc
// #define free kfree
#include <memory.h>
static inline void* malloc(int x){return kmalloc(x);}
static inline void free(void* addr){kfree(addr);}

#endif