;loader.asm
;Copyright 2021-2022 Lin Chenjun,All rights reserved.

org 0x500
[bits 16]
jmp start

%include "protect.inc"

GDT_BASE: SEGMDESC 0,0,0
SectionCode32:     SEGMDESC 0x00000000,0xfffff,AR_CODE32
SectionData32:     SEGMDESC 0x00000000,0xfffff,AR_DATA32
SectionVideo:      SEGMDESC 0x000b8000,0x00007,AR_DATA32
SectionColorVideo: SEGMDESC 0x000a0000,0x0000e,AR_DATA32

GDT_SIZE equ ($ - GDT_BASE)
GDT_LIMIT equ GDT_SIZE - 1

gdt_ptr dw GDT_LIMIT
        dd GDT_BASE

SelectorCode32     equ ((SectionCode32-GDT_BASE)/8 | TI_GDT | RPL0)
SelectorData32     equ ((SectionData32-GDT_BASE)/8 | TI_GDT | RPL0)
SelectorVideo      equ ((SectionVideo-GDT_BASE)/8 | TI_GDT | RPL0)
SelectorColorVideo equ ((SectionColorVideo-GDT_BASE)/8 | TI_GDT | RPL0)

start:
jmp $
