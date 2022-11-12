#ifndef __BASE_TYPE_H__
#define __BASE_TYPE_H__

#define NULL ((VOID*) 0)

#define TRUE  (1 == 1)
#define FALSE (1 == 0)

typedef signed char          INT8;
typedef signed short         INT16;
typedef signed int           INT32;
typedef signed long long int INT64;

typedef unsigned char          UINT8;
typedef unsigned short         UINT16;
typedef unsigned int           UINT32;
typedef unsigned long long int UINT64;

typedef unsigned char  CHAR8;
typedef unsigned short CHAR16;

typedef UINT64 UINTN;
typedef INT64  INTN;

struct BootInfo
{
    struct
    {
        UINTN FrameBufferBase;
        UINTN HorizontalResolution;
        UINTN VerticalResolution;
    }GraphicInfo;
};

#endif