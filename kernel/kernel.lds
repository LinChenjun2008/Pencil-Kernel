OUTPUT_FORMAT("pe-x86-64","pe-x86-64","pe-x86-64")
/* OUTPUT_FORMAT("elf64-x86-64","elf64-x86-64","elf64-x86-64") */
OUTPUT_ARCH(i386:x86-64)
ENTRY(kernel_main)

SECTIONS
{
    /* KERNEL_VMA_BASE = 0xffff800000000000; */
    KERNEL_VMA_BASE = 0x0000000000000000;
    . = 0x0000000000100000;
    . += KERNEL_VMA_BASE;
    _kernel_start = .;
    _text = .;
    .text (_text): AT(_text - KERNEL_VMA_BASE)
    {
        kernel_main = .;
        *(.text)
    }
    _etext = .;
    . = ALIGN(8);
    _data = .;
    .data (_data): AT(_data - KERNEL_VMA_BASE)
    {
        *(.data)
    }
    _edata = .;
    _rodata = .;
    .rodata (_rodata): AT(_rodata - KERNEL_VMA_BASE)
    {
        *(.rodata)
    }
    _erodata = .;
    _bss = .;
    .bss (_bss): AT(_bss - KERNEL_VMA_BASE)
    {
        *(.bss)
    }
    _ebss = .;
    _kernel_end = .;
}
