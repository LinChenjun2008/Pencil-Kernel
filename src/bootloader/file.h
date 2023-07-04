#ifndef __FILE_H__
#define __FILE_H__

EFI_STATUS ReadFile(IN CHAR16* FileName,EFI_PHYSICAL_ADDRESS* FileBufferAddress,OUT UINTN* FileSize,EFI_ALLOCATE_TYPE BufferType);
EFI_STATUS Open_Kernel_sys();

#endif