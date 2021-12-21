/* 跨平台接口 */
#ifndef __INTERFACE_H_
#define __INTERFACE_H_

#define __FORMATS_ 1 /* 一个平台 */

enum
{
    X86;
    X64;
    ARM;
};

struct x86
{
    uint32_t (*io_in8)(uint32_t port);
};

void* arch[__FORMATS_];

#endif /* __INTERFACE_H_ */
