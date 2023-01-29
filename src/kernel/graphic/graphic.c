#include <common.h>
#include <global.h>
#include <graphic.h>

/**
 * @brief 在屏幕上画一个矩形

 * @param Ginfo    图像缓存区的描述符,
                   指明目缓存区的水平和垂直分辨率.
    
 * @param color    要填充的颜色.

 * @param x0
 * @param y0       这两个参数组合成填充范围
                   的左上角坐标(x0,y0)

 * @param x1
 * @param y1       这两个参数组合成填充范围
                    的右下角坐标(x1,y1)

*/
void viewFill(struct GraphicsInfo* Ginfo,BltPixel color,int x0,int y0,int x1,int y1)
{
    int x;
    int y;
    if(color.Reserved != 0xff)
    {
        for(y = y0;y < y1;y++)
        {
            for(x = x0;x < x1;x++)
            {
                *((BltPixel*)(Ginfo->FrameBufferBase) + ((y * Ginfo->HorizontalResolution)) + x) = color;
            }
        }
    }
    return;
}

void init_screen(struct GraphicsInfo* Ginfo)
{
    int tsk  = 70;
    BltPixel color;
    color.Red   = 0x20;
    color.Green = 0x70;
    color.Blue  = 0x90;
    viewFill(Ginfo,color,0,0,Ginfo->HorizontalResolution,Ginfo->VerticalResolution - tsk);

    color.Red   = 0x20;
    color.Green = 0x20;
    color.Blue  = 0x20;
    viewFill(Ginfo,color,0,    Ginfo->VerticalResolution - tsk,Ginfo->HorizontalResolution,Ginfo->VerticalResolution);

    color.Red   = 0x50;
    color.Green = 0x50;
    color.Blue  = 0x50;
    viewFill(Ginfo,color,0,    Ginfo->VerticalResolution - tsk,tsk * 4,Ginfo->VerticalResolution);

    color.Red   = 0xa0;
    color.Green = 0xa0;
    color.Blue  = 0xa0;
    viewFill(Ginfo,color,10,    Ginfo->VerticalResolution - tsk + 10,tsk - 10,Ginfo->VerticalResolution - 10);

}

