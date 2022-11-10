#ifndef __SIMPLE_TEXT_OUT_H__
#define __SIMPLE_TEXT_OUT_H__

typedef struct _EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL;

struct _EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL
{
    UINTN _buf;
    EFI_STATUS (*OutputString)
    (
        EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL* This,
        CHAR16* String
    );
    UINTN _buf2[4];
    EFI_STATUS (*ClearScreen)
    (
        EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL* This
    );
};

#endif