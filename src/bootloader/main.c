#include "boot.h"

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
    UINT64 map_size;
    VOID*  buffer;
    UINT64 map_key;
    UINT64 descriptor_size;
    UINT32 descriptor_version;
} EFI_MEMORY_MAP;

EFI_STATUS EFIAPI UefiMain(IN EFI_HANDLE ImageHandle,IN EFI_SYSTEM_TABLE* SystemTable)
{
    EFI_STATUS Status = EFI_SUCCESS;
    EfiInit(ImageHandle,SystemTable);
    /* 禁用计时器 */
    SystemTable->BootServices->SetWatchdogTimer(0,0,0,NULL);
    /* 清空屏幕 */
    SystemTable->ConOut->ClearScreen(SystemTable->ConOut);
    SetVideoMode(HORIZONTAL_RESOLUTION,VERTICAL_RESOLUTION);

    gST->ConOut->OutputString(gST->ConOut,L"\n\rPencil-Boot Starting...\n\r");
    EFI_PHYSICAL_ADDRESS ArrFileBufferBase[sizeof(Files) / sizeof(Files[0])] = {0};
    UINT64               ArrFileSize[sizeof(Files) / sizeof(Files[0])] = {0};
    EFI_PHYSICAL_ADDRESS FileBufferBase = 0;
    UINT64               FileSize = 0;
    UINTN i;
    for (i = 0;i < sizeof(Files) / sizeof(Files[0]);i++)
    {
        FileBufferBase = Files[i].FileBufferBase;
        Status = ReadFile(Files[i].Name,&FileBufferBase,Files[i].FileBufferType,&FileSize);
        gST->ConOut->OutputString(gST->ConOut,L"Load File ");
        CHAR16 str[2];
        str[0] = i + L'0';
        str[1] = 0;
        gST->ConOut->OutputString(gST->ConOut,str);
        if (EFI_ERROR(Status))
        {
            gST->ConOut->OutputString(gST->ConOut,L" ERROR! ");
            if (Files[i].Flag & 0x80000000)
            {
                STOP();
            }
            else
            {
                gST->ConOut->OutputString(gST->ConOut,L"(ignored)");
            }
        }
        else
        {
            gST->ConOut->OutputString(gST->ConOut,L" Success");
        }
        gST->ConOut->OutputString(gST->ConOut,L"\n\r");
        ArrFileBufferBase[i] = FileBufferBase;
        ArrFileSize[i]       = FileSize;
    }

    memory_map_t Memmap =
    {
        .map_size = 4096 * 4,
        .buffer = NULL,
        .map_key = 0,
        .descriptor_size = 0,
        .descriptor_version = 0,
    };
    GetMemoryMap(&Memmap);

    boot_info_t *boot_info = (void*)0x7c00;

    boot_info->magic                            = 0x5a42cb1613d4a62f;

    boot_info->kernel_base_address              = 0x100000;
    boot_info->typeface_base                    = ArrFileBufferBase[1];
    boot_info->typeface_size                    = ArrFileSize[1];
    boot_info->ttf_base                         = ArrFileBufferBase[2];
    boot_info->ttf_size                         = ArrFileSize[2];

    boot_info->memory_map                       = Memmap;

    boot_info->graph_info.horizontal_resolution = Gop->Mode->Info->HorizontalResolution;
    boot_info->graph_info.vertical_resolution   = Gop->Mode->Info->VerticalResolution;
    boot_info->graph_info.frame_buffer_base     = 0xffff807fc0000000;

    UINTN PML4T_POS = 0x5f9000;
    gBS->AllocatePages(AllocateAddress,EfiLoaderData,7,&PML4T_POS);
    CreatePage(PML4T_POS);

    gBS->ExitBootServices(gImageHandle,Memmap.map_key);
    __asm__ __volatile__
    (
        "movq %0,%%cr3 \n\t"
        "movq $0xffff800000310000,%%rsp \n\t"
        "movq %1,%%rax \n\t"
        "callq *%%rax"
        :
        :"r"(PML4T_POS),"r"(0xffff800000100000)
    );
    while(1);
    return Status;
}

