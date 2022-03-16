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
