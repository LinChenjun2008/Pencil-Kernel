#ifndef __PRINT_H__
#define __PRINT_H__

#include "stdint.h"

int put_string(char* vram,char* str,int row,int col,uint8_t fgc,uint8_t bgc);

#endif /* __PRINT_H__ */