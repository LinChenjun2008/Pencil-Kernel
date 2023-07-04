#include <Efi.h>

#include "common.h"

#include "boot.h"
#include "file.h"
#include "lib.h"
#include "video.h"
#include "memory.h"
#include "script.h"

EFI_BOOT_SERVICES*               gBS;
EFI_GRAPHICS_OUTPUT_PROTOCOL*    Gop;
EFI_SYSTEM_TABLE*                gST;
EFI_SIMPLE_FILE_SYSTEM_PROTOCOL* Sfsp;
EFI_HANDLE                       gImageHandle;

EFI_GUID gEfiGraphicsOutputProtocolGuid   = EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID;
EFI_GUID gEfiSimpleFileSystemProtocolGuid = EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID;
EFI_GUID gEfiFileInfoGuid                 = EFI_FILE_INFO_ID;

void ReadConfig(EFI_PHYSICAL_ADDRESS FileBase,BootConfig* Config);
void gotoKernel(BootConfig* Config);

BootConfig Config =
{
    .hr             = 0,
    .vr             = 0,
    .kernel_flage   = 0,
    .KernelName     = L"\0",
    .files          = 0,
    .file_name      = {{0}},
    .flag           = {0}
    // .typeface_flage = 0,
    // .TypefaceName   = L"\0"
};

EFI_STATUS
EFIAPI
UefiMain
(
    IN EFI_HANDLE ImageHandle,
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

    SystemTable->ConOut->ClearScreen(SystemTable->ConOut); /* 清屏 */
    CHAR16* logo =
    L"\n\r"
     "     _______   ______   __   __   ______   ______   __       \n\r"
     "    / ___  /| / ____/| /  | / /| / ____/| /_  __/| / /|      \n\r"
     "   / /__/ / // /____|// | |/ / // /|___|/ |/ /|_|// / /      \n\r"
     "  / _____/ // ____/| / /| | / // / /      / / /  / / /       \n\r"
     " / /|____|// /____|// / |  / // /_/__  __/ /_/  / / /__      \n\r"
     "/_/ /     /______/|/_/ /|_/ //______/|/______/|/______/|     \n\r"
     "|_|/      |______|/|_|/ |_|/ |______|/|______|/|______|/     \n\r";
    SystemTable->ConOut->OutputString(SystemTable->ConOut,logo);

    /* 读取启动配置 */
    EFI_PHYSICAL_ADDRESS FileBase;
    if(EFI_ERROR(ReadFile(L"EFI\\Boot\\BootConfig.txt",&FileBase,NULL,AllocateAnyPages)))
    {
        gST->ConOut->OutputString(SystemTable->ConOut,L"'BootConfig.txt' not found. Press Any key to continue.\n\r");
        get_char();
    }
    else
    {
        ReadBootConfig(FileBase,&Config);
    }
    gotoKernel(&Config);
    return 0;
}

// void PrepareBootInfo(boot_info_t* binfo,BootConfig* Config)
// {
//     binfo->magic[0] = 0x5a;
//     binfo->magic[1] = 0x42;
//     binfo->magic[2] = 0xcb;
//     binfo->magic[3] = 0x16;
//     binfo->magic[4] = 0x13;
//     binfo->magic[5] = 0xd4;
//     binfo->magic[6] = 0xa6;
//     binfo->magic[7] = 0x2f;
//     binfo->kernel_base_address                = KernelBase;
//     binfo->typeface_base                      = TypefaceBase;
//     binfo->ttf_base                           = TTF_base;
//     binfo->graph_info.frame_buffer_base     = Gop->Mode->FrameBufferBase;
//     binfo->graph_info.horizontal_resolution = Gop->Mode->Info->HorizontalResolution;
//     binfo->graph_info.vertical_resolution   = Gop->Mode->Info->VerticalResolution;
//     // binfo->graph_info.PixelBitMask.RedMask   = Gop->Mode->Info->PixelInformation.RedMask;
//     // binfo->graph_info.PixelBitMask.GreenMask = Gop->Mode->Info->PixelInformation.GreenMask;
//     // binfo->graph_info.PixelBitMask.BlueMask  = Gop->Mode->Info->PixelInformation.BlueMask;
//     binfo->memory_map = *memmap;
// }

EFI_PHYSICAL_ADDRESS CreatePage(boot_info_t* binfo);

