#include "graphic.h"
#include "global.h"
#include "stdint.h"

struct Window Screen;
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
        for(y = y0;y <= y1;y++)
        {
            for(x = x0;x <= x1;x++)
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

void init_screen(struct Window* scrn)
{
    if(DisplayMode == _GRAPHIC)
    {
        int offset = 3;
        init_Rectangle(&(scrn->win),(uint32_t*)0xfe000000,ScrnX,ScrnY,0,0);
        RectangleFill(&(scrn->win),0x00008484,0,0,ScrnX - 1,ScrnY - 1 - 50);
        /* 底部的任务栏 */
        RectangleFill(&(scrn->win),0x00c6c6c6,0,ScrnY - 1 - 50,ScrnX - 1,ScrnY - 1);
        /* 左边相当于'开始'菜单的那个按钮 */
        /* 按钮阴影 */
        RectangleFill(&(scrn->win),0x00848484,10 + offset,ScrnY - 1- 40 + offset,40 + offset,ScrnY - 1 - 10 + offset);
        /* 本体 */
        RectangleFill(&(scrn->win),0x00ffffff,10,ScrnY - 1 - 40,40,ScrnY - 1 - 10);

        /* 分隔符 */
        RectangleFill(&(scrn->win),0x00848484,50 + offset,ScrnY - 1 - 40 + offset,55 + offset,ScrnY - 1 - 10 + offset);
        RectangleFill(&(scrn->win),0x00ffffff,50,ScrnY - 1 - 40,55,ScrnY - 1 - 10);
    }
    return;
}

void put_char_graphic(struct Rectangle* rectangle,int x,int y,uint32_t color,char ch)
{
    int i;
    uint32_t* put;
    uint32_t data;
    int idx = ch;
    char* font = PKnFont[idx];
    for(i = 0;i < 16;i++)
    {
        put = (rectangle->vram) + (y + i) * (rectangle->xsize) + x;
        data = font[i];
        if((data & 0x80) != 0){put[0] = color;}
        if((data & 0x40) != 0){put[1] = color;}
        if((data & 0x20) != 0){put[2] = color;}
        if((data & 0x10) != 0){put[3] = color;}
        if((data & 0x08) != 0){put[4] = color;}
        if((data & 0x04) != 0){put[5] = color;}
        if((data & 0x02) != 0){put[6] = color;}
        if((data & 0x01) != 0){put[7] = color;}
    }
    return;
}

void put_str_graphic(struct Rectangle* rectangle,int x,int y,uint32_t color,char* str,int len)
{
    int i;
    for(i = 0;i < len;i++)
    {
        put_char_graphic(rectangle,x,y,color,str[i]);
        x+=10;
    }
    
    return;
}