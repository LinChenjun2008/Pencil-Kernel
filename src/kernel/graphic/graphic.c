#include <common.h>
#include <global.h>
#include <graphic.h>

#include <memory.h>
#define STB_TRUETYPE_IMPLEMENTATION
#include <stb_truetype.h>

/**
 * @brief 在屏幕上画一个矩形

 * @param graph_info    图像缓存区的描述符,
                   指明目缓存区的水平和垂直分辨率.

 * @param color    要填充的颜色.

 * @param x0
 * @param y0       这两个参数组合成填充范围
                   的左上角坐标(x0,y0)

 * @param x1
 * @param y1       这两个参数组合成填充范围
                    的右下角坐标(x1,y1)

*/
void view_fill(graph_info_t* graph_info,pixel_t color,int x0,int y0,int x1,int y1)
{
    int x;
    int y;
    if (color.reserved != 0xff)
    {
        for (y = y0;y < y1;y++)
        {
            for (x = x0;x < x1;x++)
            {
                *((pixel_t*)(graph_info->frame_buffer_base) + ((y * graph_info->horizontal_resolution)) + x) = color;
            }
        }
    }
    return;
}

PRIVATE stbtt_fontinfo ttf_info;

void init_true_typeface()
{
    int i;
    for (i = 0;i < g_boot_info.loaded_files;i++)
    {
        if (g_boot_info.loaded_file[i].flag == 2)
        {
            break;
        }
    }
    int status = stbtt_InitFont(&ttf_info, (void*)g_boot_info.loaded_file[i].base_address, 0);
    if (!status)
    {
        ASSERT(status);
    }
    return;
}

void pr_ch(graph_info_t* graph_info,position_t* pos,pixel_t col,uint64_t ch,float font_size,uint8_t* bitmap)
{
    float scale = stbtt_ScaleForPixelHeight(&ttf_info, font_size); /* scale = font_size / (ascent - descent) */
    /**
     * 获取垂直方向上的度量
     * ascent：字体从基线到顶部的高度；
     * descent：基线到底部的高度，通常为负值；
     * lineGap：两个字体之间的间距；
     * 行间距为：ascent - descent + lineGap。
    */
    int ascent = 0;
    int descent = 0;
    int lineGap = 0;
    stbtt_GetFontVMetrics(&ttf_info, &ascent, &descent, &lineGap);

    /* 根据缩放调整字高 */
    ascent = ceil(ascent * scale);
    descent = ceil(descent * scale);

    int x = 0; /*位图的x*/

        /**
          * 获取水平方向上的度量
          * advanceWidth：字宽；
          * leftSideBearing：左侧位置；
        */
        int advanceWidth = 0;
        int leftSideBearing = 0;
        stbtt_GetCodepointHMetrics(&ttf_info, ch, &advanceWidth, &leftSideBearing);

        /* 获取字符的边框（边界） */
        int c_x1, c_y1, c_x2, c_y2;
        stbtt_GetCodepointBitmapBox(&ttf_info, ch, scale, scale, &c_x1, &c_y1, &c_x2, &c_y2);

        /* 计算位图的y (不同字符的高度不同） */
        int y = ascent + c_y1;

        /* 渲染字符 */
        int byteOffset = x + ceil(leftSideBearing * scale) + (y * font_size);
        memset(bitmap,0,font_size * font_size * sizeof(uint8_t));
        stbtt_MakeCodepointBitmap(&ttf_info, bitmap + byteOffset, c_x2 - c_x1, c_y2 - c_y1, (int)font_size, scale, scale, ch);

        /* 调整x */
        x += ceil(advanceWidth * scale);

        int x0,y0;
        for (x0 = 0;x0 < font_size;x0++)
        {
            for (y0 = 0;y0 < font_size;y0++)
            {
                uint8_t bits = bitmap[x0 + y0 * (int)font_size];
                view_fill
                (
                    graph_info,
                    color(col.red & bits,col.green & bits,col.blue & bits),
                    pos->x + x0,
                    pos->y + y0,
                    pos->x + x0 + 1,
                    pos->y + y0 + 1
                );
            }
        }
}

