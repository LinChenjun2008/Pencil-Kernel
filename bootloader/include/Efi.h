#ifndef _EFI_H_
#define _EFI_H_

#define CONST  const
#define STATIC static

#define VOID   void

#ifdef EFIAPI
    #elif defined (_MSC_EXTENSIONS)
        #define EFIAPI  __cdecl
    #elif defined (__GNUC__)
        #define EFIAPI
    #else
        #define EFIAPI
#endif

#define IN
#define OUT

#define NULL ((VOID*) 0)

#define TRUE  (1 == 1)
#define FALSE (1 == 0)

//*******************************************************
// Attributes
//*******************************************************
#define EFI_BLACK        0x00
#define EFI_BLUE         0x01
#define EFI_GREEN        0x02
#define EFI_CYAN         0x03
#define EFI_RED          0x04
#define EFI_MAGENTA      0x05
#define EFI_BROWN        0x06
#define EFI_LIGHTGRAY    0x07
#define EFI_BRIGHT       0x08
#define EFI_DARKGRAY     0x08
#define EFI_LIGHTBLUE    0x09
#define EFI_LIGHTGREEN   0x0A
#define EFI_LIGHTCYAN    0x0B
#define EFI_LIGHTRED     0x0C
#define EFI_LIGHTMAGENTA 0x0D
#define EFI_YELLOW       0x0E
#define EFI_WHITE        0x0F

#define EFI_BACKGROUND_BLACK     0x00
#define EFI_BACKGROUND_BLUE      0x10
#define EFI_BACKGROUND_GREEN     0x20
#define EFI_BACKGROUND_CYAN      0x30
#define EFI_BACKGROUND_RED       0x40
#define EFI_BACKGROUND_MAGENTA   0x50
#define EFI_BACKGROUND_BROWN     0x60
#define EFI_BACKGROUND_LIGHTGRAY 0x70

#define EFI_OPEN_PROTOCOL_BY_HANDLE_PROTOCOL  0x00000001
#define EFI_OPEN_PROTOCOL_GET_PROTOCOL        0x00000002
#define EFI_OPEN_PROTOCOL_TEST_PROTOCOL       0x00000004
#define EFI_OPEN_PROTOCOL_BY_CHILD_CONTROLLER 0x00000008
#define EFI_OPEN_PROTOCOL_BY_DRIVER           0x00000010
#define EFI_OPEN_PROTOCOL_EXCLUSIVE           0x00000020

#define EVT_TIMER                         0x80000000
#define EVT_RUNTIME                       0x40000000
#define EVT_NOTIFY_WAIT                   0x00000100
#define EVT_NOTIFY_SIGNAL                 0x00000200
#define EVT_SIGNAL_EXIT_BOOT_SERVICES     0x00000201
#define EVT_SIGNAL_VIRTUAL_ADDRESS_CHANGE 0x60000202

#define TPL_APPLICATION 4
#define TPL_CALLBACK    8
#define TPL_NOTIFY      16
#define TPL_HIGH_LEVEL  31

/*************************************************
* 基本类型
*************************************************/

typedef signed char          INT8;
typedef signed short         INT16;
typedef signed int           INT32;
typedef signed long long int INT64;

typedef unsigned char          BOOLEN;
typedef unsigned char          UINT8;
typedef unsigned short         UINT16;
typedef unsigned int           UINT32;
typedef unsigned long long int UINT64;

typedef unsigned char  CHAR8;
typedef unsigned short CHAR16;

/* UINTN 和 INTN
* 32 位 CPU -> 32 bit
* 64 位 CPU -> 64 bit
*/
typedef UINT64 UINTN;
typedef INT64  INTN;

typedef UINTN RETURN_STATUS;

#define RETURN_ERROR(StatusCode)  (((INTN)(RETURN_STATUS)(StatusCode)) < 0)
#define EFI_ERROR(A)  RETURN_ERROR(A)

#define EFI_SUCCESS     0
#define EFI_ERR         0x8000000000000000
#define EFI_UNSUPPORTED (EFI_ERR | 3)

typedef struct
{
    UINT32 Data1;
    UINT16 Data2;
    UINT16 Data3;
    UINT8  Data4[8];
} GUID;

typedef GUID EFI_GUID;

typedef UINTN EFI_STATUS;

typedef VOID* EFI_HANDLE;

typedef VOID* EFI_EVENT;

typedef UINT64 EFI_PHYSICAL_ADDRESS;
typedef UINT64 EFI_VIRTUAL_ADDRESS;

