;loader.asm
;Copyright 2021-2022 Lin Chenjun,All rights reserved.

org 0x500
[bits 16]
jmp start

%include"desc.inc"
GDT_BASE: SEGMDESC 0,0,0
SectionCode32 :SEGMDESC 0X00000000,0xfffff,AR_CODE
SectionData32 :SEGMDESC 0x00000000,0xfffff,
SectionVideo : SEGMDESC 0x000b8000,0x00007,

GDT_SIZE equ ($ - GDT_BASE)
GDT_LIMIT equ GDT_SIZE - 1

gdt_ptr dw GDT_LIMIT
        dd GDT_BASE

start:
jmp $
