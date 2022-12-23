// #include<Uefi.h>
// #include<Library/UefiBootServicesTableLib.h>

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

void GetMemoryMap(struct MemoryMap* memmap)
{
    if(EFI_ERROR(gBS->AllocatePool(EfiLoaderData,memmap->MapSize,&memmap->Buffer)))
    {
        gST->ConOut->OutputString(gST->ConOut,L"Allocate memory failed for Memmap.\n\r");
    }
    // if(EFI_ERROR(gBS->AllocatePages(AllocateAnyPages,EfiLoaderData,(memmap->MapSize + 1) / 0x1000,&memmap->Buffer)))
    // {
    //     gST->ConOut->OutputString(gST->ConOut,L"Allocate memory failed for Memmap.\n\r");
    // }
    gBS->GetMemoryMap
    (
        &memmap->MapSize,
        (EFI_MEMORY_DESCRIPTOR*)memmap->Buffer,
        &memmap->MapKey,
        &memmap->DescriptorSize,
        &memmap->DescriptorVersion
    );
}