typedef struct
{
    UINT16 Year;       /* 1900 - 9999       */
    UINT8  Month;      /*    1 - 12         */
    UINT8  Day;        /*    1 - 31         */
    UINT8  Hour;       /*    0 - 23         */
    UINT8  Minute;     /*    0 - 59         */
    UINT8  Second;     /*    0 - 59         */
    UINT8  Pad1;
    UINT32 Nanosecond; /*    0 - 999,999,999*/
    INT16  TimeZone;
    UINT8  Daylight;
    UINT8  Pad2;
} EFI_TIME;

typedef struct
{
    CHAR16 ScanCode;
    UINT16 UnicodeChar;
} EFI_INPUT_KEY;

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
    EfiMaxMemoryType
} EFI_MEMORY_TYPE;

typedef enum
{
    EfiResetCold,
    EfiResetWarm,
    EfiResetShutdown,
    EfiResetPlatformSpecific
} EFI_RESET_TYPE;






/**************************************************
* SimpleTextIn                                    *
***************************************************/

#define SCAN_NULL       0x0000
#define SCAN_UP         0x0001
#define SCAN_DOWN       0x0002
#define SCAN_RIGHT      0x0003
#define SCAN_LEFT       0x0004
#define SCAN_HOME       0x0005
#define SCAN_END        0x0006
#define SCAN_INSERT     0x0007
#define SCAN_DELETE     0x0008
#define SCAN_PAGE_UP    0x0009
#define SCAN_PAGE_DOWN  0x000A
#define SCAN_F1         0x000B
#define SCAN_F2         0x000C
#define SCAN_F3         0x000D
#define SCAN_F4         0x000E
#define SCAN_F5         0x000F
#define SCAN_F6         0x0010
#define SCAN_F7         0x0011
#define SCAN_F8         0x0012
#define SCAN_F9         0x0013
#define SCAN_F10        0x0014
#define SCAN_ESC        0x0017

typedef struct _EFI_SIMPLE_TEXT_INPUT_PROTOCOL EFI_SIMPLE_TEXT_INPUT_PROTOCOL;

typedef
EFI_STATUS
(EFIAPI *EFI_INPUT_READ_KEY)
(
    EFI_SIMPLE_TEXT_INPUT_PROTOCOL *This,
    EFI_INPUT_KEY                  *Key
);

struct _EFI_SIMPLE_TEXT_INPUT_PROTOCOL
{
    UINTN _buf;
    EFI_INPUT_READ_KEY ReadKeyStroke;
    EFI_EVENT          WaitForKey;
};





/**************************************************
* SimpleTextOut                                   *
***************************************************/

typedef struct _EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL;

typedef
EFI_STATUS
(EFIAPI *EFI_TEXT_STRING)
(
    EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL *This,
    CHAR16                          *String
);

typedef
EFI_STATUS
(EFIAPI *EFI_TEXT_TEST_STRING)
(
    EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL *This,
    CHAR16                          *String
);

typedef
EFI_STATUS
(EFIAPI *EFI_TEXT_QUERY_MODE)
(
    EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL *This,
    UINTN                            ModeNumber,
    UINTN                           *Columns,
    UINTN                           *Rows
);

typedef
EFI_STATUS
(EFIAPI *EFI_TEXT_SET_MODE)
(
    EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL *This,
    UINTN                            ModeNumber
);

typedef
EFI_STATUS
(EFIAPI *EFI_TEXT_SET_ATTRIBUTE)
(
    EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL *This,
    UINTN                            Attribute
);

typedef
EFI_STATUS
(EFIAPI *EFI_TEXT_CLEAR_SCREEN)
(
    EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL *This
);

typedef struct
{
    INT32  MaxMode;
    INT32  Mode;
    INT32  Attribute;
    INT32  CursorColumn;
    INT32  CursorRow;
    BOOLEN CursorVisible;
} SIMPLE_TEXT_OUTPUT_MODE;

struct _EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL
{
    UINTN _buf;
    EFI_TEXT_STRING          OutputString;
    EFI_TEXT_TEST_STRING     TestString;
    EFI_TEXT_QUERY_MODE      QueryMode;
    EFI_TEXT_SET_MODE        SetMode;
    EFI_TEXT_SET_ATTRIBUTE   SetAttribute;
    EFI_TEXT_CLEAR_SCREEN    ClearScreen;
    UINTN _buf4[2];
    SIMPLE_TEXT_OUTPUT_MODE *Mode;
};

