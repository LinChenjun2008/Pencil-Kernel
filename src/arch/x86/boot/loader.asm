;loader.asm
;Copyright 2021-2022 Lin Chenjun,All rights reserved.

org 0x500
[bits 16]
jmp start

%include"desc.inc"
GDT_BASE: SEGMDESC 0,0,0
SectionCode32 :SEGMDESC 0X00000000,0xfffff,AR_TYPE_CODE | AR_G_4K | AR_P

GDT_SIZE equ ($ - GDT_BASE)
GDT_LIMIT equ GDT_SIZE - 1

gdt_ptr dw GDT_LIMIT
        dd GDT_BASE

start:
jmp $
