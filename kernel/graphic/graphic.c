#include <common.h>
#include <global.h>
#include <graphic.h>

/**
    @brief 在屏幕上画一个矩形

    @param Ginfo    图像缓存区的描述符,
                    指明目缓存区的水平和垂直分辨率.
    
    @param color    要填充的颜色.

    @param x0
    @param y0       这两个参数组合成填充范围
                    的左上角坐标(x0,y0)

    @param x1
    @param y1       这两个参数组合成填充范围
                    的右下角坐标(x1,y1)

**/
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
    // int step = (Ginfo->VerticalResolution - 1) / ((1 + 1 + 2) * 16 * 4);
    // int t    = (Ginfo->VerticalResolution - 1) % ((1 + 1 + 2) * 16 * 4);
    // int a;
    // int y = 0;
    BltPixel color;
    // color.Red   = 0x75;
    // color.Green = 0xaa;
    // color.Blue  = 0xff;
    color.Red   = 0x20;
    color.Green = 0x70;
    color.Blue  = 0x90;
    viewFill(Ginfo,color,0,0,Ginfo->HorizontalResolution - 1,Ginfo->VerticalResolution - tsk - 1);
    // int i;
    // for(a = 0;a < 16 * 4 + t;a++)
    // {
    //     if(y + step > Ginfo->VerticalResolution) { break;}
    //     viewFill(Ginfo,color,0,y,Ginfo->HorizontalResolution - 1,y + step);
    //     y += step;
    //     if(y + step > Ginfo->VerticalResolution) { break;}
    //     color.Red++;
    //     viewFill(Ginfo,color,0,y,Ginfo->HorizontalResolution - 1,y + step);
    //     y += step;
    //     if(y + step > Ginfo->VerticalResolution) { break;}
    //     color.Green++;
    //     for(i = 0;i < 2;i++)
    //     {
    //         viewFill(Ginfo,color,0,y,Ginfo->HorizontalResolution - 1,y + step);
    //         y += step;
    //         if(y + step > Ginfo->VerticalResolution) { break;}
    //         color.Blue--;
    //     }
    // }
    // for(a = y;a < tsk;a++)
    // {
    //     viewFill(Ginfo,color,0,y,Ginfo->HorizontalResolution - 1,y + step);
    //     y++;
    // }
    color.Red   = 255;
    color.Green = 255;
    color.Blue  = 255;
    viewFill(Ginfo,color,0,    Ginfo->VerticalResolution - tsk - 1,(Ginfo->HorizontalResolution - 1),Ginfo->VerticalResolution - 1);
}

/**

    @brief 显示一个字符,由vput_utf8_str调用.
    @param vram     显存起始地址
    @param xsize    水平方向的像素数
    @param Pos      坐标
    @param color    文字颜色
    @param ch       字符编码(unicode)

**/
void vput_utf8(BltPixel* vram,int xsize,struct Position* Pos,BltPixel color,uint64_t ch)
{
    uint16_t *font, data;
    font = (((uint16_t*)gBI.TypefaceBase) + ch * 16);
    BltPixel* put;
    int i;
    if(ch < 0x7f)
    {
        for(i = 0;i < 16;i++)
        {
            put = (vram) + ((Pos->y + i) * (xsize) + Pos->x);
            data = font[i];
            if((data & 0x8000) != 0){put[0] = color;}
            if((data & 0x4000) != 0){put[1] = color;}
            if((data & 0x2000) != 0){put[2] = color;}
            if((data & 0x1000) != 0){put[3] = color;}
            if((data & 0x0800) != 0){put[4] = color;}
            if((data & 0x0400) != 0){put[5] = color;}
            if((data & 0x0200) != 0){put[6] = color;}
            if((data & 0x0100) != 0){put[7] = color;}
        }
    }
    else
    {
        for(i = 0;i < 16;i++)
        {
            put = (vram) + ((Pos->y + i) * (xsize) + Pos->x);
            data = font[i];
            if((data & 0x8000) != 0){put[0] = color;}
            if((data & 0x4000) != 0){put[1] = color;}
            if((data & 0x2000) != 0){put[2] = color;}
            if((data & 0x1000) != 0){put[3] = color;}
            if((data & 0x0800) != 0){put[4] = color;}
            if((data & 0x0400) != 0){put[5] = color;}
            if((data & 0x0200) != 0){put[6] = color;}
            if((data & 0x0100) != 0){put[7] = color;}

            if((data & 0x0080) != 0){put[8] = color;}
            if((data & 0x0040) != 0){put[9] = color;}
            if((data & 0x0020) != 0){put[10] = color;}
            if((data & 0x0010) != 0){put[11] = color;}
            if((data & 0x0008) != 0){put[12] = color;}
            if((data & 0x0004) != 0){put[13] = color;}
            if((data & 0x0002) != 0){put[14] = color;}
            if((data & 0x0001) != 0){put[15] = color;}
        }
    }
}

/**

    @brief 显示一个字符串.
    @param Ginfo    显存的信息,
                    用于获取显存地址、长宽等信息.
    @param Pos      用于显示文字的坐标.
                    显示完成后,是下一个字符的位置.
    @param color    文字颜色
    @param str      字符串(utf-8)

**/
void vput_utf8_str(const struct GraphicsInfo* const Ginfo,struct Position* Pos,BltPixel color,const char* str)
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
        if((*str >> 7) == 0)
        {
            code = *str;
            str++;
            if(code == '\n')
            {
                pos.x = Pos->x;
                pos.y += 20;
            }
            else
            {
                vput_utf8((void*)Ginfo->FrameBufferBase,Ginfo->HorizontalResolution,&pos,color,code);
                pos.x += 8;
            }
        }
        else if(((*str >> 5) & 0x0f) == 0x6) /* 0x110 开头,2字节 */
        {
            code = (*str & 0x1f) << 6;
            str++;
            code |= (*str & 0x3f);
            str++;
            vput_utf8((void*)Ginfo->FrameBufferBase,Ginfo->HorizontalResolution,&pos,color,code);
            pos.x += 16;
        }
        else if(((*str >> 4) & 0xf) == 0xe) /* 0x1110 开头,3字节 */
        {
            code = (*str & 0x0f) << 12;
            str++;
            code |= (*str & 0x3f) << 6;
            str++;
            code |= (*str & 0x3f) << 0;
            str++;
            vput_utf8((void*)Ginfo->FrameBufferBase,Ginfo->HorizontalResolution,&pos,color,code);
            pos.x += 16;
        }
    }
    *Pos = pos;
    return;
}