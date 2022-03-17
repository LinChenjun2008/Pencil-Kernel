#include "fifo.h"

#include "stdint.h"

void init_fifo(struct FIFO* fifo,void* buf,int type,int size)
{
    fifo->type = type;
    fifo->size = size;
    fifo->free = size;
    fifo->nr = 0;
    fifo->nw = 0;
}

int fifo_put(struct FIFO* fifo,void* data)
{
    if(fifo->free == 0)
    {
        fifo->flage = 0x01;
        return -1
    }
    switch(fifo->type)
    {
        case 8:
            fifo->buf8[fifo->nw] = *((uint8_t*)data);
            break;
    }
    return 0;
}