uint64_t utf8_decode(char** _str)
{
    unsigned char* str = *((unsigned char**)_str);
    uint64_t code;
    if ((*str >> 7) == 0)
    {
        code = *str;
        str++;
    }
    else if (((*str >> 5) & 0x0f) == 0x6) /* 0x110 开头,2字节 */
    {
        code = (*str & 0x1f) << 6;
        str++;
        code |= (*str & 0x3f);
        str++;
    }
    else if (((*str >> 4) & 0xf) == 0xe) /* 0x1110 开头,3字节 */
    {
        code = (*str & 0x0f) << 12;
        str++;
        code |= (*str & 0x3f) << 6;
        str++;
        code |= (*str & 0x3f) << 0;
        str++;
    }
    *_str = (char*)str;
    return code;
}

void pr_str(graph_info_t* graph_info,position_t* vpos,pixel_t color,char* str,float _font_size)
{
    float font_size = _font_size * 2;
    float scale = stbtt_ScaleForPixelHeight(&ttf_info, font_size);
    unsigned char *bitmap = kmalloc(((int)font_size) * ((int)font_size) * sizeof(uint8_t));
    uint64_t code = 0;
    position_t pos = *vpos;

    while (*str)
    {
        code = utf8_decode(&str);
        if (code == '\n')
        {
            pos.x = vpos->x;
            pos.y += font_size;
            continue;
        }
        pr_ch(graph_info,&pos,color,code,font_size,bitmap);
        int advanceWidth = 0;
        int leftSideBearing = 0;
        stbtt_GetCodepointHMetrics(&ttf_info, code, &advanceWidth, &leftSideBearing);
        char* next = str;
        int kern = stbtt_GetCodepointKernAdvance(&ttf_info, code,utf8_decode(&next));
        pos.x += ceil(advanceWidth * scale);
        pos.x += ceil(kern * scale);
    }
    *vpos = pos;
    return;
}

void init_screen(graph_info_t* graph_info)
{
    int tsk  = 70;
    pixel_t color;
    color.red   = 0x20;
    color.green = 0x70;
    color.blue  = 0x90;
    view_fill(graph_info,color,0,0,graph_info->horizontal_resolution,graph_info->vertical_resolution - tsk);

    color.red   = 0x20;
    color.green = 0x20;
    color.blue  = 0x20;
    view_fill(graph_info,color,0,    graph_info->vertical_resolution - tsk,graph_info->horizontal_resolution,graph_info->vertical_resolution);

    color.red   = 0x50;
    color.green = 0x50;
    color.blue  = 0x50;
    view_fill(graph_info,color,0,    graph_info->vertical_resolution - tsk,tsk * 4,graph_info->vertical_resolution);

    color.red   = 0xa0;
    color.green = 0xa0;
    color.blue  = 0xa0;
    view_fill(graph_info,color,10,    graph_info->vertical_resolution - tsk + 10,tsk - 10,graph_info->vertical_resolution - 10);
init_true_typeface();
}

