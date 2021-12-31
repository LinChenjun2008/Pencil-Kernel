org 0x500
[bits 16]
jmp start

%include"desc.inc"
GDT_BASE
    SEGMDESC 0,0,0

GDT_SIZE equ ($ - GDT_BASE)
GDT_LIMIT equ GDT_SIZE - 1

gdt_ptr dw GDT_LIMIT
        dd GDT_BASE

start:
jmp $
