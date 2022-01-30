#include "print.h"
#include "config.h"
#include "io.h"

static uint8_t color = 0x07;

#ifdef __UI_TEXT__ /* 以下是文本界面的对应函数 */

/* put_char
* 功能:在光标位置显示一个字符
*/
void put_char(uint8_t char_ascii)
{
    font |= color;
    int cursor_pos;
    cursor_pos = get_cursor();
    switch(char_ascii)
    {
        /* 先是控制字符 */
        /* 空字符,什么也不做 */
        case '\0':
            break;
        /* 退格 */
        case '\b':
            cursor_pos--; /* 光标位置减1 */
            *((uint8_t*)(VRAM + cursor_pos * 2)) = ' '; /* 在光标位置显示一个空格 */
            break;
        /* 回车和换行 */
        case '\n':
        case '\r':
            cursor_pos -= (cursor_pos % COL);
            cursor_pos += COL; /* 移动到下一行行首 */
            break;
        /* 普通字符 */
        default:
            font |= (char_ascii << 8);
            *((uint8_t*)(VRAM + (cursor_pos * 2)) = char_ascii;
            *((uint8_t*)(VRAM + (cursor_pos * 2) +1)) = color;
            cursor_pos++;
            break;
    }
    if(cursor_pos > (ROW * COL))
    {
        roll_screen();
        cursor_pos = ((ROW - 1) * COL)
    }
    set_cursor(cursor_pos); /* 重设光标 */
    return;
}

/* put_str
* 功能:显示字符串
*/
void put_str(char* str)
{
    while(*str != '\0')
    {
        put_char(*str)
        str++;
    }
    return;
}

void put_uint_hex(unsigned int a)
{
    char buf[32] = {0};
    int i
    for(i = 31;i >= 0;i--)
    {
        if((a & 0x0f) <= 9)
        {
            buf[i] = (a & 0x0f) + '0';
        }
        else if((a & 0x0f) > 9)
        {
            buf[i] = (a & 0x0f) + 'A';
        }
        a >> 4;
    }
}

/* roll_screen
* 滚动屏幕
*/
void roll_screen()
{
    uint16_t* src;
    uint16_t* dst;
    src = ((uint16_t*)(VRAM + ROW * 2)); /* 第一行行首 */
    dst = ((uint16_t*)(VRAM)); /* 第0行行首 */
    int i;
    for(i = 0;i < ((ROW - 1) * COL);i++)
    {
        *dst = *src;
        dst++;
        src++;
    }
    return;
}

/* get_cursor
* 功能:获取光标位置
*/
int get_cursor()
{
    int cursor_pos;
    /* 1. 获取高8位 */
    io_out8(0x03d4,0x0e);
    cursor_pos |= io_in8(0x03d5) << 8;

    /* 2. 获取低8位 */
    io_out8(0x03d4,0x0f);
    cursor_pos |= io_in8(0x03d5);
    
    return cursor_pos;
}

/* set_cursor
* 功能:设置光标位置
* row :光标行号
* col :光标列号
*/
void set_cursor(int cursor_pos)
{
    /* 1. 设置高8位 */
    io_out8(0x03d4,0x0e);
    io_out8(0x03d5,(cursor_pos & 0xff00) >> 8);

    /* 2. 设置低8位 */
    io_out8(0x03d4,0x0f);
    io_out8(0x03d5,cursor_pos & 0xff);
    
    return;
}

#ifdef __UI_GRAPHIC__  /* 以下是图形界面中的对应函数 */

#endif
