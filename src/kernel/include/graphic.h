#ifndef __GRAPHIC_H__
#define __GRAPHIC_H__

#include <common.h>

typedef struct
{
    int x;
    int y;
} position_t;

/** @brief 字体大小 */
typedef enum
{
    FONT_NORMAL = 1,
    FONT_MEDIUM,
    FONT_LARGE,
} fontsize_t;

// typedef uint32_t pixel_t;
void view_fill(graph_info_t* graph_info,pixel_t color,int x0,int y0,int x1,int y1);
void pr_ch(graph_info_t* graph_info,position_t* pos,pixel_t color,uint64_t ch,float font_size,uint8_t* bitmap);
void pr_str(graph_info_t* graph_info,position_t* pos,pixel_t color,char* str,float font_size);
void init_screen(graph_info_t* graph_info);

// void vput_utf8(graph_info_t* graph_info,position_t* pos,pixel_t color,uint64_t ch);
/**

 * @brief 显示一个字符串.
 * @param graph_info    显存的信息,
                    用于获取显存地址、长宽等信息.
 * @param pos      文字显示的坐标.显示后指向下一个字符的位置.
 * @param color    文字颜色
 * @param str      字符串(utf-8)

*/
void vput_utf8_str(graph_info_t* graph_info,position_t* vpos,pixel_t color,const char* str,int font_size);

static inline pixel_t color(uint8_t red,uint8_t green,uint8_t blue)
{
    pixel_t col =
    {
        .red = red,
        .green = green,
        .blue = blue
    };
    return col;
}
#endif