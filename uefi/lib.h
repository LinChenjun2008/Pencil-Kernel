#ifndef __LIB_H__
#define __LIB_H__

#include <Efi.h>

CHAR16 get_char();
UINTN get_line(CHAR16* str,UINTN limit);
UINTN strcmp(CHAR16* s1,CHAR16* s2);
void utoa(UINTN a,CHAR16* str,UINTN base);

#endif