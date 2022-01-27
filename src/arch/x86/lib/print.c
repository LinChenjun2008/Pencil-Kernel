#include "print.h"
#include "io.h"

void put_char(uint8_t char_ascii)
{
    int cursor_pos;
    cursor_pos = get_cursor();
    switch(char_ascii)
    {
        /* 先是控制字符 */
        /* 退格 */
        case '\b':
        /* 换行 */
        case '\n':
        /* 普通字符 */
        default:
    }
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