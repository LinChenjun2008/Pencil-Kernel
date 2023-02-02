#include <Efi.h>

#include "common.h"

#include "file.h"
#include "lib.h"
#include "video.h"
#include "memory.h"

EFI_BOOT_SERVICES*               gBS;
EFI_GRAPHICS_OUTPUT_PROTOCOL*    Gop;
EFI_SYSTEM_TABLE*                gST;
EFI_SIMPLE_FILE_SYSTEM_PROTOCOL* Sfsp;
EFI_HANDLE                       gImageHandle;

EFI_GUID gEfiGraphicsOutputProtocolGuid   = EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID;
EFI_GUID gEfiSimpleFileSystemProtocolGuid = EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID;
EFI_GUID gEfiFileInfoGuid                 = EFI_FILE_INFO_ID;

typedef struct
{
    int hr;
    int vr;
    int kernel_flage;
    CHAR16   KernelName[256];
    int typeface_flage;
    CHAR16 TypefaceName[256];
} BootConfig;

void ReadConfig(EFI_PHYSICAL_ADDRESS FileBase,BootConfig* Config);
void PrepareBootInfo(struct BootInfo* Binfo,struct MemoryMap* memmap,EFI_PHYSICAL_ADDRESS KernelBase,EFI_PHYSICAL_ADDRESS TypefaceBase);
void gotoKernel(BootConfig* Config);

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
    L"     _______   ______   __   __   ______   ______   __       \n\r"
     "    / ___  /| / ____/| /  | / /| / ____/| /_  __/| / /|      \n\r"
     "   / /__/ / // /____|// | |/ / // /|___|/ |/ /|_|// / /      \n\r"
     "  / _____/ // ____/| / /| | / // / /      / / /  / / /       \n\r"
     " / /|____|// /____|// / |  / // /_/__  __/ /_/  / / /__      \n\r"
     "/_/ /     /______/|/_/ /|_/ //______/|/______/|/______/|     \n\r"
     "|_|/      |______|/|_|/ |_|/ |______|/|______|/|______|/     \n\r";
    SystemTable->ConOut->OutputString(SystemTable->ConOut,logo);
    /* 读取启动配置 */
    
    BootConfig Config =
    {
        .hr             = 0,
        .vr             = 0,
        .kernel_flage   = 0,
        .KernelName     = L"\0",
        .typeface_flage = 0,
        .TypefaceName   = L"\0"
    };
    EFI_PHYSICAL_ADDRESS FileBase;
    if(EFI_ERROR(ReadFile(L"EFI\\Boot\\BootConfig.txt",&FileBase,AllocateAnyPages)))
    {
        gST->ConOut->OutputString(SystemTable->ConOut,L"'BootConfig.txt' not found. Press Any key to continue.\n\r");
        get_char();
    }
    else
    {
        ReadConfig(FileBase,&Config);
    }
    gotoKernel(&Config);
    return 0;
}

CHAR16* skip_space(CHAR16* s)
{
    while(*s == L' ' || *s == L'\n' || *s == L'\r')
    {
        s++;
    }
    return s;
}

void ReadConfig(EFI_PHYSICAL_ADDRESS FileBase,BootConfig* Config)
{
    gST->ConOut->OutputString(gST->ConOut,L"Reading Config...\n\r");
    CHAR16* s = (CHAR16*)FileBase;
    while(*s)
    {
        if(*s == L'.')
        {
            s++;
        
            if(*s == L'x' || *s == L'X')
            {
                s += 2;
                Config->hr = 0;
                while(*s <= L'9' && *s >= L'0')
                {
                    Config->hr = Config->hr * 10 + *(s++) - L'0'; 
                }
            }
            else if(*s == L'y' || *s == L'Y')
            {
                s += 2;
                Config->vr = 0;
                while(*s <= L'9' && *s >= L'0')
                {
                    Config->vr = Config->vr * 10 + *(s++) - L'0'; 
                }
            }
            else if(strncmp(s,L"kernel",6) == 0)
            {
                s += 6;
                s = skip_space(s);
                if(*s == L'=')
                {
                    s++;
                }
                s = skip_space(s);
                if(*s != L'\"')
                {
                    continue;
                }
                s++;
                int i = 0;
                while((Config->KernelName[i++] = *s++) != L'\"');
                Config->KernelName[i - 1] = L'\0';
                Config->kernel_flage = 1;
            }
            else if(strncmp(s,L"typeface",8) == 0)
            {
                s += 8;
                s = skip_space(s);
                if(*s == L'=')
                {
                    s++;
                }
                s = skip_space(s);
                if(*s != L'\"')
                {
                    continue;
                }
                s++;
                int i = 0;
                while((Config->TypefaceName[i++] = *s++) != L'\"');
                Config->TypefaceName[i - 1] = L'\0';
                Config->typeface_flage = 1;
            }
        }
        s++;
    }
}

