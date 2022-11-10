#ifndef __SIMPLE_TEXT_IN_PROTOCOL_H__
#define __SIMPLE_TEXT_IN_PROTOCOL_H__

typedef struct _EFI_SIMPLE_TEXT_INPUT_PROTOCOL EFI_SIMPLE_TEXT_INPUT_PROTOCOL;

typedef struct
{
    UINT16 ScanCode;    /* 扫描码 */
    CHAR16 UnicodeChar; /* unicode 编码(如果有) */
} EFI_INPUT_KEY;

struct _EFI_SIMPLE_TEXT_INPUT_PROTOCOL
{
    UINTN _buf;
    EFI_STATUS (*ReadKeyStroke)
    (
        EFI_SIMPLE_TEXT_INPUT_PROTOCOL* This,
        EFI_INPUT_KEY* Key
    );
    EFI_EVENT WaitForKey;
};

#endif