#ifndef __STDLIB_H__
#define __STDLIB_H__

typedef unsigned long long int size_t;
#include <kernel/global.h>
#include <memory.h>

static inline void* malloc(int x){return KADDR_P2V(pmalloc(x));}
static inline void free(void* addr){pfree(KADDR_V2P(addr));}

#endif