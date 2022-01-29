#ifndef __PRINT_H__
#define __PRINT_H__

#include "config.h"

#ifdef __UI_TEXT__
    #define VRAM (0xc0000000 + 0xb8000) /* 显存地址 */
    #define ROW 25 /* 默认共25行 */
    #define COL 80 /* 默认共80列 */
#endif /* __UI_TEXT__ */

// #include "stdint.h"



// int put_string_xy(char* str,int row,int col,uint8_t fgc,uint8_t bgc);
// int put_string(char* str,uint8_t fgc,uint8_t bgc);
// int put_int(int a,int row,int col,uint8_t fgc,uint8_t bgc);
// void set_cursor(int row,int col);

#include "stdint.h"
void put_char(uint8_t char_asci);
void put_str(char* message);
void put_int(uint32_t num);	 // 以16进制打印
void set_cursor(uint32_t cursor_pos);
void cls_screen(void);

#endif /* __PRINT_H__ */
