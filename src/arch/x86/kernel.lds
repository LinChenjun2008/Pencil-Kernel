OUTPUT_FORMAT("elf32-i386","elf32-i386","elf32-i386")
OUTPUT_ARCH(i386)
ENTRY(_start) /* _start在start.asm中 */ 
SECTIONS
{
    . = 0xc0000000 + 0x7f00; /* 内核在低端1MB的0x7f00中,低端1MB同时被映射到0xc0000000,所以内核起始地址是0xc0007f00 */
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
