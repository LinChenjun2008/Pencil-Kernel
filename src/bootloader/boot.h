#ifndef __BOOT_H__
#define __BOOT_H__

typedef CHAR16 file_name_t[256];

typedef struct
{
    int hr;
    int vr;
    int kernel_flage;
    CHAR16   KernelName[256];
    int files;
    file_name_t file_name[16];
    UINT8 flag[16];
    // CHAR16 TypefaceName[256];
    // int ttf_flage;
    // CHAR16 TTFName[256];
} BootConfig;

#endif