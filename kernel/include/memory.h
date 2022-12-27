#ifndef __MEMORY_H__
#define __MEMORY_H__

#include <common.h>

enum MemoryType
{
    FreeMemory = 1, // EfiConventionalMemory EfiBootServices(Code/Data) EfiLoader(Code/Data)
    EfiMemory,      // EfiRuntimeServices(Code/Data)
    MemoryMappedIO, // EfiMemoryMappedIO EfiMemoryMappedIOPortSpace
    APICMemory,     // EfiACPIReclaimMemory EfiACPIMemoryNVS
    ReservedMemory, // EfiPalCode
    Unuseable,      // EfiUnusableMemory (EfiReservedMemoryType EfiMaxMemoryType) 
    MaxMemoryType,
};

struct MEMDESC
{
    MEMORY_ADDRESS AddrStart;       // 内存起始地址
    UINT64         Memory_4KB_Size; // 内存大小(以4kb为单位)
    UINT64         Memory_2MB_Size; // 内存大小(以2MB为单位)
    enum MemoryType Type;
};

PUBLIC void init_memory();
#define MemoryDescriptorCnt 64
extern struct MEMDESC MemoryDescriptor[MemoryDescriptorCnt];
extern int MemoryDescriptorNumber;

#endif