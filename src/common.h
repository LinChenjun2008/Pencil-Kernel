#ifndef __KERNEL_COMMON_H__
#define __KERNEL_COMMON_H__

#include <Efi.h>
#include <stdint.h>

struct GraphicsInfo
{
    uint64_t FrameBufferBase;
    int      HorizontalResolution;
    int      VerticalResolution;
    struct
    {
        uint32_t    RedMask;
        uint32_t    GreenMask;
        uint32_t    BlueMask;
        uint32_t    ReservedMask;
    }PixelBitMask;
};

struct MemoryMap
{
    uint64_t MapSize;
    void*    Buffer;
    uint64_t MapKey;
    uint64_t DescriptorSize;
    uint32_t DescriptorVersion;
};

struct BootInfo
{
    uint64_t KernelBaseAddress; // 内核加载地址
    uint64_t TypefaceBase;      // 点阵字体加载地址
    uint64_t TrueTypeFontBase;  // TrueType字体加载地址
    uint64_t FreeAddrStart;     // 起始空闲内存地址
    uint64_t TotalMemorySize;   // 内存总大小 
    struct MemoryMap MemoryMap; // 内存描述符
    struct GraphicsInfo GraphicsInfo; // 图形信息
};

typedef struct
{
    uint8_t    Blue;
    uint8_t    Green;
    uint8_t    Red;
    uint8_t    Reserved;
} BltPixel;

#endif