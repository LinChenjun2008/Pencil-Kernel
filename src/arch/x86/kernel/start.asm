;Pencil Kernel start.asm
;copyright 2022 LinChenjun, All rights reserved.
extern _main
[bits 32]
section .text
_start:
    jmp _main
    jmp $
