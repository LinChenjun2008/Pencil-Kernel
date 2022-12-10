// #include <Uefi.h>
// #include <Library/UefiBootServicesTableLib.h>

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




// /**

//     @brief 显示一个字符,由vput_utf8_str调用.
//     @param vram     显存起始地址
//     @param xsize    水平方向的像素数
//     @param Pos      坐标
//     @param color    文字颜色
//     @param ch       字符编码(unicode)

// **/
// void vput_utf8(BltPixel* vram,int xsize,struct Position* Pos,BltPixel color,uint64_t ch)
// {
//     uint16_t *font, data;
//     font = (((uint16_t*)gBI.TypefaceBase) + ch * 16);
//     BltPixel* put;
//     int i;
//     if(ch < 0x7f)
//     {
//         for(i = 0;i < 16;i++)
//         {
//             put = (vram) + ((Pos->y + i) * (xsize) + Pos->x);
//             data = font[i];
//             if((data & 0x8000) != 0){put[0] = color;}
//             if((data & 0x4000) != 0){put[1] = color;}
//             if((data & 0x2000) != 0){put[2] = color;}
//             if((data & 0x1000) != 0){put[3] = color;}
//             if((data & 0x0800) != 0){put[4] = color;}
//             if((data & 0x0400) != 0){put[5] = color;}
//             if((data & 0x0200) != 0){put[6] = color;}
//             if((data & 0x0100) != 0){put[7] = color;}
//         }
//     }
//     else
//     {
//         for(i = 0;i < 16;i++)
//         {
//             put = (vram) + ((Pos->y + i) * (xsize) + Pos->x);
//             data = font[i];
//             if((data & 0x8000) != 0){put[0] = color;}
//             if((data & 0x4000) != 0){put[1] = color;}
//             if((data & 0x2000) != 0){put[2] = color;}
//             if((data & 0x1000) != 0){put[3] = color;}
//             if((data & 0x0800) != 0){put[4] = color;}
//             if((data & 0x0400) != 0){put[5] = color;}
//             if((data & 0x0200) != 0){put[6] = color;}
//             if((data & 0x0100) != 0){put[7] = color;}

//             if((data & 0x0080) != 0){put[8] = color;}
//             if((data & 0x0040) != 0){put[9] = color;}
//             if((data & 0x0020) != 0){put[10] = color;}
//             if((data & 0x0010) != 0){put[11] = color;}
//             if((data & 0x0008) != 0){put[12] = color;}
//             if((data & 0x0004) != 0){put[13] = color;}
//             if((data & 0x0002) != 0){put[14] = color;}
//             if((data & 0x0001) != 0){put[15] = color;}
//         }
//     }
// }

// /**

//     @brief 显示一个字符串.
//     @param Ginfo    显存的信息,
//                     用于获取显存地址、长宽等信息.
//     @param Pos      用于显示文字的坐标.
//                     显示完成后,是下一个字符的位置.
//     @param color    文字颜色
//     @param str      字符串(utf-8)

// **/
// void vput_utf8_str(const struct GraphicsInfo* const Ginfo,struct Position* Pos,BltPixel color,const char* str)
// {
//     uint64_t code = 0;
//     struct Position pos = *Pos;
//     /* 只考虑以下情况：
//     * 1. 0xxx-xxxx
//     * 2. 110x-xxxx 10xx-xxxx
//     * 3. 1110-xxxx 10xx-xxxx 10xx-xxxx
//     * 4. 1111-0xxx 10xx-xxxx 10xx-xxxx 10xx-xxxx
//     */
//     while(*str)
//     {
//         if((*str >> 7) == 0)
//         {
//             code = *str;
//             str++;
//             if(code == '\n')
//             {
//                 pos.x = Pos->x;
//                 pos.y += 20;
//             }
//             else
//             {
//                 vput_utf8((void*)Ginfo->FrameBufferBase,Ginfo->HorizontalResolution,&pos,color,code);
//                 pos.x += 8;
//             }
//         }
//         else if(((*str >> 5) & 0x0f) == 0x6) /* 0x110 开头,2字节 */
//         {
//             code = (*str & 0x1f) << 6;
//             str++;
//             code |= (*str & 0x3f);
//             str++;
//             vput_utf8((void*)Ginfo->FrameBufferBase,Ginfo->HorizontalResolution,&pos,color,code);
//             pos.x += 16;
//         }
//         else if(((*str >> 4) & 0xf) == 0xe) /* 0x1110 开头,3字节 */
//         {
//             code = (*str & 0x0f) << 12;
//             str++;
//             code |= (*str & 0x3f) << 6;
//             str++;
//             code |= (*str & 0x3f) << 0;
//             str++;
//             vput_utf8((void*)Ginfo->FrameBufferBase,Ginfo->HorizontalResolution,&pos,color,code);
//             pos.x += 16;
//         }
//     }
//     *Pos = pos;
//     return;
// }

// int32_t strcmp(const CHAR16* str1__,const CHAR16* str2__)
// {
//     while(*str1__ != 0 && *str1__ == *str2__)
//     {
//         str1__++;
//         str2__++;
//     }
//     return (*str1__ < *str2__ ? -1 : *str1__ > *str2__);
// }