/* 跨平台接口 */
#ifndef __INTERFACE_H_
#define __INTERFACE_H_

struct x86
{
    uint32_t (*io_in8)(uint32_t port);
};

union arch /* 只能同时在一个平台,所以用union共用体 */
{
    struct x86 x86;
};
/* 调用与平台相关的函数:

arch.平台.函数名(参数);

*/

#endif /* __INTERFACE_H_ */
