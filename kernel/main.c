#include <common.h>
typedef uint32_t pixel_t;
void viewFill(struct GraphicsInfo* Ginfo,BltPixel color,int x0,int y0,int x1,int y1);
void init_screen(struct GraphicsInfo* Ginfo);
uint64_t kernel_main(struct BootInfo* binfo)
{
    BltPixel c = {0,0,0,0};
    c.Red = 255;
    c.Green = 255;
    viewFill(&(binfo->GraphicsInfo),c,0,0 \
    ,binfo->GraphicsInfo.HorizontalResolution-1,binfo->GraphicsInfo.VerticalResolution - 1);
    init_screen(&(binfo->GraphicsInfo));
    return 0;
}


void viewFill(struct GraphicsInfo* Ginfo,BltPixel color,int x0,int y0,int x1,int y1)
{
    int x;
    int y;
    if(color.Reserved != 0xff)
    {
        for(y = y0;y <= y1;y++)
        {
            for(x = x0;x <= x1;x++)
            {
                *((BltPixel*)(Ginfo->FrameBufferBase) + ((y * Ginfo->HorizontalResolution)) + x) = color;
            }
        }
    }
    return;
}

void init_screen(struct GraphicsInfo* Ginfo)
{
    int tsk  = (Ginfo->HorizontalResolution - 1) / 30;
    int step = (Ginfo->VerticalResolution - 1 - tsk) / ((1 + 1 + 2) * 16 * 4);
    int t    = (Ginfo->VerticalResolution - 1 - tsk) % ((1 + 1 + 2) * 16 * 4);
    int a;
    int y = 0;
    BltPixel color;
    color.Red   = 0x75;
    color.Green = 0xaa;
    color.Blue  = 0xff;
    int i;
    for(a = 0;a < 16 * 4 + t;a++)
    {
        if(y + step > Ginfo->VerticalResolution) { break;}
        viewFill(Ginfo,color,0,y,Ginfo->HorizontalResolution - 1,y + step);
        y += step;
        if(y + step > Ginfo->VerticalResolution) { break;}
        color.Red++;
        viewFill(Ginfo,color,0,y,Ginfo->HorizontalResolution - 1,y + step);
        y += step;
        if(y + step > Ginfo->VerticalResolution) { break;}
        color.Green++;
        for(i = 0;i < 2;i++)
        {
            viewFill(Ginfo,color,0,y,Ginfo->HorizontalResolution - 1,y + step);
            y += step;
            if(y + step > Ginfo->VerticalResolution) { break;}
            color.Blue--;
        }
    }
    color.Red = 255;
    color.Green = 255;
    color.Blue = 255;
    viewFill(Ginfo,color,0,    Ginfo->VerticalResolution - tsk - 1,(Ginfo->HorizontalResolution - 1),Ginfo->VerticalResolution - 1);
}