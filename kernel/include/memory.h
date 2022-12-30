#ifndef __MEMORY_H__
#define __MEMORY_H__

#include <common.h>

enum MemoryType
{
    FreeMemory = 1,  // 可用内存 EfiConventionalMemory EfiBootServices(Code/Data) EfiLoader(Code/Data) EfiReservedMemoryType
    ReservedMemory,  // 保留(不可用) EfiRuntimeServices(Code/Data) EfiMemoryMappedIO EfiMemoryMappedIOPortSpace EfiPalCode
    APICMemory,      // APIC可回收内存 EfiACPIReclaimMemory
    APICMemoryNVS,   // APIC NVS内存  EfiACPIMemoryNVS
    UnuseableMemory, // 不可用的内存 EfiUnusableMemory 
    MaxMemoryType,   // (EfiMaxMemoryType)
};

struct MEMDESC
{
    MEMORY_ADDRESS AddrStart;      // 内存起始地址
    UINT64         MemoryPageSize; // 内存大小(以2MB页为单位)
    UINT64         MemoryByteSize; // 内存大小(以字节为单位)
    enum MemoryType Type;
};

#define MemoryDescriptorCnt 32 //正常情况下不超过32
extern struct MEMDESC MemoryDescriptor[MemoryDescriptorCnt];
extern int MemoryDescriptorNumber;

#define MaxSupportedMemorySize 256 //最大支持内存容量(单位:GB)目前为1TB
#define MemoryBitmapBytesLen ((MaxSupportedMemorySize * 512) / 8)
#define FreeMemoryStart 0x1000000

extern byte PhysicalMemoryBitmapBytes[MemoryBitmapBytesLen];
extern struct Bitmap PhysicalMemoryBitmap;
extern byte VirtualMemoryBitmapBytes[MemoryBitmapBytesLen];
extern struct Bitmap VirtualMemoryBitmap;
extern byte UserPhysicalMemoryBitmapBytes[MemoryBitmapBytesLen];
extern struct Bitmap UserPhysicalMemoryBitmap;

PUBLIC void init_memory();

#endif