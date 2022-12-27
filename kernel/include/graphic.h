#ifndef __GRAPHIC_H__
#define __GRAPHIC_H__

#include <common.h>

struct Position
{
    int x;
    int y;
};

// typedef uint32_t pixel_t;
void viewFill(struct GraphicsInfo* Ginfo,BltPixel color,int x0,int y0,int x1,int y1);
void init_screen(struct GraphicsInfo* Ginfo);

void vput_utf8(BltPixel* vram,int xsize,struct Position* Pos,BltPixel color,uint64_t ch);
void vput_utf8_str(const struct GraphicsInfo* const Ginfo,struct Position* Pos,BltPixel color,const char* str);

#endif