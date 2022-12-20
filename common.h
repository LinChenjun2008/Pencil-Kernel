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

typedef struct
{
    int flage; /* 1 - file | 0 - none */
    CHAR16 NAME[32];
    EFI_PHYSICAL_ADDRESS FileBufferAddress;
    int Attribute;
}FileDesc;

struct BootInfo
{
    uint64_t KernelBaseAddress;
    uint64_t TypefaceBase;
    struct MemoryMap MemoryMap;
    struct GraphicsInfo GraphicsInfo;
    FileDesc FileDesc[32];
};

typedef struct
{
    uint8_t    Blue;
    uint8_t    Green;
    uint8_t    Red;
    uint8_t    Reserved;
} BltPixel;

#endif