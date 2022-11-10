#ifndef __FILE_H__
#define __FILE_H__

struct File
{
    CHAR16 Name[16];
};

struct EFI_FILE_INFO {
    unsigned char _buf[80];
    unsigned short FileName[];
};

EFI_STATUS Open_Kernel_sys();

#endif