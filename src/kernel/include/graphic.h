#ifndef __GRAPHIC_H__
#define __GRAPHIC_H__

#include <common.h>

struct Position
{
    int x;
    int y;
};

/** @brief 字体大小 */
enum FontSize
{
    FontNormal = 1,
    FontMedium,
    FontLarge,
};

// typedef uint32_t pixel_t;
void viewFill(struct GraphicsInfo* Ginfo,BltPixel color,int x0,int y0,int x1,int y1);
void init_screen(struct GraphicsInfo* Ginfo);

// void vput_utf8(struct GraphicsInfo* Ginfo,struct Position* Pos,BltPixel color,uint64_t ch);
/**

 * @brief 显示一个字符串.
 * @param Ginfo    显存的信息,
                    用于获取显存地址、长宽等信息.
 * @param Pos      文字显示的坐标.显示后指向下一个字符的位置.
 * @param color    文字颜色
 * @param str      字符串(utf-8)

*/
void vput_utf8_str(struct GraphicsInfo* Ginfo,struct Position* Pos,BltPixel color,const char* str,int FontSize);

static inline BltPixel color(uint8_t red,uint8_t green,uint8_t blue)
{
    BltPixel col = 
    {
        .Red = red,
        .Green = green,
        .Blue = blue
    };
    return col;
}
#endif