void PrepareBootInfo(struct BootInfo* Binfo,struct MemoryMap* memmap,EFI_PHYSICAL_ADDRESS KernelBase,EFI_PHYSICAL_ADDRESS TypefaceBase)
{
    Binfo->KernelBaseAddress                   = KernelBase;
    Binfo->TypefaceBase                       = TypefaceBase;
    Binfo->GraphicsInfo.FrameBufferBase        = Gop->Mode->FrameBufferBase;
    Binfo->GraphicsInfo.HorizontalResolution   = Gop->Mode->Info->HorizontalResolution;
    Binfo->GraphicsInfo.VerticalResolution     = Gop->Mode->Info->VerticalResolution;
    Binfo->GraphicsInfo.PixelBitMask.RedMask   = Gop->Mode->Info->PixelInformation.RedMask;
    Binfo->GraphicsInfo.PixelBitMask.GreenMask = Gop->Mode->Info->PixelInformation.GreenMask;
    Binfo->GraphicsInfo.PixelBitMask.BlueMask  = Gop->Mode->Info->PixelInformation.BlueMask;
    Binfo->MemoryMap = *memmap;
}

EFI_PHYSICAL_ADDRESS CreatePage(struct BootInfo* Binfo);

void gotoKernel(BootConfig* Config)
{
    /* 读取内核文件,默认加载到0x100000 */
    EFI_PHYSICAL_ADDRESS KernelFileBase = 0x100000;
    if(!Config->kernel_flage)
    {
        gST->ConOut->OutputString(gST->ConOut,L"Press kernel file name:");
        get_line(Config->KernelName,256);
    }
    if(EFI_ERROR(ReadFile(Config->KernelName,&KernelFileBase,AllocateAddress)))
    {
        gST->ConOut->OutputString(gST->ConOut,L"Unable to load kernel\n\r");
        gST->ConOut->OutputString(gST->ConOut,L"Please restart your computer\n\r");
        while(1);
    }
    EFI_PHYSICAL_ADDRESS TypefaceBase = 0x600000;
    if(Config->typeface_flage == 1)
    {
        if(EFI_ERROR(ReadFile(Config->TypefaceName,&TypefaceBase,AllocateAddress)))
        {
            gST->ConOut->OutputString(gST->ConOut,L"ERROR:typeface file needed but not found. Press any key to continue. \n\r");
            get_char();
            TypefaceBase = (EFI_PHYSICAL_ADDRESS)NULL;
        }
    }
    /* 设置显示模式 */
    SetVideoMode(Config->hr,Config->vr);
    struct MemoryMap Memmap = 
    {
        .MapSize = 4096 * 4,
        .Buffer = NULL,
        .MapKey = 0,
        .DescriptorSize = 0,
        .DescriptorVersion = 0,
    };
    GetMemoryMap(&Memmap);
    struct BootInfo* BootInfo = (VOID*)0x7c00;
    PrepareBootInfo(BootInfo,&Memmap,KernelFileBase,TypefaceBase);
    EFI_PHYSICAL_ADDRESS PML4E= CreatePage(BootInfo);
    // 退出启动时服务,进入内核
    gBS->ExitBootServices(gImageHandle,Memmap.MapKey);
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

EFI_PHYSICAL_ADDRESS CreatePage(struct BootInfo* Binfo)
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
    Addr = Binfo->GraphicsInfo.FrameBufferBase;
    for(i = 0;i < 8;i++)
    {
        *((UINTN*)(PDE4 + i * 8)) = Addr | PG_US_U | PG_RW_W | PG_P | PG_SIZE_2M;
        Addr += 0x200000;
    }
    Binfo->GraphicsInfo.FrameBufferBase = 0xffff807fc0000000;
    return PML4E;
}