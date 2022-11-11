#ifndef __KERNEL_COMMON_H__
#define __KERNEL_COMMON_H__

#include <stdint.h>

struct BootInfo
{
    uint64_t KernelBaseAddress;
    struct
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
    }GraphicsInfo;
};

typedef struct
{
    uint8_t    Blue;
    uint8_t    Green;
    uint8_t    Red;
    uint8_t    Reserved;
} BltPixel;

#endif