#include <Efi.h>

#include "video.h"

extern EFI_GRAPHICS_OUTPUT_PROTOCOL*    Gop;

UINTN abs(INTN a)
{
    return (a < 0 ) ? -a : a;
}

void SetVideoMode(int x,int y)
{
    UINTN SizeOfInfo = 0;
    EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *Info;
    UINTN i;
    int Mode = 0;
    UINTN sub = 0xffffffff;
    for(i = 0;i < Gop->Mode->MaxMode;i++)
    {
        Gop->QueryMode(Gop,i,&SizeOfInfo,&Info);
        if(abs(x - Info->HorizontalResolution) + abs(y -Info->VerticalResolution) < sub)
        {
            sub = abs(x - Info->HorizontalResolution) + abs(y - Info->VerticalResolution);
            Mode = i;
        }
    }
    Gop->SetMode(Gop,Mode);
}

void draw_pixel(UINTN x, UINTN y,EFI_GRAPHICS_OUTPUT_BLT_PIXEL* color)
{
    unsigned int hr = Gop->Mode->Info->HorizontalResolution;
    EFI_GRAPHICS_OUTPUT_BLT_PIXEL *base = (EFI_GRAPHICS_OUTPUT_BLT_PIXEL *)Gop->Mode->FrameBufferBase;
    EFI_GRAPHICS_OUTPUT_BLT_PIXEL *p = base + (hr * y) + x;

    p->Blue = color->Blue;
    p->Green = color->Green;
    p->Red = color->Red;
    p->Reserved = color->Reserved;
}

void draw_rect(Rectangle* rectangle, EFI_GRAPHICS_OUTPUT_BLT_PIXEL* color)
{
    UINTN x,y;
    for(y = rectangle->y;y < (rectangle->y + rectangle->h);y++)
    {
        for(x = rectangle->x;x < (rectangle->x + rectangle->w);x++)
        {
            draw_pixel(x,y,color);
        }
    }
}