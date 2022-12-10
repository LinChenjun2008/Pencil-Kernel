#ifndef __LIB_H__
#define __LIB_H__

#include <Efi.h>

CHAR16 get_char();
UINTN get_line(CHAR16* str,UINTN limit);
UINTN strncmp(CHAR16* s1,CHAR16* s2,UINTN i);
// void utoa(UINTN a,CHAR16* str,UINTN base);
// void vput_utf8_str(const struct GraphicsInfo* const Ginfo,struct Position* Pos,BltPixel color,const char* str);
// int32_t strcmp(const CHAR16* str1__,const CHAR16* str2__);

#endif