#include <common.h>
typedef uint32_t pixel_t;
void viewFill(pixel_t* vram,int xsize,pixel_t color,int x0,int y0,int x1,int y1);

uint64_t kernel_main(struct BootInfo* binfo)
{
    viewFill((pixel_t*)binfo->GraphicsInfo.FrameBufferBase,binfo->GraphicsInfo.HorizontalResolution,0x000000ff,0,0 \
    ,binfo->GraphicsInfo.HorizontalResolution-1,binfo->GraphicsInfo.VerticalResolution - 1);
    return 0;
}


void viewFill(pixel_t* vram,int xsize,pixel_t color,int x0,int y0,int x1,int y1)
{
    int x;
    int y;
    if((color & 0xff000000) != 0xff000000)
    {
        for(y = y0;y <= y1;y++)
        {
            for(x = x0;x <= x1;x++)
            {
                *((vram) + ((y * xsize)) + x) = color;
            }
        }
    }
    return;
}