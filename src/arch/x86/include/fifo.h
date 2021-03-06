#ifndef __FIFO_H__
#define __FIFO_H__

#include "global.h"
#include "stdint.h"
#include "sync.h"
#include "thread.h"

struct FIFO
{
    struct lock lock;
    struct task_struct* producer; /* 缓冲区的生产者 */
    struct task_struct* consumer; /* 缓冲区的消费者 */
    union
    {
        uint8_t* buf8;
        uint16_t* buf16;
        uint32_t* buf32;
        uint64_t* buf64;
    };
    int type; /* 类型(8,16,32或64) */
    int size; /* 大小(最大元素数) */
    int free;
    int nr;
    int nw;
};

void init_fifo(struct FIFO* fifo,void* buf,int type,int size);
int fifo_put(struct FIFO* fifo,void* data);

int fifo_get(struct FIFO* fifo,void* data);
bool fifo_empty(struct FIFO* fifo);
bool fifo_fill(struct FIFO* fifo);

#endif /* __FIFO_H__ */
