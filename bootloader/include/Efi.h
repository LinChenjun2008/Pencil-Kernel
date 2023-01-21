#ifndef _EFI_H_
#define _EFI_H_

#define CONST  const
#define STATIC static

#define VOID   void

#ifdef EFIAPI
    #elif defined (_MSC_EXTENSIONS)
        #define EFIAPI  __cdecl
    #elif defined (__GNUC__)
        #define EFIAPI __attribute__((ms_abi))
    #else
        #define EFIAPI
#endif

#define IN
#define OUT

#define NULL ((void*) 0)

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

#include <Procotol/SimpleTextIn.h>
#include <Procotol/SimpleTextOut.h>

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

typedef
EFI_STATUS
(EFIAPI *EFI_CLOSE_PROTOCOL)
(
    EFI_HANDLE Handle,
    EFI_GUID  *Protocol,
    EFI_HANDLE AgentHandle,
    EFI_HANDLE ControllerHandle
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
        EFI_CLOSE_PROTOCOL       CloseProtocol;
        UINTN _buf9[1];

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
    EFI_GUID  VendorGuid;
    VOID     *VendorTable;
} EFI_CONFIGURATION_TABLE;

typedef struct
{
    UINT8 _buf1[44];
    EFI_SIMPLE_TEXT_INPUT_PROTOCOL  *ConIn;
    UINTN _buf2;
    EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL *ConOut;
    unsigned long long _buf3[2];
    EFI_RUNTIME_SERVICES            *RuntimeServices;
    EFI_BOOT_SERVICES               *BootServices;
    UINTN                            NumberOfTableEntrties;
    EFI_CONFIGURATION_TABLE         *ConfigurationTable;
} EFI_SYSTEM_TABLE;

#include <Procotol/GraphicsOutput.h>
#include <Procotol/SimpleFileSystem.h>

extern EFI_HANDLE                         gImageHandle;
extern EFI_SYSTEM_TABLE                   *gST;
extern EFI_BOOT_SERVICES                  *gBS;

#endif