/**************************************************
* SystemTable                                     *
***************************************************/

typedef enum
{
    AllocateAnyPages,
    AllocateMaxAddress,
    AllocateAddress,
    MaxAllocateType,
} EFI_ALLOCATE_TYPE;

typedef struct
{
    UINT32                  Type;
    EFI_PHYSICAL_ADDRESS    PhysicalStart;
    EFI_VIRTUAL_ADDRESS     VirtualStart;
    UINT64                  NumberOfPages;
    UINT64                  Attribute;
} __attribute__((aligned(16))) EFI_MEMORY_DESCRIPTOR;

typedef
EFI_STATUS
(EFIAPI *EFI_ALLOCATE_PAGES)
(
    EFI_ALLOCATE_TYPE     Type,
    EFI_MEMORY_TYPE       MemoryType,
    UINTN                 Pages,
    EFI_PHYSICAL_ADDRESS* Memory
);

typedef
EFI_STATUS
(EFIAPI *EFI_FREE_PAGES)
(
    EFI_PHYSICAL_ADDRESS Memory,
    UINTN                Pages
);

typedef
EFI_STATUS
(EFIAPI *EFI_GET_MEMORY_MAP)
(
    UINTN                 *MemoryMapSize,
    EFI_MEMORY_DESCRIPTOR *MemoryMap,
    UINTN                 *MapKey,
    UINTN                 *DescriptorSize,
    UINT32                *DescriptorVersion
);

typedef
EFI_STATUS
(EFIAPI *EFI_ALLOCATE_POOL)
(
  IN  EFI_MEMORY_TYPE   PoolType,
  IN  UINTN             Size,
  OUT VOID            **Buffer
);

typedef
EFI_STATUS
(EFIAPI *EFI_FREE_POOL)
(
  IN  VOID *Buffer
);

typedef
EFI_STATUS
(EFIAPI *EFI_WAIT_FOR_EVENT)
(
    UINTN  NumberOfEvents,
    VOID **Event,
    UINTN *Index
);

typedef
EFI_STATUS
(EFIAPI *EFI_EXIT_BOOT_SERVICES)
(
    EFI_HANDLE ImageHandle,
    UINTN      MapKey
  );


typedef
EFI_STATUS
(EFIAPI *EFI_SET_WATCHDOG_TIMER)
(
    UINTN   Timeout,
    UINTN   WatchdogCode,
    UINTN   DataSize,
    UINT16 *WatchdogData
);

typedef
EFI_STATUS
(EFIAPI *EFI_OPEN_PROTOCOL)
(
    EFI_HANDLE   Handle,
    EFI_GUID    *Protocol,
    VOID      **Interface,
    EFI_HANDLE   AgentHandle,
    EFI_HANDLE   ControllerHandle,
    UINT32      Attributes
);

typedef enum
{
  AllHandles,
  ByRegisterNotify,
  ByProtocol
} EFI_LOCATE_SEARCH_TYPE;

typedef
EFI_STATUS
(EFIAPI *EFI_LOCATE_HANDLE_BUFFER)
(
    EFI_LOCATE_SEARCH_TYPE SearchType,
    EFI_GUID              *Protocol,
    VOID                  *SearchKey,
    UINTN                 *NoHandles,
   EFI_HANDLE            **Buffer
);

typedef
EFI_STATUS
(EFIAPI *EFI_LOCATE_PROTOCOL)
(
    EFI_GUID *Protocol,
    VOID     *Registration,
    VOID    **Interface
  );

typedef struct
{
    UINT8 _buf_rs1[24];

    //
    // Time Services
    //
    UINTN _buf_rs2[4];

    //
    // Virtual Memory Services
    //
    UINTN _buf_rs3[2];

    //
    // Variable Services
    //
    UINTN _buf_rs4[3];

    //
    // Miscellaneous Services
    //
    UINTN _buf_rs5;
    void (*ResetSystem)
    (
        EFI_RESET_TYPE ResetType,
        UINTN ResetStatus,
        UINTN DataSize,
        VOID* ResetData
    );
} EFI_RUNTIME_SERVICES;

