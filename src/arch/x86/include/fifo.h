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
    };
    int type; /* 类型(8,16,32或64) */
    int size; /* 大小(最大元素数) */
    int nr;
    int nw;
    int flage; /* 状态标记 */
};

#endif /* __FIFO_H__ */
