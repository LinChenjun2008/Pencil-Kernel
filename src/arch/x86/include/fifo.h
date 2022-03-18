#ifndef __FIFO_H__
#define __FIFO_H__

#include "global.h"
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

void init_fifo(struct FIFO* fifo,void* buf,int type,int size);
int fifo_put(struct FIFO* fifo,void* data);

int fifo_get(struct FIFO* fifo,void* data);
bool fifo_empty(struct FIFO* fifo);

#endif /* __FIFO_H__ */
