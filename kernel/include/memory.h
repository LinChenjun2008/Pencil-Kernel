#ifndef __MEMORY_H__
#define __MEMORY_H__

#include <common.h>
#include <list.h>

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

struct MemoryBlock
{
    struct ListNode Free;
};

struct MemoryDesc
{
    UINTN BlockSize;
    UINTN Blocks;
    struct List FreeBlockList;
};

struct Zone
{
    struct MemoryDesc* Desc;
    UINTN Cnt;
    BOOL Large;
};

#define MaxAllocateSize 524288
#define NumberOfMemoryBlocks 13
extern struct MemoryDesc KernelMemoryBlock[NumberOfMemoryBlocks]; // 128,256,512,1024,2048,4096,8192,16384,32768,65536,131072 ,262144,524288

#define MemoryDescriptorCnt 32 //正常情况下不超过32
extern struct MEMDESC MemoryDescriptor[MemoryDescriptorCnt];
extern int MemoryDescriptorNumber;

#define MaxSupportedMemorySize 256 //最大支持内存容量(单位:GB)目前为256G
#define MemoryBitmapBytesLen ((MaxSupportedMemorySize * 512) / 8)
#define FreeMemoryStart 0x1000000

extern byte PhysicalMemoryBitmapBytes[MemoryBitmapBytesLen];
extern struct Bitmap PhysicalMemoryBitmap;
extern byte VirtualMemoryBitmapBytes[MemoryBitmapBytesLen];
extern struct Bitmap VirtualMemoryBitmap;
extern byte UserPhysicalMemoryBitmapBytes[MemoryBitmapBytesLen];
extern struct Bitmap UserPhysicalMemoryBitmap;

PUBLIC void init_memory();
/**
    @brief 分配指定页数
    @param NumberOfPages 要分配的内存页数
    @return 分配的内存页起始地址
**/
PUBLIC void* AllocatePage(UINTN NumberOfPages);

/**
    @brief 释放指定页数
    @param Addr 释放内存页的起始地址(对齐到2MB边界)
    @param NumberOfPages 要释放的内存页数
    @return 分配的内存页起始地址
**/
PUBLIC void FreePage(void* Addr,UINTN NumberOfPages);

PUBLIC void* kmalloc(UINTN Size);
PUBLIC void kfree(void* Addr);

#endif