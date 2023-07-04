#include <Efi.h>

#include "file.h"
#include "lib.h"

extern EFI_SIMPLE_FILE_SYSTEM_PROTOCOL* Sfsp;

EFI_STATUS ReadFile(IN CHAR16* FileName,EFI_PHYSICAL_ADDRESS* FileBufferAddress,OUT UINTN* FileSize,EFI_ALLOCATE_TYPE BufferType)
{
    EFI_FILE_PROTOCOL* FileHandle;
    EFI_STATUS Status = EFI_SUCCESS;
    UINTN HandleCount = 0;
    EFI_HANDLE *HandleBuffer;

    Status = gBS->LocateHandleBuffer
    (
        ByProtocol,
        &gEfiSimpleFileSystemProtocolGuid,
        NULL,
        &HandleCount,
        &HandleBuffer
    );
    if(EFI_ERROR(Status))
    {
        gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: LocateHandleBuffer error.\n\r");
        return Status;
    }
    gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: LocateHandleBuffer success.\n\r");
    EFI_SIMPLE_FILE_SYSTEM_PROTOCOL* FileSystem;
    UINTN i;
    for(i = 0;i < HandleCount;i++)
    {
        Status = gBS->OpenProtocol
        (
            HandleBuffer[i],
            &gEfiSimpleFileSystemProtocolGuid,
            (VOID**)&FileSystem,
            gImageHandle,
            NULL,
            EFI_OPEN_PROTOCOL_GET_PROTOCOL
        );
        if(EFI_ERROR(Status))
        {
            gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: OpenProctocol error.\n\r");
            return Status;
        }
        gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: OpenProctocol success.\n\r");
        EFI_FILE_PROTOCOL* Root;
        Status = FileSystem->OpenVolume
        (
            FileSystem,
            &Root
        );
        if(EFI_ERROR(Status))
        {
            gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: OpenVolume error.\n\r");
            return Status;
        }
        gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: OpenVolume success.\n\r");
        Status = Root->Open
        (
            Root,
            &FileHandle,
            FileName,
            EFI_FILE_MODE_READ | EFI_FILE_MODE_WRITE,
            EFI_OPEN_PROTOCOL_GET_PROTOCOL
        );
        if(!EFI_ERROR(Status))
        {
            break;
        }
        else
        {
            if(i == HandleCount - 1)
            {
                gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: Open error.\n\r");
                return Status;
            }
            continue;
        }
    }
    EFI_FILE_INFO* FileInfo;
    UINTN InfoSize = sizeof(EFI_FILE_INFO) + 128;
    Status = gBS->AllocatePool
    (
        EfiLoaderData,
        InfoSize,
        (VOID**)&FileInfo
    );
    if(EFI_ERROR(Status))
    {
        gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: AllocatePool error.\n\r");
        return Status;
    }
    gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: AllocatePool success.\n\r");
    Status = FileHandle->GetInfo
    (
        FileHandle,
        &gEfiFileInfoGuid,
        &InfoSize,
        FileInfo
    );
    if(EFI_ERROR(Status))
    {
        gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: GetInfo error.\n\r");
        return Status;
    }
    gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: GetInfo success.\n\r");
    UINTN FilePageSize = (FileInfo->FileSize >> 12) + 1;
    if(FileSize != NULL)
    {
        *FileSize = FileInfo->FileSize;
    }
    (void)FileSize;
    gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: AllocatePages Start.\n\r");
    Status = gBS->AllocatePages
    (
        BufferType,
        EfiLoaderData,
        FilePageSize,
        FileBufferAddress
    );
    if(EFI_ERROR(Status))
    {
        gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: AllocatePages error.\n\r");
        return Status;
    }
    gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: AllocatePages success.\n\r");
    UINTN ReadSize = FileInfo->FileSize;
    Status = FileHandle->Read
    (
        FileHandle,
        &ReadSize,
        (VOID*)*FileBufferAddress
    );
    if(EFI_ERROR(Status))
    {
        gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: Read error.\n\r");
        return Status;
    }
    gST->ConOut->OutputString(gST->ConOut,L"\tReadFile: Read success.\n\r");
    gBS->FreePool(FileInfo);
    return Status;
}