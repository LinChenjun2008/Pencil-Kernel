void kernel_entry()
{
    __asm__("leaq kernel_main(%rip),%rax\n\t""jmpq *%rax\n\t");
}