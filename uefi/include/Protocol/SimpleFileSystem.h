#ifndef __SIMPLE_FILE_SYSTEM_H__
#define __SIMPLE_FILE_SYSTEM_H__

#define EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID \
{ \
    0x964e5b22, 0x6459, 0x11d2, \
    {0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b } \
}

#define EFI_FILE_MODE_READ      0x0000000000000001
#define EFI_FILE_MODE_WRITE     0x0000000000000002
#define EFI_FILE_MODE_CREATE    0x8000000000000000

extern EFI_GUID  gEfiSimpleFileSystemProtocolGuid;

typedef struct _EFI_FILE_PROTOCOL EFI_FILE_PROTOCOL;
typedef struct _EFI_SIMPLE_FILE_SYSTEM_PROTOCOL EFI_SIMPLE_FILE_SYSTEM_PROTOCOL;


struct _EFI_FILE_PROTOCOL
{
    UINT64 _buf;
    EFI_STATUS (*Open)
    (
        EFI_FILE_PROTOCOL*  This,
        EFI_FILE_PROTOCOL** NewHandle, /* 被打开的文件handle */
        CHAR16*             FileName,  /* 文件名 */
        UINTN               OpenMode,  /* 打开文件的模式,支持:
                                        * READ(只读),
                                        * READ | WRITE(读写),
                                        * READ | WRITE | CREAT(读写,不存在则创建) 三种
                                        */
        UINTN               Attributes /* 文件属性(新建文件时) */
    );
    EFI_STATUS (*Close)
    (
        EFI_FILE_PROTOCOL* This
    );
    UINTN _buf2; // Delet
    EFI_STATUS (*Read)
    (
        EFI_FILE_PROTOCOL* This,
        UINTN*             BufferSize,
        VOID*              Buffer
    );
    EFI_STATUS (*Write)
    (
        EFI_FILE_PROTOCOL* This,
        UINTN*             BufferSize,
        VOID*              Buffer
    );
    UINTN _buf3[4]; //GetPosition SetPosition GetInfo SetInfo
    EFI_STATUS (*Flush)
    (
        EFI_FILE_PROTOCOL* This
    );
    UINTN _buf4[4]; //OpenEx ReadEx WriteEx FlushEx
};

struct _EFI_SIMPLE_FILE_SYSTEM_PROTOCOL
{
    UINTN Revision;
    EFI_STATUS (*OpenVolume)
    (
        EFI_SIMPLE_FILE_SYSTEM_PROTOCOL* This,
        EFI_FILE_PROTOCOL**              Root
    );
};

#endif