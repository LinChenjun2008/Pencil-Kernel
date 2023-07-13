#include <cpu.h>

PUBLIC void cpu_factory_name(void* factory_name)
{
    uint32_t name[4] = {0,0,0,0};
    uint32_t* p_facname = (uint32_t*)factory_name;
    uint32_t i;
    for (i = 0x80000002;i < 0x80000005;i++)
    {
        cpuid(i,0,&name[0],&name[1],&name[2],&name[3]);
        p_facname[0 + (i - 0x80000002) * 4] = name[0];
        p_facname[1 + (i - 0x80000002) * 4] = name[1];
        p_facname[2 + (i - 0x80000002) * 4] = name[2];
        p_facname[3 + (i - 0x80000002) * 4] = name[3];
        p_facname[4 + (i - 0x80000002) * 4] = 0;
    }
    return;
}