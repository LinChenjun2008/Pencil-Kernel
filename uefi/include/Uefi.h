/*
* Uefi.h
*/

#ifndef __UEFI_H__
#define __UEFI_H__ 1

#include <Uefi/UefiBaseType.h>
#include <Uefi/UefiSpec.h>

#define EFI_SUCCESS     0
#define EFI_ERROR       0x8000000000000000
#define EFI_UNSUPPORTED (EFI_ERROR | 3)

typedef enum
{
    EfiResetCold,
    EfiResetWarm,
    EfiResetShutdown,
    EfiResetPlatformSpecific
} EFI_RESET_TYPE;

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
        EFI_ALLOCATE_PAGES AllocatePages;
        EFI_FREE_PAGES     FreePages;
        UINTN _buf3[3];

        // Event & Timer Services
        UINTN _buf4[2];
        EFI_STATUS (*WaitForEvent)
        (
            UINTN NumberOfEvents,
            VOID** Event,
            UINTN *Index
        );
        UINTN _buf4_2[3];

        // Protocol Handler Services
        UINTN _buf5[9];

        // Image Services
        UINTN _buf6[5];

        // Miscellaneous Services
        UINTN _buf7[2];
        EFI_STATUS (*SetWatchdogTimer)
        (
            UINTN Timeout,
            UINTN WatchdogCode,
            UINTN DataSize,
            UINT16 *WatchdogData
        );

        // DriverSupport Services
        UINTN _buf8[2];

        // Open and Close Protocol Services
        UINTN _buf9[3];

        // Library Services
        UINTN _buf10[2];
        EFI_STATUS (*LocateProtocol)
        (
            GUID *Protocol,
            VOID *Registration,
            VOID **Interface
        );
            UINTN _buf_10_2[2];
        // 32-bit CRC Services
        UINTN _buf11;

        // Miscellaneous Services
        UINTN _buf12[3];
} EFI_BOOT_SERVICES;

/* 系统表 */
typedef struct
{
    UINT8 _buf[44]; // 占位
    EFI_SIMPLE_TEXT_INPUT_PROTOCOL*  ConIn;
    UINT64 _buf2;
    EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL* ConOut;
    UINT64 _buf3;
    EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL* StdErr;
    EFI_RUNTIME_SERVICES*            RuntimeServices;
    EFI_BOOT_SERVICES* BootServices;
} EFI_SYSTEM_TABLE;

#endif