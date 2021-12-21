/* 跨平台接口 */
#ifndef __INTERFACE_H_
#define __INTERFACE_H_

#include "config.h"

struct arch
{
    uint32_t (*io_in16)(uint32_t port);
}

#endif /* __INTERFACE_H_ */
