#ifndef __GRAPHIC_H__
#define __GRAPHIC_H__

#define rgb(R,G,B) ((uint32_t)(0x00000000 |( R << 16 | G << 8 | B << 0 )))
#define rgba(R,G,B,A) ((uint32_t)(0x00000000 |( A << 24 | R << 16 | G << 8 | B << 0 )))

struct Rectangle
{
    uint32_t* vram;     /* 显示缓冲区地址 */
    uint32_t xsize;     /* x长度 */
    uint32_t ysize;     /* y长度 */
    uint32_t XPostiton; /* 左上x坐标 */
    uint32_t YPostiton; /* 左上y坐标 */
};

extern Rectangle Screen;

#endif /* __GRAPHIC_H__ */
