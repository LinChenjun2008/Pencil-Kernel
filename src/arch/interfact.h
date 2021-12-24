/* 跨平台接口 */
#ifndef __INTERFACE_H_
#define __INTERFACE_H_

struct ARCH
{
    /* io */
    void (*int_off)(void);
    void (*int_on)(void);
    uint32_t (*io_in8)(uint32_t port);
};

struct ARCH arch;

/* 调用与平台相关的函数:

arch.函数名(参数);

*/

#endif /* __INTERFACE_H_ */