EFI_STATUS EFIAPI EfiInit(IN EFI_HANDLE ImageHandle,IN EFI_SYSTEM_TABLE* SystemTable)
{
    gImageHandle = ImageHandle;
    gBS = SystemTable->BootServices;
    gST = SystemTable;
    gBS->LocateProtocol(&gEfiGraphicsOutputProtocolGuid,NULL,(VOID**)&Gop);
    gBS->LocateProtocol(&gEfiSimpleFileSystemProtocolGuid,NULL,(VOID**)&Sfsp);
    return EFI_SUCCESS;
}

EFI_STATUS ReadFile(IN CHAR16* FileName,IN OUT EFI_PHYSICAL_ADDRESS *FileBufferBase,IN EFI_ALLOCATE_TYPE BufferType,OUT UINT64* FileSize)
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
    if (EFI_ERROR(Status))
    {
        return Status;
    }
    EFI_SIMPLE_FILE_SYSTEM_PROTOCOL* FileSystem;
    EFI_FILE_PROTOCOL* Root;
    UINTN Nr;
    for (Nr = 0;Nr < HandleCount;Nr++)
    {
        Status = gBS->OpenProtocol
        (
            HandleBuffer[Nr],
            &gEfiSimpleFileSystemProtocolGuid,
            (VOID**)&FileSystem,
            gImageHandle,
            NULL,
            EFI_OPEN_PROTOCOL_GET_PROTOCOL
        );
        if (EFI_ERROR(Status))
        {
            return Status;
        }
        Status = FileSystem->OpenVolume
        (
            FileSystem,
            &Root
        );
        if (EFI_ERROR(Status))
        {
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
        if (EFI_ERROR(Status))
        {
            if (Nr == HandleCount - 1)
                return Status;
        }
        else
        {
            break;
        }
    }

    EFI_FILE_INFO* FileInfo;
    UINTN InfoSize = sizeof(EFI_FILE_INFO) + sizeof(*FileName) * 256;
    Status = gBS->AllocatePool
    (
        EfiLoaderData,
        InfoSize,
        (VOID**)&FileInfo
    );
    if (EFI_ERROR(Status))
    {
        return Status;
    }
    Status = FileHandle->GetInfo
    (
        FileHandle,
        &gEfiFileInfoGuid,
        &InfoSize,
        FileInfo
    );
    if (EFI_ERROR(Status))
    {
        gBS->FreePool(FileInfo);
        return Status;
    }
    UINTN FilePageSize = (FileInfo->FileSize + 0x0fff) / 0x1000;
    EFI_PHYSICAL_ADDRESS *FileBufferAddress = FileBufferBase;
    Status = gBS->AllocatePages
    (
        BufferType,
        EfiLoaderData,
        FilePageSize,
        FileBufferAddress
    );
    if (BufferType == AllocateAnyPages)
    {
        if (EFI_ERROR(Status))
        {
            gBS->FreePool(FileInfo);
            return Status;
        }
    }
    UINTN ReadSize = FileInfo->FileSize;
    Status = FileHandle->Read
    (
        FileHandle,
        &ReadSize,
        (VOID*)*FileBufferAddress
    );
    *FileSize = FileInfo->FileSize;
    *FileBufferBase = *FileBufferAddress;
    gBS->FreePool(FileInfo);
    FileHandle->Close(FileHandle);
    Root->Close(Root);
    return Status;
}

UINTN abs(INTN a)
{
    return (a < 0 ) ? -a : a;
}

void SetVideoMode(int x,int y)
{
    UINTN SizeOfInfo = 0;
    EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *Info;
    UINTN i;
    int Mode = 0;
    UINTN sub = 0xffffffff;
    for(i = 0;i < Gop->Mode->MaxMode;i++)
    {
        Gop->QueryMode(Gop,i,&SizeOfInfo,&Info);
        if(abs(x - Info->HorizontalResolution) + abs(y -Info->VerticalResolution) < sub)
        {
            sub = abs(x - Info->HorizontalResolution) + abs(y - Info->VerticalResolution);
            Mode = i;
        }
    }
    Gop->SetMode(Gop,Mode);
}

