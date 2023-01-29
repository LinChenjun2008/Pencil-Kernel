#include <Efi.h>

CHAR16 get_char()
{
    EFI_INPUT_KEY key;
    UINTN waitidx;
    gST->BootServices->WaitForEvent(1, &(gST->ConIn->WaitForKey), &waitidx);
    while(gST->ConIn->ReadKeyStroke(gST->ConIn, &key));

    return (key.UnicodeChar) ? key.UnicodeChar : (key.ScanCode + 0x1680);
}

UINTN get_line(CHAR16* str,UINTN limit)
{
    UINTN i = 0;
    str[i] = L'\0';
    CHAR16 c[2];
    while(1)
    {
        str[i] = get_char();
        if(str[i] == L'\b')
        {
            if(i > 0)
            {
                str[--i] = L'\0';
                gST->ConOut->OutputString(gST->ConOut,L"\b");
            }
            continue;
        }
        if(str[i] == L'\r')
        {
            str[i] = L'\0';
            gST->ConOut->OutputString(gST->ConOut,L"\n\r");
            return i - 1;
        }
        if(i >= limit - 1)
        {
            str[i + 1] = L'\0';
            gST->ConOut->OutputString(gST->ConOut,L"\n\r");
            return i;
        }
        c[0] = str[i];
        c[1] = L'\0';
        /* 把输入显示出来 */
        gST->ConOut->OutputString(gST->ConOut, c);
        i++;
    }
    gST->ConOut->OutputString(gST->ConOut,L"\n\r");
    return 0;
}

UINTN strncmp(CHAR16* s1,CHAR16* s2,UINTN i)
{
    if(i == 0)
    {
        return 0;
    }
    while(--i && *s1 != L'\0' && *s1 == *s2)
    {
        s1++;
        s2++;
    };
    return (*s1 < *s2) ? -1 : (*s1 > *s2);
}

void utoa(UINTN a,CHAR16* str,UINTN base)
{
    static CHAR16 digits[37] = L"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int i; /* 作为下标来索引 */
    i = 0;
    /* 转换为字符串,不过是倒过来的 */
    do
    {
        str[i] = digits[a % base];
        i++;
        a = a / base;
    }while(a > 0);
    str[i] = L'\0'; /* 加上字符串结尾 */
    CHAR16* p = str;
    CHAR16* q = str;
    CHAR16 tmp;
    while(*q != L'\0')
    {
        q++;
    } 
    q--;
    /* 把字符串倒过来 */
    while(q > p)
    {
        tmp = *p;
        *p = *q;
        p++;
        *q = tmp;
        q--;
    }
    return;
}

/** memset

    @brief 将dst__开始的size字节置为value

    @param dst__ :要设置的地址
    @param value :设置成的值
    @param size  :要设置的大小(字节)
**/
void memset(void* dst__,UINTN value,UINTN size)
{
    UINT8* dst = (UINT8*)dst__;
    UINTN i;
    for(i = 0;i < size;i++)
    {
        (*dst) = value;
        dst++;
    }
    return;
}