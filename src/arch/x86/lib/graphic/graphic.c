#include "graphic.h"

#include "stdint.h"

void RectangleFill(uint32_t* vram,int xsize,uint32_t color,int x0,int y0,int x1,int y1)
{
    int x;
    int y;
    for(y = y0;y < y1;y++)
    {
        for(x = x0;x < x1;x++)
        {
            *(vram + (y * xsize + x)) = color;
        }
    }
    return;
}