EFI_STATUS GetMemoryMap(memory_map_t* memmap)
{
    EFI_STATUS Status = EFI_SUCCESS;
    Status = gBS->AllocatePool(EfiLoaderData,memmap->map_size,&memmap->buffer);
    if(EFI_ERROR(Status))
    {
        return Status;
    }
    Status = gBS->GetMemoryMap
    (
        &memmap->map_size,
        (EFI_MEMORY_DESCRIPTOR*)memmap->buffer,
        &memmap->map_key,
        &memmap->descriptor_size,
        &memmap->descriptor_version
    );
    return Status;
}

VOID CreatePage(EFI_PHYSICAL_ADDRESS PML4T)
{
    /*
    * 系统内存分配:
    * 0x100000 - 0x2fffff ( 2MB) -内核
    * 0x300000 - 0x30ffff (64KB) -内核PCB
    * 0x310000 - 0x5f8fff ( 2MB) -空闲
    * 0x5f9000 - 0x5fffff (28KB) -内核页表(基础部分)
    *      0x600000 - 0x7fffff ( 2MB) -字体文件
    * 0x600000 - 0x1000000 (10MB) -字体文件
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
    EFI_PHYSICAL_ADDRESS PDPT;
    EFI_PHYSICAL_ADDRESS PDT;
    EFI_PHYSICAL_ADDRESS Frame_buffer_PDT; // 用于显存

    gBS->SetMem((void*)PML4T,7 * 0x1000,0);
    PDPT  = PML4T + 1 * 0x1000;

    *((UINTN*)(PML4T + 0x000)) = PDPT | PG_US_U | PG_RW_W | PG_P; // 0x00000...
    *((UINTN*)(PML4T + 0x800)) = PDPT | PG_US_U | PG_RW_W | PG_P; // 0xffff8...

    EFI_PHYSICAL_ADDRESS Addr = 0;
    UINTN i;
    for (i = 0;i <= 3;i++)
    {
        PDT = PML4T + (2 + i) * 0x1000;
        *((UINTN*)PDPT + i) = PDT | PG_US_U | PG_RW_W | PG_P;
        UINTN j;
        for (j = 0;j < 512;j++)
        {
            *((UINTN*)PDT + j) = Addr | PG_US_U | PG_RW_W | PG_P | PG_SIZE_2M;
            Addr += 0x200000;
        }
    }
    Frame_buffer_PDT   = PDT + 0x1000;
    *((UINTN*)(PDPT + 0xff8)) = Frame_buffer_PDT | PG_US_U | PG_RW_W | PG_P;
    Addr = Gop->Mode->FrameBufferBase;
    for(i = 0;i < (Gop->Mode->FrameBufferSize + 0x1fffff) / 0x200000;i++)
    {
        *((UINTN*)Frame_buffer_PDT + i) = Addr | PG_US_U | PG_RW_W | PG_P | PG_SIZE_2M;
        Addr += 0x200000;
    }
    return;
}

///// 取自kernel/graphic/graphic.c
static inline pixel_t make_color(uint8_t red,uint8_t green,uint8_t blue)
{
    pixel_t col =
    {
        .red = red,
        .green = green,
        .blue = blue
    };
    return col;
}
/**
 * @brief 在屏幕上画一个矩形

 * @param graph_info    图像缓存区的描述符,
                   指明目缓存区的水平和垂直分辨率.

 * @param color    要填充的颜色.

 * @param x0
 * @param y0       这两个参数组合成填充范围
                   的左上角坐标(x0,y0)

 * @param x1
 * @param y1       这两个参数组合成填充范围
                    的右下角坐标(x1,y1)

*/
void view_fill(graph_info_t* graph_info,pixel_t color,unsigned int x0,unsigned int y0,unsigned int x1,unsigned int y1)
{
    unsigned int x;
    unsigned int y;
    pixel_t* frame_buffer = (pixel_t*)graph_info->frame_buffer_base;
    unsigned int xsize = graph_info->horizontal_resolution;
    for (y = y0;y < y1;y++)
    {
        for (x = x0;x < x1;x++)
        {
            *(frame_buffer + y * xsize + x) = color;
        }
    }
    return;
}