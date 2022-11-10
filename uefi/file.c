#include <Uefi.h>
#include <Library/UefiBootServicesTableLib.h>

#include "file.h"
#include "lib.h"

EFI_STATUS Open_Kernel_sys()
{
    UINT8 FileBuf[1024];
    UINTN BufferSize = 1024;
    struct EFI_FILE_INFO* FileInfo;
    EFI_FILE_PROTOCOL* Root;
    EFI_FILE_PROTOCOL* KernelDir;
    Sfsp->OpenVolume(Sfsp,&Root);
    gST->ConOut->OutputString(gST->ConOut,L"These File or Dir in Root Dir:\n\r");
    /* 进入根目录 */
    while(1)
    {
        BufferSize = 1024;
        Root->Read(Root,&BufferSize,(VOID*)FileBuf);
        if(BufferSize == 0)
        {
            break;
        }
        FileInfo = (struct EFI_FILE_INFO*)FileBuf;
        /* 存在Kernel目录 */
        if(strcmp(FileInfo->FileName,L"Kernel") == 0)
        {
            break;
        }
    }
    if(strcmp(FileInfo->FileName,L"Kernel") == 0)
    {
        Root->Open(Root,&KernelDir,L"\\Kernel",EFI_FILE_MODE_READ | EFI_FILE_MODE_WRITE,0);
        /* 寻找kernel.sys */
        while(1)
        {
            BufferSize = 1024;
            KernelDir->Read(KernelDir,&BufferSize,(VOID*)FileBuf);
            if(BufferSize == 0)
            {
                break;
            }
            FileInfo = (struct EFI_FILE_INFO*)FileBuf;
            if(strcmp(FileInfo->FileName,L"kernel.sys") == 0)
            {
                /* 暂时没有操作 */
                gST->ConOut->OutputString(gST->ConOut,L"'kernel.sys' has found.\n\r");
                KernelDir->Close(KernelDir);
                return EFI_SUCCESS;
            }
        }
        gST->ConOut->OutputString(gST->ConOut,L"'kernel.sys' not found.\n\r");
        KernelDir->Close(KernelDir);
    }
    else
    {
        gST->ConOut->OutputString(gST->ConOut,L"can't open '/Kernel'\n\r");
    }
    Root->Close(Root);
    return EFI_ERROR;
}