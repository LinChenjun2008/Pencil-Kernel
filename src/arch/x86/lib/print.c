#include "print.h"

/* put_string
* 功能:显示str到屏幕上
* vram :显存地址
* str  :要显示的字符串
* row  :字符串起始行
* col  :字符串起始列
* fgc  :字符串文字颜色
* bgc  :字符串背景颜色
*/
int put_string(char* vram,char* str,int row,int col,uint8_t fgc,uint8_t bgc)
{
    uint16_t font;
    font = ((bgc << 4 | fgc ) << 8);
    while(*str != '\0')
    {
        *((char*)(((int)vram) + ((80 * row + col) * 2))) = (font | *str);
        str++;
        col++;
    }
    return 0;
}