/**

 * @brief 显示一个字符,由vput_utf8_str调用.
 * @param vram     显存起始地址
 * @param xsize    水平方向的像素数
 * @param Pos      坐标
 * @param color    文字颜色
 * @param ch       字符编码(unicode)

*/
void vput_utf8(struct GraphicsInfo* Ginfo,struct Position* Pos,BltPixel color,uint64_t ch,int FontSize)
{
    uint16_t *font, data;
    font = (((uint16_t*)gBI.TypefaceBase) + ch * 16);
    int i;
    if(ch < 0x7f)
    {
        for(i = 0;i < 16;i++)
        {
            data = font[i];
            if((data & 0x8000) != 0){viewFill(Ginfo,color,Pos->x + 0 * FontSize,Pos->y + i * FontSize,Pos->x + 1 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x4000) != 0){viewFill(Ginfo,color,Pos->x + 1 * FontSize,Pos->y + i * FontSize,Pos->x + 2 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x2000) != 0){viewFill(Ginfo,color,Pos->x + 2 * FontSize,Pos->y + i * FontSize,Pos->x + 3 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x1000) != 0){viewFill(Ginfo,color,Pos->x + 3 * FontSize,Pos->y + i * FontSize,Pos->x + 4 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0800) != 0){viewFill(Ginfo,color,Pos->x + 4 * FontSize,Pos->y + i * FontSize,Pos->x + 5 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0400) != 0){viewFill(Ginfo,color,Pos->x + 5 * FontSize,Pos->y + i * FontSize,Pos->x + 6 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0200) != 0){viewFill(Ginfo,color,Pos->x + 6 * FontSize,Pos->y + i * FontSize,Pos->x + 7 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0100) != 0){viewFill(Ginfo,color,Pos->x + 7 * FontSize,Pos->y + i * FontSize,Pos->x + 8 * FontSize,Pos->y + (i + 1) * FontSize);}
        }
    }
    else
    {
        for(i = 0;i < 16;i++)
        {
            data = font[i];
            
            if((data & 0x8000) != 0){viewFill(Ginfo,color,Pos->x + 0 * FontSize,Pos->y + i * FontSize,Pos->x + 1 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x4000) != 0){viewFill(Ginfo,color,Pos->x + 1 * FontSize,Pos->y + i * FontSize,Pos->x + 2 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x2000) != 0){viewFill(Ginfo,color,Pos->x + 2 * FontSize,Pos->y + i * FontSize,Pos->x + 3 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x1000) != 0){viewFill(Ginfo,color,Pos->x + 3 * FontSize,Pos->y + i * FontSize,Pos->x + 4 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0800) != 0){viewFill(Ginfo,color,Pos->x + 4 * FontSize,Pos->y + i * FontSize,Pos->x + 5 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0400) != 0){viewFill(Ginfo,color,Pos->x + 5 * FontSize,Pos->y + i * FontSize,Pos->x + 6 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0200) != 0){viewFill(Ginfo,color,Pos->x + 6 * FontSize,Pos->y + i * FontSize,Pos->x + 7 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0100) != 0){viewFill(Ginfo,color,Pos->x + 7 * FontSize,Pos->y + i * FontSize,Pos->x + 8 * FontSize,Pos->y + (i + 1) * FontSize);}

            if((data & 0x0080) != 0){viewFill(Ginfo,color,Pos->x + 8 * FontSize,Pos->y + i * FontSize,Pos->x + 9 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0040) != 0){viewFill(Ginfo,color,Pos->x + 9 * FontSize,Pos->y + i * FontSize,Pos->x + 10 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0020) != 0){viewFill(Ginfo,color,Pos->x + 10 * FontSize,Pos->y + i * FontSize,Pos->x + 11 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0010) != 0){viewFill(Ginfo,color,Pos->x + 11 * FontSize,Pos->y + i * FontSize,Pos->x + 12 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0008) != 0){viewFill(Ginfo,color,Pos->x + 12 * FontSize,Pos->y + i * FontSize,Pos->x + 13 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0004) != 0){viewFill(Ginfo,color,Pos->x + 13 * FontSize,Pos->y + i * FontSize,Pos->x + 14 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0002) != 0){viewFill(Ginfo,color,Pos->x + 14 * FontSize,Pos->y + i * FontSize,Pos->x + 15 * FontSize,Pos->y + (i + 1) * FontSize);}
            if((data & 0x0001) != 0){viewFill(Ginfo,color,Pos->x + 15 * FontSize,Pos->y + i * FontSize,Pos->x + 16 * FontSize,Pos->y + (i + 1) * FontSize);}
        }
    }
}

/**

 * @brief 显示一个字符串.
 * @param Ginfo    显存的信息,
                    用于获取显存地址、长宽等信息.
 * @param Pos      文字显示的坐标.显示后指向下一个字符的位置.
 * @param color    文字颜色
 * @param str      字符串(utf-8)

*/
void vput_utf8_str(struct GraphicsInfo* Ginfo,struct Position* Pos,BltPixel color,const char* str,int FontSize)
{
    uint64_t code = 0;
    struct Position pos = *Pos;
    /* 只考虑以下情况：
    * 1. 0xxx-xxxx
    * 2. 110x-xxxx 10xx-xxxx
    * 3. 1110-xxxx 10xx-xxxx 10xx-xxxx
    * 4. 1111-0xxx 10xx-xxxx 10xx-xxxx 10xx-xxxx
    */
    while(*str)
    {
        if(pos.x + 20 * FontSize >= Ginfo->HorizontalResolution)
        {
            pos.x = Pos->x;
            pos.y += 20 * FontSize;
        }
        if((*str >> 7) == 0)
        {
            code = *str;
            str++;
            if(code == '\n')
            {
                pos.x = Pos->x;
                pos.y += 20 * FontSize;
            }
            else
            {
                vput_utf8(Ginfo,&pos,color,code,FontSize);
                pos.x += 8 * FontSize;
            }
        }
        else if(((*str >> 5) & 0x0f) == 0x6) /* 0x110 开头,2字节 */
        {
            code = (*str & 0x1f) << 6;
            str++;
            code |= (*str & 0x3f);
            str++;
            vput_utf8(Ginfo,&pos,color,code,FontSize);
            pos.x += 16 * FontSize;
        }
        else if(((*str >> 4) & 0xf) == 0xe) /* 0x1110 开头,3字节 */
        {
            code = (*str & 0x0f) << 12;
            str++;
            code |= (*str & 0x3f) << 6;
            str++;
            code |= (*str & 0x3f) << 0;
            str++;
            vput_utf8(Ginfo,&pos,color,code,FontSize);
            pos.x += 16 * FontSize;
        }
    }
    *Pos = pos;
    return;
}