#ifndef __PRINT_H__
#define __PRINT_H__

#include "stdint.h"

#define ROW 25 /* 共25行 */
#define COL 80 /* 共80列 */

int put_string_xy(char* str,int row,int col,uint8_t fgc,uint8_t bgc);
int put_string(char* str,uint8_t fgc,uint8_t bgc);
int put_int(int a,int row,int col,uint8_t fgc,uint8_t bgc);
void set_cursor(int row,int col);

#endif /* __PRINT_H__ */