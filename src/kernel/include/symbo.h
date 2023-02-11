#ifndef __SYMBOL_H__
#define __SYMBOL_H__

struct symbol_entry
{
    MEMORY_ADDRESS Address;
    char* name;
};

BOOL address_available(MEMORY_ADDRESS address);
MEMORY_ADDRESS symbol2address(char* name);
char* address2symbol(MEMORY_ADDRESS address);

extern struct symbol_entry symbol_table[] __attribute__((weak));
extern int symbols __attribute__((weak));

#endif