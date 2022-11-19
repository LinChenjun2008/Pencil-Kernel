#ifndef __KERNEL_COMMON_H__
#define __KERNEL_COMMON_H__

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
    uint64_t KernelBaseAddress;
    uint64_t TypefaceBase;
    struct MemoryMap MemoryMap;
    struct GraphicsInfo GraphicsInfo;
};

typedef struct
{
    uint8_t    Blue;
    uint8_t    Green;
    uint8_t    Red;
    uint8_t    Reserved;
} BltPixel;

#endif