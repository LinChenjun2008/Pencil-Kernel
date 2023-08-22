#ifndef __BASE_TYPE_H__
#define __BASE_TYPE_H__

#include <common.h>

#define NULL ((void*) 0)

typedef int bool;

#define TRUE  (1 == 1)
#define FALSE (1 == 0)

typedef unsigned long long int wordsize_t;

extern boot_info_t g_boot_info;

#define KERNEL_PAGE_DIR_TABLE_POS ((uintptr_t)0x5f9000)
#define KERNEL_VMA_BASE 0xffff800000000000

#define KADDR_P2V(ADDR) ((void*)((uintptr_t)(ADDR) |  KERNEL_VMA_BASE))
#define KADDR_V2P(ADDR) ((void*)((uintptr_t)(ADDR) & ~KERNEL_VMA_BASE))

#define PT_SIZE 0x1000
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
#define EFLAGS_IOPL_3 (3 << 12)

#define PUBLIC
#define PRIVATE static

#define ASMCALL __attribute__((sysv_abi))

#define DIV_ROUND_UP(X ,STEP) (((X) + (STEP - 1)) / STEP)

#define PADDR_AVAILABLE(ADDR) ((uintptr_t)ADDR <= 0x00007fffffffffff)

/** STATIC_ASSERT(CONDITION,MESSAGE) */
#define STATIC_ASSERT _Static_assert

#include <lib/symbol.h>
#include <desctrib.h>

PUBLIC segmdesc_t make_segmdesc(uint32_t base,uint32_t limit,uint16_t access);

#endif