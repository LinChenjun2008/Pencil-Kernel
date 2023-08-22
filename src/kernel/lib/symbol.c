#include <kernel/global.h>
#include <std/string.h>

bool address_available(uintptr_t address)
{
    return (address >= KERNEL_VMA_BASE
         && address <= symbol_table[symbols - 1].address);
}

uintptr_t symbol2address(char* name)
{
    int i;
    for (i = 0;i < symbols;i++)
    {
        if (strcmp(name,symbol_table[i].name) == 0)
        {
            return symbol_table[i].address;
        }
    }
    return 0;
}

char* address2symbol(uintptr_t address)
{
    if (!address_available(address))
    {
        return NULL;
    }
    int i;
    for (i = 0;i < symbols;i++)
    {
        if (address >= symbol_table[i].address
            && address < symbol_table[i + 1].address)
        {
            return symbol_table[i].name;
        }
    }
    return NULL;
}