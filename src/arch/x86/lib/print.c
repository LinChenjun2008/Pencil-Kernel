#include "print.h"
#include "io.h"

char* vram = 0xc0000000 + 0xb8000;/* 文本模式的显存地址 */

/* put_string_xy
* 功能:显示str到屏幕上
* str  :要显示的字符串
* row  :字符串起始行
* col  :字符串起始列
* fgc  :字符串文字颜色
* bgc  :字符串背景颜色
*/
int put_string_xy(char* str,int row,int col,uint8_t fgc,uint8_t bgc)
{
    uint16_t font;
    font = ((bgc << 4 | fgc ) << 8);
    while(*str != '\0')
    {
        *((char*)(((int)vram) + ((80 * row + col) * 2))) = (font | *str);
        str++;
        col++;
        if(col >= COL)
        {
            col = 0;
            row++;
        }
        if(row >= ROW)
        {
            row = 0;
        }

    }
    set_cursor(row,col);
    return 0;
}

int put_string(char* )

/* set_cursor
* 功能:设置光标位置
* row :光标行号
* col :光标列号
*/
void set_cursor(int row,int col)
{
    uint16_t coordinate = (80 * row + col);

    /* 1. 设置高8位 */
    io_out8(0x03d4,0x0e);
    io_out8(0x03d5,(coordinate & 0xff00) >> 8);

    /* 2. 设置低8位 */
    io_out8(0x03d4,0x0f);
    io_out8(0x03d5,coordinate & 0xff);
    
    return;
}