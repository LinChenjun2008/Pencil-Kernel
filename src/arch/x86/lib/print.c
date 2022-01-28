#include "print.h"
#include "io.h"

static uint8_t color = 0x07;

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
    set_cursor(cursor_pos); /* 重设光标 */
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
