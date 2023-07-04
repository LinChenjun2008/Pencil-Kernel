#ifndef __SYMBOL_H__
#define __SYMBOL_H__

struct symbol_entry
{
    uintptr_t  address;
    char      *name;
};

/**
 * @brief 判断目标地址是否在内核空间
 * @param address 目标地址
*/
BOOL address_available(uintptr_t address);

/**
 * @brief 将符号名转换为地址
 * @param name 符号名
 * @return 地址
*/
uintptr_t symbol2address(char* name);

/**
 * @brief 将地址转换为符号名
 * @param address 地址
 * @return 符号名
*/
char* address2symbol(uintptr_t address);

extern struct symbol_entry symbol_table[] __attribute__((weak));
extern int symbols __attribute__((weak));

#endif