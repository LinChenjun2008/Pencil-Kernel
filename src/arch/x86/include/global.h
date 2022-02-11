#ifndef __GLOBAL_H_
#define __GLOBAL_H_

#include "stdint.h"

/* 和boot.inc中一样的数据 */
#define AR_G_4K 0x8000
#define AR_D_32 0x4000
#define AR_L 0x0000
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

#define AR_CODE32 (AR_G_4K | AR_D_32 | AR_L | AR_AVL | AR_P | AR_DPL_0 | AR_S_CODE | AR_TYPE_CODE)
#define AR_DATA32 (AR_G_4K | AR_D_32 | AR_L | AR_AVL | AR_P | AR_DPL_0 | AR_S_DATA | AR_TYPE_DATA)

#define RPL0 0x0
#define RPL1 0x1
#define RPL2 0x2
#define RPL3 0x3
#define TI_GDT 0x0
#define TI_LDT 0x4

#define SelectorCode32     ((1 << 3) | TI_GDT | RPL0)
#define SelectorData32     ((2 << 3) | TI_GDT | RPL0)
#define SelectorVideo      ((3 << 3) | TI_GDT | RPL0)
#define SelectorColorVideo ((4 << 3) | TI_GDT | RPL0)

#define AR_DESC_32 0xe
#define AR_DESC_16 0x6

#define AR_IDT_DESC_DPL0 (AR_P | AR_DPL_0 | AR_DESC_32)
#define AR_IDT_DESC_DPL3 (AR_P | AR_DPL_3 | AR_DESC_32)

#define PG_SIZE 4096

#define PG_P 0x1
#define PG_RW_R 0x0
#define PG_RW_W 0x2
#define PG_US_S 0x0
#define PG_US_U 0x4


#define LoaderBaseAddress 0x1000  /* loader加载到0x1000地址处 */
#define LoaderOffsetAddress 0x500 /* loader前0x4ff字节是数据,代码正式开始是0x500字节 */

/* loader向内核传递的参数的地址
*/

#define TotalMem_l (*((uint32_t*)(0x7c00 + 0x000)))
#define TotalMem_h (*((uint32_t*)(0x7c00 + 0x004)))
#define DiskNum    (*((uint32_t*)(0x7c00 + 0x008)))
/* 显示相关 */
#define DisplayMode (*((uint32_t*)(0x7c00 + 0x00c)))
#define Vram_l      (*((uint32_t*)(0x7c00 + 0x010)))
#define Vram_h      (*((uint32_t*)(0x7c00 + 0x014)))
#define ScrnX       (*((uint32_t*)(0x7c00 + 0x018)))
#define ScrnY       (*((uint32_t*)(0x7c00 + 0x01c)))

/* 参数的取值 */
enum Display
{
    _TEXT = 0,
    _GRAPHIC = 1, /* 图形界面 */
};

/* C语言实现bool */
typedef uint32_t bool;
#define true 1
#define false 0

#define NULL ((void*)0)

#endif /* __GLOBAL_H_ */
