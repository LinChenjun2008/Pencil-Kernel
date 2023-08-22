#include <device/fpu.h>
#include <thread/thread.h>

PUBLIC bool fpu_check()
{
    uint32_t testword = 0x55aa;
    __asm__ __volatile__
    (
        "movq %%cr0,%%rax \n\t"
        "andb $0xf3,%%al \n\t"
        "orb $0x02,%%al \n\t"
        "movq %%rax,%%cr0 \n\t"

        "movq %%cr4,%%rax \n\t"
        "orw $3 << 9,%%ax \n\t"
        "movq %%rax,%%cr4 \n\t"

        "fninit \n\t"
        "fnstsw %0 \n\t"
        :
        : "m"(testword)
        : "rax"
    );
    return testword == 0;
}

PUBLIC void fpu_init()
{
    __asm__ __volatile__ ("fnclex \n\t""fninit \n\t");
}

PUBLIC void fpu_set(void* cur_thread,void* next)
{
    __asm__ __volatile__ ("fnsave %0":
                                :"m"(((task_struct_t*)cur_thread)->fpu_regs));
    __asm__ __volatile__ ("frstor %0"::"m"(((task_struct_t*)next)->fpu_regs));
}