void gotoKernel(BootConfig* Config)
{
    boot_info_t* binfo = (VOID*)0x7c00;
    binfo->magic[0] = 0x5a;
    binfo->magic[1] = 0x42;
    binfo->magic[2] = 0xcb;
    binfo->magic[3] = 0x16;
    binfo->magic[4] = 0x13;
    binfo->magic[5] = 0xd4;
    binfo->magic[6] = 0xa6;
    binfo->magic[7] = 0x2f;
    /* 读取内核文件,默认加载到0x100000 */
    EFI_PHYSICAL_ADDRESS KernelFileBase = 0x100000;
    if(!Config->kernel_flage)
    {
        gST->ConOut->OutputString(gST->ConOut,L"Press kernel file name:");
        get_line(Config->KernelName,256);
    }
    if(EFI_ERROR(ReadFile(Config->KernelName,&KernelFileBase,NULL,AllocateAddress)))
    {
        gST->ConOut->OutputString(gST->ConOut,L"Unable to load kernel\n\r");
        gST->ConOut->OutputString(gST->ConOut,L"Please restart your computer\n\r");
    }
    binfo->loaded_files = Config->files;
    int i;
    for(i = 0;i < Config->files;i++)
    {
        EFI_PHYSICAL_ADDRESS file_base_address = 0;
        UINT64 FileSize;
        gST->ConOut->OutputString(gST->ConOut,Config->file_name[i]);
        gST->ConOut->OutputString(gST->ConOut,L" is Reading...\n\r");
        if(EFI_ERROR(ReadFile(Config->file_name[i],&file_base_address,&FileSize,AllocateAnyPages)))
        {
            gST->ConOut->OutputString(gST->ConOut,L"Unable to load file\n\r");
            gST->ConOut->OutputString(gST->ConOut,L"Please restart your computer\n\r");
        }
        gST->ConOut->OutputString(gST->ConOut,Config->file_name[i]);
        gST->ConOut->OutputString(gST->ConOut,L" Loaded\n\r");
        binfo->loaded_file[i].base_address = file_base_address;
        binfo->loaded_file[i].size         = FileSize;
        gST->ConOut->OutputString(gST->ConOut,L" Load next.\n\r");
        binfo->loaded_file[i].flag         = Config->flag[i];
    }
    /* 设置显示模式 */
    SetVideoMode(Config->hr,Config->vr);
    binfo->graph_info.frame_buffer_base     = Gop->Mode->FrameBufferBase;
    binfo->graph_info.horizontal_resolution = Gop->Mode->Info->HorizontalResolution;
    binfo->graph_info.vertical_resolution   = Gop->Mode->Info->VerticalResolution;
    memory_map_t Memmap =
    {
        .map_size = 4096 * 4,
        .buffer = NULL,
        .map_key = 0,
        .descriptor_size = 0,
        .descriptor_version = 0,
    };
    GetMemoryMap(&Memmap);
    binfo->memory_map = Memmap;
    // PrepareBootInfo(BootInfo,Config);
    EFI_PHYSICAL_ADDRESS PML4E= CreatePage(binfo);
    gST->ConOut->OutputString(gST->ConOut,L"goto kernel\n\r");
    // 退出启动时服务,进入内核
    gBS->ExitBootServices(gImageHandle,Memmap.map_key);
    binfo->typeface_base = binfo->loaded_file[0].base_address;
    __asm__ __volatile__
    (
        "movq %[PML4E_POS],%%cr3 \n\t"
        "movq $0xffff800000310000,%%rsp \n\t"
        "movq %[KernelEntry],%%rax \n\t"
        "callq *%%rax"
        :
        :[PML4E_POS]"r"(PML4E),[KernelEntry]"r"(KernelFileBase + 0xffff800000000000)
        :"rsp","rax"
    );
}

#define PG_P 0x1
#define PG_RW_R 0x0
#define PG_RW_W 0x2
#define PG_US_S 0x0
#define PG_US_U 0x4
#define PG_SIZE_2M 0x80

