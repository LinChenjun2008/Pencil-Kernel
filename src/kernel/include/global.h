#ifndef __BASE_TYPE_H__
#define __BASE_TYPE_H__

#define NULL ((void*) 0)

typedef int BOOL;

#define TRUE  (1 == 1)
#define FALSE (1 == 0)

typedef signed char          INT8;
typedef signed short         INT16;
typedef signed int           INT32;
typedef signed long long int INT64;
typedef signed __int128      INT128;

typedef unsigned char          UINT8;
typedef unsigned short         UINT16;
typedef unsigned int           UINT32;
typedef unsigned long long int UINT64;
typedef unsigned __int128      UINT128;

typedef unsigned char  CHAR8;
typedef unsigned short CHAR16;

typedef UINT64 UINTN;
typedef INT64  INTN;

typedef UINT64 MEMORY_ADDRESS;
typedef UINT64 PHYSICAL_ADDRESS;
typedef UINT64 VIRTUAL_ADDRESS;

typedef UINT8  byte;
typedef UINT16 word;
typedef UINT32 dword;
typedef UINT64 qword;

extern struct BootInfo gBI;

/* gdt描述符 */
#include <desctrib.h>

#define KERNEL_PAGE_DIR_TABLE_POS ((MEMORY_ADDRESS)0x5f9000)
#define KERNEL_VMA_BASE 0xffff800000000000

#define kAddrV2P(Addr) ((MEMORY_ADDRESS)Addr - KERNEL_VMA_BASE)
#define kAddrP2V(Addr) ((MEMORY_ADDRESS)Addr + KERNEL_VMA_BASE)

#define PG_SIZE 0x200000

#define PG_P       0b00000001
#define PG_RW_R    0b00000000
#define PG_RW_W    0b00000010
#define PG_US_S    0b00000000
#define PG_US_U    0b00000100
#define PG_SIZE_2M 0b10000000

/* TSS描述符属性 */
#define TSS_D_0 0
#define AR_TSS32 (AR_G_4K | TSS_D_0 | AR_L | AR_AVL | AR_P | AR_DPL_0 | AR_S_SYS | AR_TYPE_TSS)

#define EFLAGS_MBS    (1 << 1)
#define EFLAGS_IF_1   (1 << 9)
#define EFLAGS_IF_0   (0 << 9)
#define EFLAGS_IOPL_0 (0 << 12)

#define PUBLIC
#define PRIVATE static

#define ASMCALL __attribute__((sysv_abi))

#define DIV_ROUND_UP(X ,STEP) (((X) + (STEP - 1)) / STEP)

/** STATIC_ASSERT(CONDITION,MESSAGE) */
#define STATIC_ASSERT _Static_assert

#include <symbol.h>

#endif