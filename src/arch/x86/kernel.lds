OUTPUT_FORMAT("elf32-i386","elf32-i386","elf32-i386")
OUTPUT_ARCH(i386)
ENTRY(_start)
SECTIONS
{
    . = 0xc0000000 + 0x7f00;
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

}