EFI_PHYSICAL_ADDRESS CreatePage(boot_info_t* binfo)
{
    /*
    * 系统内存分配:
    * 0x100000 - 0x2fffff ( 2MB) -内核
    * 0x300000 - 0x30ffff (64KB) -内核PCB
    * 0x310000 - 0x5f8fff ( 2MB) -空闲
    * 0x5f9000 - 0x5fffff (28KB) -内核页表(基础部分)
    * 0x600000 - 0x7fffff ( 2MB) -字体文件
    * 0x800000 - ....           -空闲内存
    映射:
    0x0000000000000000 - 0x00000000ffffffff ==> 0x0000000000000000 - 0x00000000ffffffff
    0x0000000000000000 - 0x00000000ffffffff ==> 0xffff800000000000 - 0xffff8000ffffffff
    0xffff807fc0000000 - 显存
    PML4E 0         PDPTE 3       PDE 511       offset
    0(1)000 0000 0 | 000 0000 11 | 11 1111 111 | 1 1111 1111 1111 1111 1111
    0(8)    0    0       0    f       f    f       f    f    f    f    f
       1000 0000 0 | 111 1111 11 | 00 0000 000 | 0 0000 0000 0000 0000 0000
       8    0    7       f    c       0    0       0    0    0    0    0
    */
    EFI_PHYSICAL_ADDRESS PML4E = 0x5f9000;
    EFI_PHYSICAL_ADDRESS PDPTE;
    EFI_PHYSICAL_ADDRESS PDE0;
    EFI_PHYSICAL_ADDRESS PDE1;
    EFI_PHYSICAL_ADDRESS PDE2;
    EFI_PHYSICAL_ADDRESS PDE3;
    EFI_PHYSICAL_ADDRESS PDE4; // 用于显存

    if(EFI_ERROR(GetPage(7,&PML4E)))
    {
        gST->ConOut->OutputString(gST->ConOut,L"can't allocate memory for Page Table!!! (ignore)\n\r");
    }

    memset((void*)PML4E,0, 7 * 0x1000);
    PDPTE  = PML4E + 1 * 0x1000;
    PDE0   = PML4E + 2 * 0x1000;
    PDE1   = PML4E + 3 * 0x1000;
    PDE2   = PML4E + 4 * 0x1000;
    PDE3   = PML4E + 5 * 0x1000;
    PDE4   = PML4E + 6 * 0x1000;

    *((UINTN*)(PML4E + 0x000)) = PDPTE | PG_US_U | PG_RW_W | PG_P; // 0x00000...
    *((UINTN*)(PML4E + 0x800)) = PDPTE | PG_US_U | PG_RW_W | PG_P; // 0xffff8...

    *((UINTN*)(PDPTE + 0x000)) = PDE0 | PG_US_U | PG_RW_W | PG_P;
    *((UINTN*)(PDPTE + 0x008)) = PDE1 | PG_US_U | PG_RW_W | PG_P;
    *((UINTN*)(PDPTE + 0x010)) = PDE2 | PG_US_U | PG_RW_W | PG_P;
    *((UINTN*)(PDPTE + 0x018)) = PDE3 | PG_US_U | PG_RW_W | PG_P;

    *((UINTN*)(PDPTE + 0xff8)) = PDE4 | PG_US_U | PG_RW_W | PG_P;
    UINTN i;
    EFI_PHYSICAL_ADDRESS Addr = 0;
    for(i = 0;i < 512;i++)
    {
        *((UINTN*)(PDE0 + i * 8)) = Addr | PG_US_U | PG_RW_W | PG_P | PG_SIZE_2M;
        Addr += 0x200000;
    }

    for(i = 0;i < 512;i++)
    {
        *((UINTN*)(PDE1 + i * 8)) = Addr | PG_US_U | PG_RW_W | PG_P | PG_SIZE_2M;
        Addr += 0x200000;
    }

    for(i = 0;i < 512;i++)
    {
        *((UINTN*)(PDE2 + i * 8)) = Addr | PG_US_U | PG_RW_W | PG_P | PG_SIZE_2M;
        Addr += 0x200000;
    }
    for(i = 0;i < 512;i++)
    {
        *((UINTN*)(PDE3 + i * 8)) = Addr | PG_US_U | PG_RW_W | PG_P | PG_SIZE_2M;
        Addr += 0x200000;
    }
    Addr = binfo->graph_info.frame_buffer_base;
    for(i = 0;i < 8;i++)
    {
        *((UINTN*)(PDE4 + i * 8)) = Addr | PG_US_U | PG_RW_W | PG_P | PG_SIZE_2M;
        Addr += 0x200000;
    }
    binfo->graph_info.frame_buffer_base = 0xffff807fc0000000;
    return PML4E;
}