#include "graphic.h"
#include "global.h"
#include "stdint.h"

struct Rectangle Screen;
extern unsigned char PKnFont[256][16];
void RectangleFill(struct Rectangle* rectangle,uint32_t color,int x0,int y0,int x1,int y1)
{
    if(DisplayMode != _GRAPHIC)
    {
        return;
    }
    int x;
    int y;
    if((color & 0xff000000) != 0xff000000)
    {
        for(y = y0;y < y1;y++)
        {
            for(x = x0;x < x1;x++)
            {
                *((rectangle->vram) + (y * (rectangle->xsize) + x)) = color;
            }
        }
    }
    return;
}

void init_Rectangle(struct Rectangle* rectangle,uint32_t* vram,int xsize,int ysize,int x,int y)
{
    rectangle->vram = vram;
    rectangle->xsize = xsize;
    rectangle->ysize = ysize;
    rectangle->XPostiton = x;
    rectangle->YPostiton = y;
    return;
}

void init_screen(struct Rectangle* scrn)
{
    int offset = 3;
    init_Rectangle(scrn,(uint32_t*)0xfe000000,ScrnX,ScrnY,0,0);
    RectangleFill(scrn,0x00008484,0,0,ScrnX,ScrnY - 50);
    /* 底部的任务栏 */
    RectangleFill(scrn,0x00c6c6c6,0,ScrnY - 50,ScrnX,ScrnY);
    /* 左边相当于'开始'菜单的那个按钮 */
    /* 按钮阴影 */
    RectangleFill(scrn,0x00848484,10 + offset,ScrnY - 40 + offset,40 + offset,ScrnY - 10 + offset);
    /* 本体 */
    RectangleFill(scrn,0x00ffffff,10,ScrnY - 40,40,ScrnY - 10);

    /* 分隔符 */
    RectangleFill(scrn,0x00848484,50 + offset,ScrnY - 40 + offset,55 + offset,ScrnY - 10 + offset);
    RectangleFill(scrn,0x00ffffff,50,ScrnY - 40,55,ScrnY - 10);
    return;
}

void put_char_graphic(struct Rectangle* rectangle,int x,int y,uint32_t color,char _font)
{
    int i;
    uint32_t* put;
    uint32_t data;
    char* font = PKnFont[_font];
    for(i = 0;i < 16;i++)
    {
        put = (rectangle->vram) + (y + i) * (rectangle->xsize) + x;
        data = font[i];
        if((data & 0x80) != 0){put[0] = color;}
        if((data & 0x40) != 0){put[0] = color;}
        if((data & 0x20) != 0){put[0] = color;}
        if((data & 0x10) != 0){put[0] = color;}
        if((data & 0x08) != 0){put[0] = color;}
        if((data & 0x04) != 0){put[0] = color;}
        if((data & 0x02) != 0){put[0] = color;}
        if((data & 0x01) != 0){put[0] = color;}
    }
    return;
}