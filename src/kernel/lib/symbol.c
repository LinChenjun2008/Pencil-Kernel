#include <global.h>
#include <string.h>

BOOL address_available(MEMORY_ADDRESS address)
{
    return (address >= KERNEL_VMA_BASE && address <= 0xffffffffffffffff);
}

MEMORY_ADDRESS symbol2address(char* name)
{
    int i;
    for(i = 0;i < symbols;i++)
    {
        if(strcmp(name,symbol_table[i].name) == 0)
        {
            return symbol_table[i].Address;
        }
    }
    return 0;
}

char* address2symbol(MEMORY_ADDRESS address)
{
    if(!address_available(address))
    {
        return NULL;
    }
    int i;
    for(i = 0;i < symbols;i++)
    {
        if(address >= symbol_table[i].Address && address < symbol_table[i + 1].Address)
        {
            return symbol_table[i].name;
        }
    }
    return NULL;
}