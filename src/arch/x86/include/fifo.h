#ifndef __FIFO_H__
#define __FIFO_H__

#include "stdint.h"

struct FIFO
{
    union
    {
        uint8_t* buf8;
        uint16_t* buf16;
        uint32_t* buf32;
        uint64_t* buf64;
    }buf;
    int type;
    int size;
    int nr;
    int nw;
    int flage;
};

#endif /* __FIFO_H__ */
