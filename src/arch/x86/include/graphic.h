#ifndef __GRAPHIC_H__
#define __GRAPHIC_H__

#if (defined(__cplusplus))
    extern "C"
    {
#endif

#include "list.h"
#include "stdint.h"

#define rgb(R,G,B) ((uint32_t)(0x00000000 |( R << 16 | G << 8 | B << 0 )))
#define rgba(R,G,B,A) ((uint32_t)(0x00000000 |( A << 24 | R << 16 | G << 8 | B << 0 )))

/* Rectangle
* 长方形,矩形
*/
struct Rectangle
{
    uint32_t* vram;     /* 显示缓冲区地址 */
    uint32_t xsize;     /* x长度 */
    uint32_t ysize;     /* y长度 */
    uint32_t XPostiton; /* 左上x坐标 */
    uint32_t YPostiton; /* 左上y坐标 */
    struct list_elem tag; /* 所在的链表(矩形最终要在一个窗口中,链表用来连接所有图形) */
};

/* 窗口
*/
struct Window
{
    struct Rectangle win; /* 窗口本体 */
    struct list graphic;  /* 窗口中的图形 */
    struct Rectangle map; /* 刷新图形的用的map */
    uint32_t graphics;    /* 图形数量 */
};

extern struct Window Screen;/* 屏幕定义为矩形,不支持奇形怪状的屏幕 */

void init_Rectangle(struct Rectangle* rectangle,uint32_t* vram,int xsize,int ysize,int x,int y);
void RectangleFill(struct Rectangle* rectangle,uint32_t color,int x0,int y0,int x1,int y1);
void init_screen(struct Window* scrn);
void put_char_graphic(struct Rectangle* rectangle,int x,int y,uint32_t color,char _font);
void put_str_graphic(struct Rectangle* rectangle,int x,int y,uint32_t color,char* str);

#if (defined(__cplusplus))
    }
#endif

#endif /* __GRAPHIC_H__ */