typedef struct
{
        char _buf1[24];

        // Task Priority Services
        UINTN _buf2[2];

        // Memory Services
        EFI_ALLOCATE_PAGES       AllocatePages;
        EFI_FREE_PAGES           FreePages;
        EFI_GET_MEMORY_MAP       GetMemoryMap;
        EFI_ALLOCATE_POOL        AllocatePool;
        EFI_FREE_POOL            FreePool;

        // Event & Timer Services
        UINTN _buf4[2];
        EFI_WAIT_FOR_EVENT       WaitForEvent;
        UINTN _buf4_2[3];

        // Protocol Handler Services
        UINTN _buf5[9];

        // Image Services
        UINTN _buf6[4];
        EFI_EXIT_BOOT_SERVICES   ExitBootServices;
        // Miscellaneous Services
        UINTN _buf7[2];
        EFI_SET_WATCHDOG_TIMER   SetWatchdogTimer;

        // DriverSupport Services
        UINTN _buf8[2];

        // Open and Close Protocol Services

        EFI_OPEN_PROTOCOL        OpenProtocol;
        UINTN _buf9[2];

        // Library Services
        UINTN _buf10[1];
        EFI_LOCATE_HANDLE_BUFFER LocateHandleBuffer;
        EFI_LOCATE_PROTOCOL      LocateProtocol;
        UINTN _buf_10_2[2];
        // 32-bit CRC Services
        UINTN _buf11;

        // Miscellaneous Services
        UINTN _buf12[3];
} EFI_BOOT_SERVICES;

typedef struct
{
    UINT8 _buf1[44];
    EFI_SIMPLE_TEXT_INPUT_PROTOCOL  *ConIn;
    UINTN _buf2;
    EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL *ConOut;
    unsigned long long _buf3[2];
    EFI_RUNTIME_SERVICES            *RuntimeServices;
    EFI_BOOT_SERVICES               *BootServices;
} EFI_SYSTEM_TABLE;





/**************************************************
* GraphicsOutput                                  *
***************************************************/

#define EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID \
{ \
    0x9042a9de, 0x23dc, 0x4a38, \
    {0x96, 0xfb, 0x7a, 0xde, 0xd0, 0x80, 0x51, 0x6a } \
}

typedef struct _EFI_GRAPHICS_OUTPUT_PROTOCOL EFI_GRAPHICS_OUTPUT_PROTOCOL;

typedef struct
{
  UINT32    RedMask;
  UINT32    GreenMask;
  UINT32    BlueMask;
  UINT32    ReservedMask;
} EFI_PIXEL_BITMASK;

typedef struct
{
  UINT8    Blue;
  UINT8    Green;
  UINT8    Red;
  UINT8    Reserved;
} EFI_GRAPHICS_OUTPUT_BLT_PIXEL;

typedef enum
{
    PixelRedGreenBlueReserved8BitPerColor,
    PixelBlueGreenRedReserved8BitPerColor,
    PixelBitMask,
    PixelBltOnly,
    PixelFormatMax
}  EFI_GRAPHICS_PIXEL_FORMAT;

typedef struct
{
    UINT32                    Version;
    UINT32                    HorizontalResolution;
    UINT32                    VerticalResolution;
    EFI_GRAPHICS_PIXEL_FORMAT PixelFormat;
    EFI_PIXEL_BITMASK         PixelInformation;
    UINT32                    PixelsPerScanLine;
}  EFI_GRAPHICS_OUTPUT_MODE_INFORMATION;

typedef struct
{
    UINT32                                MaxMode;
    UINT32                                Mode;
    EFI_GRAPHICS_OUTPUT_MODE_INFORMATION *Info;
    UINTN                                 SizeOfInfo;
    EFI_PHYSICAL_ADDRESS                  FrameBufferBase;
    UINTN                                 FrameBufferSize;
} EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE;

typedef
EFI_STATUS
(EFIAPI *EFI_GRAPHICS_OUTPUT_PROTOCOL_QUERY_MODE)
(
    EFI_GRAPHICS_OUTPUT_PROTOCOL          *This,
    UINT32                                 ModeNumber,
    UINTN                                 *SizeOfInfo,
    EFI_GRAPHICS_OUTPUT_MODE_INFORMATION **Info
);

typedef
EFI_STATUS
(EFIAPI *EFI_GRAPHICS_OUTPUT_PROTOCOL_SET_MODE)
(
    EFI_GRAPHICS_OUTPUT_PROTOCOL *This,
    UINT32                        ModeNumber
);

struct _EFI_GRAPHICS_OUTPUT_PROTOCOL
{
    EFI_GRAPHICS_OUTPUT_PROTOCOL_QUERY_MODE QueryMode;
    EFI_GRAPHICS_OUTPUT_PROTOCOL_SET_MODE   SetMode;
    UINTN _buf[1];
    EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE  *Mode;
};






