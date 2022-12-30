// #include <Uefi.h>
// #include <Library/UefiBootServicesTableLib.h>
// #include <Protocol/SimpleFileSystem.h>
// #include <Guid/FileInfo.h>

#include <Efi.h>

#include "file.h"
#include "lib.h"

extern EFI_SIMPLE_FILE_SYSTEM_PROTOCOL* Sfsp;

EFI_STATUS ReadFile(IN CHAR16* FileName,EFI_PHYSICAL_ADDRESS* FileBufferAddress,EFI_ALLOCATE_TYPE BufferType)
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
        //gST->ConOut->OutputString(gST->ConOut,L"ReadFile: LocateHandleBuffer error.\n\r");
        return Status;
    }

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
            //gST->ConOut->OutputString(gST->ConOut,L"ReadFile: OpenProctocol error.\n\r");
            return Status;
        }

        EFI_FILE_PROTOCOL* Root;
        Status = FileSystem->OpenVolume
        (
            FileSystem,
            &Root
        );
        if(EFI_ERROR(Status))
        {
            //gST->ConOut->OutputString(gST->ConOut,L"ReadFile: OpenVolume error.\n\r");
            return Status;
        }
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
                //gST->ConOut->OutputString(gST->ConOut,L"ReadFile: Open error.\n\r");
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
        //gST->ConOut->OutputString(gST->ConOut,L"ReadFile: AllocatePool error.\n\r");
        return Status;
    }
    Status = FileHandle->GetInfo
    (
        FileHandle,
        &gEfiFileInfoGuid,
        &InfoSize,
        FileInfo
    );
    if(EFI_ERROR(Status))
    {
        //gST->ConOut->OutputString(gST->ConOut,L"ReadFile: GetInfo error.\n\r");
        return Status;
    }
    UINTN FilePageSize = (FileInfo->FileSize >> 12) + 1;
    
    Status = gBS->AllocatePages
    (
        BufferType,
        EfiLoaderData,
        FilePageSize,
        FileBufferAddress
    );
    if(EFI_ERROR(Status))
    {
        //gST->ConOut->OutputString(gST->ConOut,L"ReadFile: AllocatePages error.\n\r");
        //return Status;
    }
    UINTN ReadSize = FileInfo->FileSize;
    Status = FileHandle->Read
    (
        FileHandle,
        &ReadSize,
        (VOID*)*FileBufferAddress
    );
    if(EFI_ERROR(Status))
    {
        //gST->ConOut->OutputString(gST->ConOut,L"ReadFile: Read error.\n\r");
        return Status;
    }
    gBS->FreePool(FileInfo);
    // gST->ConOut->OutputString(gST->ConOut,L"ReadFile: read success!\n\r");
    return Status;
}

// EFI_STATUS Open_Kernel_sys()
// {
//     UINT8 FileBuf[1024];
//     UINTN BufferSize = 1024;
//     struct EFI_FILE_INFO* FileInfo;
//     EFI_FILE_PROTOCOL* Root;
//     EFI_FILE_PROTOCOL* KernelDir;
//     Sfsp->OpenVolume(Sfsp,&Root);
//     gST->ConOut->OutputString(gST->ConOut,L"These File or Dir in Root Dir:\n\r");
//     /* 进入根目录 */
//     while(1)
//     {
//         BufferSize = 1024;
//         Root->Read(Root,&BufferSize,(VOID*)FileBuf);
//         if(BufferSize == 0)
//         {
//             break;
//         }
//         FileInfo = (struct EFI_FILE_INFO*)FileBuf;
//         /* 存在Kernel目录 */
//         if(strcmp(FileInfo->FileName,L"Kernel") == 0)
//         {
//             break;
//         }
//     }
//     if(strcmp(FileInfo->FileName,L"Kernel") == 0)
//     {
//         Root->Open(Root,&KernelDir,L"\\Kernel",EFI_FILE_MODE_READ | EFI_FILE_MODE_WRITE,0);
//         /* 寻找kernel.sys */
//         while(1)
//         {
//             BufferSize = 1024;
//             KernelDir->Read(KernelDir,&BufferSize,(VOID*)FileBuf);
//             if(BufferSize == 0)
//             {
//                 break;
//             }
//             FileInfo = (struct EFI_FILE_INFO*)FileBuf;
//             if(strcmp(FileInfo->FileName,L"kernel.sys") == 0)
//             {
//                 /* 暂时没有操作 */
//                 gST->ConOut->OutputString(gST->ConOut,L"'kernel.sys' has found.\n\r");
//                 KernelDir->Close(KernelDir);
//                 Root->Close(Root);
//                 return EFI_SUCCESS;
//             }
//         }
//         gST->ConOut->OutputString(gST->ConOut,L"'kernel.sys' not found.\n\r");
//         KernelDir->Close(KernelDir);
//     }
//     else
//     {
//         gST->ConOut->OutputString(gST->ConOut,L"can't open '/Kernel'\n\r");
//     }
//     Root->Close(Root);
//     return 1;
// }