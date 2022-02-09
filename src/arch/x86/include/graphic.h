#ifndef __GRAPHIC_H__
#define __GRAPHIC_H__

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
};

extern struct Rectangle Screen;/* 屏幕定义为矩形,不支持奇形怪状的屏幕 */

void init_Rectangle(struct Rectangle* rectangle,uint32_t* vram,int xsize,int ysize,int x,int y);
void RectangleFill(struct Rectangle* rectangle,uint32_t color,int x0,int y0,int x1,int y1);

#endif /* __GRAPHIC_H__ */
