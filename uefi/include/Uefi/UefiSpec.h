#ifndef __UEFISPEC_H__
#define __UEFISPEC_H__

#include <Protocol/GraphicsOutput.h>
#include <Protocol/SimpleFileSystem.h>
#include <Protocol/SimpleTextOut.h>
#include <Protocol/SimpleTextIn.h>

typedef enum
{
    AllocateAnyPages,
    AllocateMaxAddress,
    AllocateAddress,
    MaxAllocateType,
} EFI_ALLOCATE_TYPE;

typedef enum
{
    EfiReservedMemoryType,
    EfiLoaderCode,
    EfiLoaderData,
    EfiBootServicesCode,
    EfiBootServicesData,
    EfiRuntimeServicesCode,
    EfiRuntimeServicesData,
    EfiConventionalMemory,
    EfiUnusableMemory,
    EfiACPIReclaimMemory,
    EfiACPIMemoryNVS,
    EfiMemoryMappedIO,
    EfiMemoryMappedIOPortSpace,
    EfiPalCode,
    EfiPersistentMemory,
    EfiUnacceptedMemoryType,
    EfiMaxMemoryType
} EFI_MEMORY_TYPE;

typedef struct
{
    UINT32               Type;
    EFI_PHYSICAL_ADDRESS PhysicalStart;
    EFI_VIRTUAL_ADDRESS  VirtualStart;
    UINT64               NumberOfPages;
    UINT64               Attribute;
} EFI_MEMORY_DESCRIPTOR;

typedef
EFI_STATUS (EFIAPI *EFI_ALLOCATE_PAGES)
(
    EFI_ALLOCATE_TYPE     Type,
    EFI_MEMORY_TYPE       MemoryType,
    UINTN                 Pages,
    EFI_PHYSICAL_ADDRESS* Memory
);

typedef
EFI_STATUS (EFIAPI *EFI_FREE_PAGES)
(
    EFI_PHYSICAL_ADDRESS Memory,
    UINTN                Pages
);

// typedef
// EFI_STATUS
// (EFIAPI *EFI_GET_MEMORY_MAP)
// (
//   IN OUT UINTN                 *MemoryMapSize,
//   OUT    EFI_MEMORY_DESCRIPTOR *MemoryMap,
//   OUT    UINTN                 *MapKey,
//   OUT    UINTN                 *DescriptorSize,
//   OUT    UINT32                *DescriptorVersion
// );

// typedef
// EFI_STATUS
// (EFIAPI *EFI_ALLOCATE_POOL)
// (
//   IN  EFI_MEMORY_TYPE   PoolType,
//   IN  UINTN             Size,
//   OUT VOID            **Buffer
// );

// typedef
// EFI_STATUS
// (EFIAPI *EFI_FREE_POOL)
// (
//   IN  VOID *Buffer
// );

// typedef
// EFI_STATUS
// (EFIAPI *EFI_SET_VIRTUAL_ADDRESS_MAP)
// (
//   IN  UINTN                        MemoryMapSize,
//   IN  UINTN                        DescriptorSize,
//   IN  UINT32                       DescriptorVersion,
//   IN  EFI_MEMORY_DESCRIPTOR        *VirtualMap
// );

#endif