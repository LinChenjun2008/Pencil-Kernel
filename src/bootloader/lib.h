#ifndef __LIB_H__
#define __LIB_H__

#include <Efi.h>

CHAR16 get_char();
UINTN get_line(CHAR16* str,UINTN limit);
UINTN strncmp(CHAR16* s1,CHAR16* s2,UINTN i);

/** memset

    @brief 将dst__开始的size字节置为value

    @param dst__ :要设置的地址
    @param value :设置成的值
    @param size  :要设置的大小(字节)
**/
void memset(void* dst__,UINTN value,UINTN size);
// void utoa(UINTN a,CHAR16* str,UINTN base);
// void vput_utf8_str(const struct GraphicsInfo* const Ginfo,struct Position* Pos,BltPixel color,const char* str);
// int32_t strcmp(const CHAR16* str1__,const CHAR16* str2__);

#endif