/**

 * @brief 显示一个字符,由vput_utf8_str调用.
 * @param vram     显存起始地址
 * @param xsize    水平方向的像素数
 * @param pos      坐标
 * @param color    文字颜色
 * @param ch       字符编码(unicode)

*/
void vput_utf8(graph_info_t* graph_info,position_t* pos,pixel_t color,uint64_t ch,int font_size)
{
    uint16_t *font, data;
    font = (((uint16_t*)g_boot_info.typeface_base) + ch * 16);
    int i;
    if (ch < 0x7f)
    {
        for (i = 0;i < 16;i++)
        {
            data = font[i];
            if ((data & 0x8000) != 0){view_fill(graph_info,color,pos->x + 0 * font_size,pos->y + i * font_size,pos->x + 1 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x4000) != 0){view_fill(graph_info,color,pos->x + 1 * font_size,pos->y + i * font_size,pos->x + 2 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x2000) != 0){view_fill(graph_info,color,pos->x + 2 * font_size,pos->y + i * font_size,pos->x + 3 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x1000) != 0){view_fill(graph_info,color,pos->x + 3 * font_size,pos->y + i * font_size,pos->x + 4 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0800) != 0){view_fill(graph_info,color,pos->x + 4 * font_size,pos->y + i * font_size,pos->x + 5 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0400) != 0){view_fill(graph_info,color,pos->x + 5 * font_size,pos->y + i * font_size,pos->x + 6 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0200) != 0){view_fill(graph_info,color,pos->x + 6 * font_size,pos->y + i * font_size,pos->x + 7 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0100) != 0){view_fill(graph_info,color,pos->x + 7 * font_size,pos->y + i * font_size,pos->x + 8 * font_size,pos->y + (i + 1) * font_size);}
        }
    }
    else
    {
        for (i = 0;i < 16;i++)
        {
            data = font[i];

            if ((data & 0x8000) != 0){view_fill(graph_info,color,pos->x + 0 * font_size,pos->y + i * font_size,pos->x + 1 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x4000) != 0){view_fill(graph_info,color,pos->x + 1 * font_size,pos->y + i * font_size,pos->x + 2 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x2000) != 0){view_fill(graph_info,color,pos->x + 2 * font_size,pos->y + i * font_size,pos->x + 3 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x1000) != 0){view_fill(graph_info,color,pos->x + 3 * font_size,pos->y + i * font_size,pos->x + 4 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0800) != 0){view_fill(graph_info,color,pos->x + 4 * font_size,pos->y + i * font_size,pos->x + 5 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0400) != 0){view_fill(graph_info,color,pos->x + 5 * font_size,pos->y + i * font_size,pos->x + 6 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0200) != 0){view_fill(graph_info,color,pos->x + 6 * font_size,pos->y + i * font_size,pos->x + 7 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0100) != 0){view_fill(graph_info,color,pos->x + 7 * font_size,pos->y + i * font_size,pos->x + 8 * font_size,pos->y + (i + 1) * font_size);}

            if ((data & 0x0080) != 0){view_fill(graph_info,color,pos->x +  8 * font_size,pos->y + i * font_size,pos->x +  9 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0040) != 0){view_fill(graph_info,color,pos->x +  9 * font_size,pos->y + i * font_size,pos->x + 10 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0020) != 0){view_fill(graph_info,color,pos->x + 10 * font_size,pos->y + i * font_size,pos->x + 11 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0010) != 0){view_fill(graph_info,color,pos->x + 11 * font_size,pos->y + i * font_size,pos->x + 12 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0008) != 0){view_fill(graph_info,color,pos->x + 12 * font_size,pos->y + i * font_size,pos->x + 13 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0004) != 0){view_fill(graph_info,color,pos->x + 13 * font_size,pos->y + i * font_size,pos->x + 14 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0002) != 0){view_fill(graph_info,color,pos->x + 14 * font_size,pos->y + i * font_size,pos->x + 15 * font_size,pos->y + (i + 1) * font_size);}
            if ((data & 0x0001) != 0){view_fill(graph_info,color,pos->x + 15 * font_size,pos->y + i * font_size,pos->x + 16 * font_size,pos->y + (i + 1) * font_size);}
        }
    }
}

/**

 * @brief 显示一个字符串.
 * @param graph_info    显存的信息,
                    用于获取显存地址、长宽等信息.
 * @param vpos      文字显示的坐标.显示后指向下一个字符的位置.
 * @param color    文字颜色
 * @param str      字符串(utf-8)

*/
void vput_utf8_str(graph_info_t* graph_info,position_t* vpos,pixel_t color,const char* str,int font_size)
{
    uint64_t code = 0;
    position_t pos = *vpos;
    /* 只考虑以下情况：
    * 1. 0xxx-xxxx
    * 2. 110x-xxxx 10xx-xxxx
    * 3. 1110-xxxx 10xx-xxxx 10xx-xxxx
    * 4. 1111-0xxx 10xx-xxxx 10xx-xxxx 10xx-xxxx
    */
    while (*str)
    {
        if (pos.x + 20 * font_size >= graph_info->horizontal_resolution)
        {
            pos.x = vpos->x;
            pos.y += 20 * font_size;
        }
        if ((*str >> 7) == 0)
        {
            code = *str;
            str++;
            if (code == '\n')
            {
                pos.x = vpos->x;
                pos.y += 20 * font_size;
            }
            else
            {
                vput_utf8(graph_info,&pos,color,code,font_size);
                pos.x += 8 * font_size;
            }
        }
        else if (((*str >> 5) & 0x0f) == 0x6) /* 0x110 开头,2字节 */
        {
            code = (*str & 0x1f) << 6;
            str++;
            code |= (*str & 0x3f);
            str++;
            vput_utf8(graph_info,&pos,color,code,font_size);
            pos.x += 16 * font_size;
        }
        else if (((*str >> 4) & 0xf) == 0xe) /* 0x1110 开头,3字节 */
        {
            code = (*str & 0x0f) << 12;
            str++;
            code |= (*str & 0x3f) << 6;
            str++;
            code |= (*str & 0x3f) << 0;
            str++;
            vput_utf8(graph_info,&pos,color,code,font_size);
            pos.x += 16 * font_size;
        }
    }
    *vpos = pos;
    return;
}