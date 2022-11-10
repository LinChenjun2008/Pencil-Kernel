#include<Uefi.h>
#include<Library/UefiBootServicesTableLib.h>

/*
* 分配PageSize页内存
*/
EFI_STATUS AllocPage(UINTN PageSize,OUT EFI_PHYSICAL_ADDRESS* Address)
{
    EFI_STATUS Status = EFI_SUCCESS;
    gBS->AllocatePages
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
    gBS->AllocatePages
    (
        AllocateAddress,
        EfiLoaderData,
        PageSize,
        Address
    );
    return Status;
}
