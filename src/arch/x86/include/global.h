#ifndef __GLOBAL_H_
#define __GLOBAL_H_

#include "stdint.h"
/* 和boot.inc中一样的数据 */

#define LoaderBaseAddress 0x1000  /* loader加载到0x1000地址处 */
#define LoaderOffsetAddress 0x500 /* loader前0x4ff字节是数据,代码正式开始是0x500字节 */

/* loader向内核传递的参数的地址,
* 要记得加上0xc0000000.
*/

#define Total_memory_ptr (0xc0000000 + LoaderBaseAddress + LoaderOffsetAddress)


/* C语言实现bool */
typedef uint32_t bool;
#define true 1
#define false 0

#define NULL ((void*)0)

#endif /* __GLOBAL_H_ */