/**************************************************
* GraphicsOutput                                  *
***************************************************/
#define EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID \
{ \
    0x964e5b22, 0x6459, 0x11d2, \
    {0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b } \
}

#define EFI_FILE_INFO_ID \
{ \
    0x9576e92, 0x6d3f, 0x11d2, \
    {0x8e, 0x39, 0x0, 0xa0, 0xc9, 0x69, 0x72, 0x3b } \
}

#define EFI_FILE_MODE_READ      0x0000000000000001
#define EFI_FILE_MODE_WRITE     0x0000000000000002
#define EFI_FILE_MODE_CREATE    0x8000000000000000

typedef struct
{
  UINT64      Size;             /* 这是FileInfo的大小(包括FileName) */
  UINT64      FileSize;         /* 文件大小(单位:byet) */
  UINT64      PhysicalSize;     /* 文件在文件系统上所占用的物理空间大小 */

  EFI_TIME    CreateTime;       /* 文件创建时间 */
  EFI_TIME    LastAccessTime;   /* 文件最后一次访问时间 */
  EFI_TIME    ModificationTime; /* 文件最后一次修改时间 */

  UINT64      Attribute;        /* 文件属性 */

  CHAR16      FileName[1];      /* 文件名 */
} EFI_FILE_INFO;

extern EFI_GUID  gEfiSimpleFileSystemProtocolGuid;
extern EFI_GUID  gEfiFileInfoGuid;

typedef struct _EFI_FILE_PROTOCOL EFI_FILE_PROTOCOL;
typedef struct _EFI_SIMPLE_FILE_SYSTEM_PROTOCOL EFI_SIMPLE_FILE_SYSTEM_PROTOCOL;

typedef
EFI_STATUS
(EFIAPI *EFI_FILE_OPEN)
(
    EFI_FILE_PROTOCOL  *This,
    EFI_FILE_PROTOCOL **NewHandle, /* 被打开的文件handle */
    CHAR16             *FileName,  /* 文件名 */
    UINTN               OpenMode,  /* 打开文件的模式,支持:
                                    * READ(只读),
                                    * READ | WRITE(读写),
                                    * READ | WRITE | CREAT(读写,不存在则创建) 三种
                                    */
    UINTN               Attributes /* 文件属性(新建文件时) */
);

typedef
EFI_STATUS
(EFIAPI *EFI_FILE_CLOSE)
(
    EFI_FILE_PROTOCOL* This
);

typedef
EFI_STATUS
(EFIAPI *EFI_FILE_READ)
(
    EFI_FILE_PROTOCOL *This,
    UINTN             *BufferSize,
    VOID              *Buffer
);

typedef
EFI_STATUS
(EFIAPI *EFI_FILE_WRITE)
(
    EFI_FILE_PROTOCOL *This,
    UINTN             *BufferSize,
    VOID              *Buffer
);

typedef
EFI_STATUS
(EFIAPI *EFI_FILE_GET_INFO)
(
    EFI_FILE_PROTOCOL *This,
    EFI_GUID          *InformationType,
    UINTN             *BufferSize,
    VOID              *Buffer
);

struct _EFI_FILE_PROTOCOL
{
    UINT64 _buf;
    EFI_FILE_OPEN    Open;
    EFI_FILE_CLOSE   Close;
    UINTN _buf2; // Delet
    EFI_FILE_READ     Read;
    EFI_FILE_WRITE    Write;
    UINTN _buf3[2]; //GetPosition SetPosition
    EFI_FILE_GET_INFO GetInfo;
    UINTN _buf3_2[2];// SetInfo Flush
    UINTN _buf4[4]; //OpenEx ReadEx WriteEx FlushEx
};

typedef
EFI_STATUS
(EFIAPI *EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_OPEN_VOLUME)
(
    EFI_SIMPLE_FILE_SYSTEM_PROTOCOL *This,
    EFI_FILE_PROTOCOL              **Root
);

struct _EFI_SIMPLE_FILE_SYSTEM_PROTOCOL
{
    UINTN                                       Revision;
    EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_OPEN_VOLUME OpenVolume;
};

extern EFI_HANDLE                         gImageHandle;
extern EFI_SYSTEM_TABLE                   *gST;
extern EFI_BOOT_SERVICES                  *gBS;
extern EFI_GRAPHICS_OUTPUT_PROTOCOL       *Gop;
extern EFI_SIMPLE_FILE_SYSTEM_PROTOCOL    *gSFSP;

extern EFI_GUID  gEfiSimpleTextOutProtocolGuid;

#endif