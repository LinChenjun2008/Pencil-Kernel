OUTPUT_FORMAT("pe-x86-64","pe-x86-64","pe-x86-64")
OUTPUT_ARCH(i386:x86-64)
ENTRY(kernel_main)
SECTIONS
{
    . = 0x0000000000000000;
    .text :
    {
        _text = .;
        *(.text)
        _etext = .;
    }

    . = ALIGN(8);
    
    .data :
    {
        _data = .;
        *(.data)
        _edata = .;
    }
    .rodata :
    {
        _rodata = .;
        *(.rodata)
        _erodata = .;
    }
    .bss :
    {
        _bss = .;
        *(.bss)
        _ebss = .;
    }
    /* .font :
    {
        *(.font)
    } */
    _kernel_end = .;
}
