#ifndef __DESCTRIB_H__
#define __DESCTRIB_H__

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
#define AR_DATA32      (AR_G_4K | AR_D_32 | AR_L | AR_AVL | AR_P | AR_DPL_0 | AR_S_DATA | AR_TYPE_DATA)

#define AR_CODE64      (AR_G_4K | AR_D_64 | AR_L_64 | AR_AVL | AR_P | AR_DPL_0 | AR_S_CODE | AR_TYPE_CODE)
#define AR_CODE64_DPL3 (AR_G_4K | AR_D_64 | AR_L_64 | AR_AVL | AR_P | AR_DPL_3 | AR_S_CODE | AR_TYPE_CODE)
#define AR_DATA64      (AR_G_4K | AR_D_64 | AR_L_64 | AR_AVL | AR_P | AR_DPL_0 | AR_S_DATA | AR_TYPE_DATA)
#define AR_DATA64_DPL3 (AR_G_4K | AR_D_64 | AR_L_64 | AR_AVL | AR_P | AR_DPL_3 | AR_S_DATA | AR_TYPE_DATA)

#define RPL0 0x0
#define RPL1 0x1
#define RPL2 0x2
#define RPL3 0x3
#define TI_GDT 0x0
#define TI_LDT 0x4

#define SELECTOR_CODE64_K     ((1 << 3) | TI_GDT | RPL0) /* 代码段 */
#define SELECTOR_DATA64_K     ((2 << 3) | TI_GDT | RPL0) /* 数据段 */

#define SELECTOR_TSS          ((9 << 3) | TI_GDT | RPL0) /* TSS段 */

#define SELECTOR_CODE64_U     ((3 << 3) | TI_GDT | RPL3) /* 用户代码段 */
#define SELECTOR_DATA64_U     ((4 << 3) | TI_GDT | RPL3) /* 用户数据段 */

#define SELECTOR_CODE32_K     ((7 << 3) | TI_GDT | RPL0) /* 代码段 */
#define SELECTOR_DATA32_K     ((8 << 3) | TI_GDT | RPL0) /* 数据段 */

#define AR_DESC_32 0xe
#define AR_DESC_16 0x6

#define AR_IDT_DESC_DPL0 (AR_P | AR_DPL_0 | AR_DESC_32)
#define AR_IDT_DESC_DPL3 (AR_P | AR_DPL_3 | AR_DESC_32)

typedef struct
{
    uint16_t limit_low;    //0-15 limit1
    uint16_t base_low;     // 16 - 31 base0
    uint8_t  base_mid;     // 32 - 39 base1
    uint8_t  access_right; // 40 - 47 flag descType privilege isVaild
    uint8_t  limit_high;   // 48 - 55 limit1 usused
    uint8_t  base_high;    // 56 - 63 base2
} segmdesc_t;

extern segmdesc_t gdt_table[17];

#include <stdint.h>

segmdesc_t make_segmdesc(uint32_t base,uint32_t limit,uint16_t access);

#endif