;Pencil Kernel start.asm
%include "boot.inc"
extern kernel_main
[bits 32]
section .text
global _start
_start:
    mov ax,SelectorVideo
    mov gs,ax
    mov byte [gs:((160*7)+ 0)],'K'
    mov byte [gs:((160*7)+ 2)],'e'
    mov byte [gs:((160*7)+ 4)],'r'
    mov byte [gs:((160*7)+ 6)],'n'
    mov byte [gs:((160*7)+ 8)],'e'
    mov byte [gs:((160*7)+10)],'l'
    ;初始化寄存器
    mov ax,SelectorData32
    mov ds,ax
    mov es,ax
    mov ss,ax
    mov fs,ax
    mov esp,KernelStackTop + 0xc0000000
    lgdt [gdt_ptr] ;内核栈可能会覆盖loader,所以重新加载gdt.而页表在1MB地址以上,不用担心被覆盖
    jmp kernel_main       ;跳转到内核主函数,接下来就是C语言的部分了.
    jmp $          ;正常情况下不会到这里,因为main函数不能返回

section .data
    %include "protect.inc"
    GDT_BASE: SEGMDESC 0,0,0
    SectionCode32:     SEGMDESC 0x00000000,0xfffff,AR_CODE32 ;32位代码段
    SectionData32:     SEGMDESC 0x00000000,0xfffff,AR_DATA32 ;32位数据段
    SectionVideo:      SEGMDESC 0x000b8000,0x00007,AR_DATA32 ;文字显存
    ; SectionColorVideo: SEGMDESC 0x000a0000,0x0000e,AR_DATA32 ;彩色显存

    GDT_SIZE equ ($ - GDT_BASE)
    GDT_LIMIT equ GDT_SIZE - 1

    times 60 dq 0;预留60个描述符

    ;段选择子
    SelectorCode32     equ (0x0001 << 3 | TI_GDT | RPL0)
    SelectorData32     equ (0x0002 << 3 | TI_GDT | RPL0)
    SelectorVideo      equ (0x0003 << 3 | TI_GDT | RPL0)
    ; SelectorColorVideo equ (0x0004 << 3 | TI_GDT | RPL0)

    ;gdt指针
    gdt_ptr dw GDT_LIMIT
            dd GDT_BASE
