#include <Uefi.h>
#include <Library/UefiBootServicesTableLib.h>
#include <Protocol/GraphicsOutput.h>
#include <Protocol/SimpleFileSystem.h>
#include <Guid/FileInfo.h>

#include "share.h"

#include "file.h"
#include "lib.h"
#include "video.h"

EFI_BOOT_SERVICES*               gBS;
EFI_GRAPHICS_OUTPUT_PROTOCOL*    Gop;
EFI_SYSTEM_TABLE*                gST;
EFI_SIMPLE_FILE_SYSTEM_PROTOCOL* Sfsp;
EFI_HANDLE                       gImageHandle;

EFI_GUID gEfiGraphicsOutputProtocolGuid = EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID;
EFI_GUID gEfiSimpleFileSystemProtocolGuid = EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID;
EFI_GUID gEfiFileInfoGuid                 = EFI_FILE_INFO_ID;
EFI_STATUS
EFIAPI
UefiMain
(
    IN EFI_HANDLE ImageHandle __attribute__((unused)),
    IN EFI_SYSTEM_TABLE* SystemTable
)
{
    gImageHandle = ImageHandle;
    gBS = SystemTable->BootServices;
    gST = SystemTable;
    /* 禁用计时器 */
    SystemTable->BootServices->SetWatchdogTimer(0,0,0,NULL);
    
    gBS->LocateProtocol(&gEfiGraphicsOutputProtocolGuid,NULL,(VOID**)&Gop);
    gBS->LocateProtocol(&gEfiSimpleFileSystemProtocolGuid,NULL,(VOID**)&Sfsp);

    /* 设置显示模式 */
    SystemTable->ConOut->ClearScreen(SystemTable->ConOut); /* 清屏 */
    SystemTable->ConOut->OutputString(SystemTable->ConOut,L"Pencil-Boot\n\r");
    SystemTable->ConOut->OutputString(SystemTable->ConOut,L"by LinChenjun.\n\r");
    
    CHAR16 str[30];
    UINTN SizeOfInfo = 0;
    EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *Info;
    UINTN i;
    for(i = 0;i < Gop->Mode->MaxMode;i++)
    {
        Gop->QueryMode(Gop,i,&SizeOfInfo,&Info);

        // utoa(i,str,10);
        // SystemTable->ConOut->OutputString(SystemTable->ConOut,L"\n\rNr:");
        // SystemTable->ConOut->OutputString(SystemTable->ConOut,str);

        // utoa(Info->HorizontalResolution,str,10);
        // SystemTable->ConOut->OutputString(SystemTable->ConOut,L" X:");
        // SystemTable->ConOut->OutputString(SystemTable->ConOut,str);

        // utoa(Info->VerticalResolution,str,10);
        // SystemTable->ConOut->OutputString(SystemTable->ConOut,L" Y:");
        // SystemTable->ConOut->OutputString(SystemTable->ConOut,str);
    }
    SystemTable->ConOut->OutputString(SystemTable->ConOut,L"\n\r");
    // Open_Kernel_sys();
    // Gop->SetMode(Gop,22);
    // Rectangle r = {10,10,100,200};
    // EFI_GRAPHICS_OUTPUT_BLT_PIXEL c = {255,255,255,0};
    // draw_rect(&r,&c);
    EFI_PHYSICAL_ADDRESS FileBase = 0x100000;
    while(1)
    {
        /* 提示符 */
        SystemTable->ConOut->OutputString(SystemTable->ConOut,L"Pencil Boot >");
        /* 等待,直到发生输入 */
        str[0] = L'\0';
        get_line(str,30);
        if(strcmp(str,L"") == 0)
        {
            continue;
        }
        else if(strcmp(str,L"shutdown") == 0)
        {
            SystemTable->ConOut->OutputString(SystemTable->ConOut,L"Press any key to shutdown...\n\r");
            get_char();
            SystemTable->RuntimeServices->ResetSystem(EfiResetShutdown,EFI_SUCCESS,0,NULL);
            return 0;
        }
        else if(strcmp(str,L"cls") == 0)
        {
            SystemTable->ConOut->ClearScreen(SystemTable->ConOut);
        }
        else if(strcmp(str,L"boot") == 0)
        {
            if(EFI_ERROR(ReadFile(L"\\kernel.sys",&FileBase,AllocateAddress)))
            {
                continue;
            }
            else
            {
                utoa(FileBase,str,16);
                SystemTable->ConOut->OutputString(SystemTable->ConOut,L"FileBase: ");
                SystemTable->ConOut->OutputString(SystemTable->ConOut,str);
                SystemTable->ConOut->OutputString(SystemTable->ConOut,L"\n\r");
                EFI_STATUS (*Kernel)(struct BootInfo* BootInfo) = (EFI_STATUS(*)())FileBase;
                struct BootInfo BootInfo;
                BootInfo.GraphicInfo.FrameBufferBase = Gop->Mode->FrameBufferBase;
                BootInfo.GraphicInfo.HorizontalResolution = Gop->Mode->Info->HorizontalResolution;
                BootInfo.GraphicInfo.VerticalResolution = Gop->Mode->Info->VerticalResolution;
                utoa(Kernel(&BootInfo),str,16);
                SystemTable->ConOut->OutputString(SystemTable->ConOut,L"Kernel Return: ");
                SystemTable->ConOut->OutputString(SystemTable->ConOut,str);
                SystemTable->ConOut->OutputString(SystemTable->ConOut,L"\n\r");
            }
        }
    }
    return 0;
}