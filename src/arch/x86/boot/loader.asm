org 0x500
[bits 16]
jmp start

%include"desc.inc"
GDT_BASE
    SEGMDESC 0,0,0

gdt_limit dd ($ - GDT_BASE)


start:
jmp $
