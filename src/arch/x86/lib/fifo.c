#include "fifo.h"

#include "stdint.h"


/* init_fifo
* 初始化fifo缓冲区
* fifo :指向fifo缓冲区地址
* type :fifo类型,只能是8,16,32,64之一
* size :缓冲区大小(可容纳的元素数)
*/
void init_fifo(struct FIFO* fifo,void* buf,int type,int size)
{
    fifo->type = type;
    fifo->size = size;
    fifo->free = size;
    fifo->nr = 0;
    fifo->nw = 0;
}

/* fifo_put
* 向缓冲区中存放数据
* fifo :指向fifo缓冲区
* data :要存放的数据
*/
int fifo_put(struct FIFO* fifo,void* data)
{
    if(fifo->free == 0) /* 没有空余 */
    {
        fifo->flage = 0x01;
        return -1;
    }
    fifo->free--;
    switch(fifo->type)
    {
        case 8:
            fifo->buf8[fifo->nw] = *((uint8_t*)data);
            break;
        case 16:
            fifo->buf16[fifo->nw] = *((uint16_t*)data);
            break;
        case 32:
            fifo->buf32[fifo->nw] = *((uint32_t*)data);
            break;
        case 64:
            fifo->buf64[fifo->nw] = *((uint64_t*)data);
            break;
        default:
            return -1;
    }
    fifo->nw = (fifo->nw + 1 == fifo->size ? 0 : fifo->nw + 1)
    return 0;
}
