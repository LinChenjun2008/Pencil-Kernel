#include <Uefi.h>
#include <Efi.h>

#include "boot.h"
#include "lib.h"

CHAR16* skip_space(CHAR16* s)
{
    while(*s == L' ' || *s == L'\n' || *s == L'\r')
    {
        s++;
    }
    return s;
}

// void ReadConfig(EFI_PHYSICAL_ADDRESS FileBase,BootConfig* Config)
// {
//     gST->ConOut->OutputString(gST->ConOut,L"Reading Config...\n\r");
//     CHAR16* s = (CHAR16*)FileBase;
//     while(*s)
//     {
//         if(*s == L'.')
//         {
//             s++;

//             if(*s == L'x' || *s == L'X')
//             {
//                 s += 2;
//                 Config->hr = 0;
//                 while(*s <= L'9' && *s >= L'0')
//                 {
//                     Config->hr = Config->hr * 10 + *(s++) - L'0';
//                 }
//             }
//             else if(*s == L'y' || *s == L'Y')
//             {
//                 s += 2;
//                 Config->vr = 0;
//                 while(*s <= L'9' && *s >= L'0')
//                 {
//                     Config->vr = Config->vr * 10 + *(s++) - L'0';
//                 }
//             }
//             else if(strncmp(s,L"kernel",6) == 0)
//             {
//                 s += 6;
//                 s = skip_space(s);
//                 if(*s == L'=')
//                 {
//                     s++;
//                 }
//                 s = skip_space(s);
//                 if(*s != L'\"')
//                 {
//                     continue;
//                 }
//                 s++;
//                 int i = 0;
//                 while((Config->KernelName[i++] = *s++) != L'\"');
//                 Config->KernelName[i - 1] = L'\0';
//                 Config->kernel_flage = 1;
//             }
//             else if(strncmp(s,L"typeface",8) == 0)
//             {
//                 s += 8;
//                 s = skip_space(s);
//                 if(*s == L'=')
//                 {
//                     s++;
//                 }
//                 s = skip_space(s);
//                 if(*s != L'\"')
//                 {
//                     continue;
//                 }
//                 s++;
//                 int i = 0;
//                 while((Config->TypefaceName[i++] = *s++) != L'\"');
//                 Config->TypefaceName[i - 1] = L'\0';
//                 Config->typeface_flage = 1;
//             }
//             else if(strncmp(s,L"TrueTypeFont",12) == 0)
//             {
//                 s += 12;
//                 s = skip_space(s);
//                 if(*s == L'=')
//                 {
//                     s++;
//                 }
//                 s = skip_space(s);
//                 if(*s != L'\"')
//                 {
//                     continue;
//                 }
//                 s++;
//                 int i = 0;
//                 while((Config->TTFName[i++] = *s++) != L'\"');
//                 Config->TTFName[i - 1] = L'\0';
//                 Config->ttf_flage = 1;
//             }
//             else
//             {
//                 gST->ConOut->OutputString(gST->ConOut,L"Unknow Config: ");
//                 while(1);
//             }
//         }
//         s++;
//     }
// }


void ReadBootConfig(EFI_PHYSICAL_ADDRESS FileBase,BootConfig* Config)
{
    gST->ConOut->OutputString(gST->ConOut,L"Reading Config...\n\r");
    CHAR16* s = (CHAR16*)FileBase;
    while(*s)
    {
        if(*s == L'.')
        {
            s++;
            if(*s == L'x' || *s == L'X')
            {
                s += 2;
                Config->hr = 0;
                while(*s <= L'9' && *s >= L'0')
                {
                    Config->hr = Config->hr * 10 + *(s++) - L'0';
                }
            }
            else if(*s == L'y' || *s == L'Y')
            {
                s += 2;
                Config->vr = 0;
                while(*s <= L'9' && *s >= L'0')
                {
                    Config->vr = Config->vr * 10 + *(s++) - L'0';
                }
            }
            else if(strncmp(s,L"kernel",6) == 0)
            {
                gST->ConOut->OutputString(gST->ConOut,L"read kernel config...\n\r");
                s += 6;
                s = skip_space(s);
                if(*s == L'=')
                {
                    s++;
                }
                s = skip_space(s);
                if(*s != L'\"')
                {
                    continue;
                }
                s++;
                int i = 0;
                while((Config->KernelName[i++] = *s++) != L'\"');
                Config->KernelName[i - 1] = L'\0';
                Config->kernel_flage = 1;
            }
            else if (strncmp(s,L"load_file",9) == 0)
            {
                s += 9;
                s = skip_space(s);
                if (strncmp(s,L"name",4) != 0)
                {
                    continue;
                }
                s+= 4;
                // 文件名
                s = skip_space(s);
                if(*s != L'=') { continue; }
                s++;
                s = skip_space(s);
                if(*s != L'\"')
                {
                    continue;
                }
                s++;
                int i = 0;
                while(((Config->file_name[Config->files])[i++] = *s++) != L'\"');
                (Config->file_name[Config->files])[i - 1] = L'\0';

                s = skip_space(s);
                if (*s != L','){ continue; }
                s++;
                if (strncmp(s,L"flag",4) != 0){ continue;}
                s +=4;
                s = skip_space(s);
                if(*s != L'=') { continue;}
                s++;
                s = skip_space(s);
                Config->flag[Config->files] = 0;
                while(*s >= L'0' && *s <= L'9')
                {
                    Config->flag[Config->files] *= 10;
                    Config->flag[Config->files] += (*s++ - L'0');
                }
                Config->files++;
            }
            else
            {
                gST->ConOut->OutputString(gST->ConOut,L"Unknow Config: ");
                while(1);
            }
        }
        s++;
    }
    gST->ConOut->OutputString(gST->ConOut,L"Reading Config done\n\r");
}