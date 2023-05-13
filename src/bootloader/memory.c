#include <Efi.h>
#include <common.h>
/*
* 分配PageSize页内存
*/
EFI_STATUS AllocPage(UINTN PageSize,OUT EFI_PHYSICAL_ADDRESS* Address)
{
    EFI_STATUS Status = EFI_SUCCESS;
    Status = gBS->AllocatePages
    (
        AllocateAnyPages,
        EfiLoaderData,
        PageSize,
        Address
    );
    return Status;
}

/*
* 从Address处分配PageSzie页内存
*/
EFI_STATUS GetPage(UINTN PageSize,EFI_PHYSICAL_ADDRESS* Address)
{
    EFI_STATUS Status = EFI_SUCCESS;
    Status = gBS->AllocatePages
    (
        AllocateAddress,
        EfiLoaderData,
        PageSize,
        Address
    );
    return Status;
}

void GetMemoryMap(memory_map_t* memmap)
{
    if(EFI_ERROR(gBS->AllocatePool(EfiLoaderData,memmap->map_size,&memmap->buffer)))
    {
        gST->ConOut->OutputString(gST->ConOut,L"Allocate memory failed for Memmap.\n\r");
    }
    // if(EFI_ERROR(gBS->AllocatePages(AllocateAnyPages,EfiLoaderData,(memmap->map_size + 1) / 0x1000,&memmap->buffer)))
    // {
    //     gST->ConOut->OutputString(gST->ConOut,L"Allocate memory failed for Memmap.\n\r");
    // }
    gBS->GetMemoryMap
    (
        &memmap->map_size,
        (EFI_MEMORY_DESCRIPTOR*)memmap->buffer,
        &memmap->map_key,
        &memmap->descriptor_size,
        &memmap->descriptor_version
    );
}