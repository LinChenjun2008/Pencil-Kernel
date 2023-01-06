#ifndef __BASE_TYPE_H__
#define __BASE_TYPE_H__

#define NULL ((VOID*) 0)

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
struct SEGMDESC
{
    word limit_low;
    word base_low;
    byte base_mid;
    byte access_right;
    byte limit_high;
    byte base_high;
};

#define AR_G_4K 0x8000
#define AR_D_32 0x4000
#define AR_D_64 0x0000
#define AR_L 0x0000
#define AR_L_64 0x2000
#define AR_AVL 0x0000
#define AR_P 0x0080
#define AR_DPL_0 0x0000
#define AR_DPL_1 0x0020
#define AR_DPL_2 0x0040
#define AR_DPL_3 0x0060
#define AR_S_CODE 0x0010
#define AR_S_DATA 0x0010
#define AR_S_SYS 0x0000
#define AR_TYPE_CODE 0x0008 /* 可执行,非一致,不可读 */
#define AR_TYPE_DATA 0x0002 /* 不可执行,向上拓展,可写 */

#define AR_TYPE_TSS 0x0009

#define AR_CODE32      (AR_G_4K | AR_D_32 | AR_L | AR_AVL | AR_P | AR_DPL_0 | AR_S_CODE | AR_TYPE_CODE)
#define AR_CODE64      (AR_G_4K | AR_D_64 | AR_L_64 | AR_AVL | AR_P | AR_DPL_0 | AR_S_CODE | AR_TYPE_CODE)
#define AR_CODE32_DPL3 (AR_G_4K | AR_D_32 | AR_L | AR_AVL | AR_P | AR_DPL_3 | AR_S_CODE | AR_TYPE_CODE)
#define AR_DATA32      (AR_G_4K | AR_D_32 | AR_L | AR_AVL | AR_P | AR_DPL_0 | AR_S_DATA | AR_TYPE_DATA)
#define AR_DATA64      (AR_G_4K | AR_D_64 | AR_L_64 | AR_AVL | AR_P | AR_DPL_0 | AR_S_DATA | AR_TYPE_DATA)
#define AR_DATA32_DPL3 (AR_G_4K | AR_D_32 | AR_L | AR_AVL | AR_P | AR_DPL_3 | AR_S_DATA | AR_TYPE_DATA)
#define RPL0 0x0
#define RPL1 0x1
#define RPL2 0x2
#define RPL3 0x3
#define TI_GDT 0x0
#define TI_LDT 0x4

#define SelectorCode64_K     ((1 << 3) | TI_GDT | RPL0) /* 代码段 */
#define SelectorData64_K     ((2 << 3) | TI_GDT | RPL0) /* 数据段 */

#define SelectorTSS32        ((3 << 3) | TI_GDT | RPL0) /* TSS段 */

#define SelectorCode64_U     ((4 << 3) | TI_GDT | RPL3) /* 用户代码段 */
#define SelectorData64_U     ((5 << 3) | TI_GDT | RPL3) /* 用户数据段 */

#define SelectorCode32_K     ((7 << 3) | TI_GDT | RPL0) /* 代码段 */
#define SelectorData32_K     ((8 << 3) | TI_GDT | RPL0) /* 数据段 */

#define AR_DESC_32 0xe
#define AR_DESC_16 0x6

#define AR_IDT_DESC_DPL0 (AR_P | AR_DPL_0 | AR_DESC_32)
#define AR_IDT_DESC_DPL3 (AR_P | AR_DPL_3 | AR_DESC_32)

#define KERNEL_PAGE_DIR_TABLE_POS 0xe00000
#define KERNEL_VMA_BASE 0x0000000000000000

#define PG_SIZE 0x200000
#define PCB_SIZE (PG_SIZE * 1)

#define PG_P 0x1
#define PG_RW_R 0x0
#define PG_RW_W 0x2
#define PG_US_S 0x0
#define PG_US_U 0x4

/* TSS描述符属性 */
#define TSS_D_0 0
#define AR_TSS32 (AR_G_4K | TSS_D_0 | AR_L | AR_AVL | AR_P | AR_DPL_0 | AR_S_SYS | AR_TYPE_TSS)

#define EFLAGS_MBS (1 << 1)
#define EFLAGS_IF_1 (1 << 9)
#define EFLAGS_IF_0 (0 << 9)
#define EFLAGS_IOPL_0 (0 << 12)

#define PUBLIC
#define PRIVATE static

#define DIV_ROUND_UP(X ,STEP) (((X) + (STEP - 1)) / STEP)

#endif