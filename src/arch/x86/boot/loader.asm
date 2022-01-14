;loader.asm
;Copyright 2021-2022 Lin Chenjun,All rights reserved.

%include "boot.inc"
org LoaderBaseAddress
[bits 16]

%include "protect.inc"

GDT_BASE: SEGMDESC 0,0,0
SectionCode32:     SEGMDESC 0x00000000,0xfffff,AR_CODE32 ;32位代码段
SectionData32:     SEGMDESC 0x00000000,0xfffff,AR_DATA32 ;32位数据段
SectionVideo:      SEGMDESC 0x000b8000,0x00007,AR_DATA32 ;文字显存
SectionColorVideo: SEGMDESC 0x000a0000,0x0000e,AR_DATA32 ;彩色显存

GDT_SIZE equ ($ - GDT_BASE)
GDT_LIMIT equ GDT_SIZE - 1

times 60 dq 0;预留60个描述符

;段选择子
SelectorCode32     equ (((SectionCode32-GDT_BASE)/8) | TI_GDT | RPL0)
SelectorData32     equ (((SectionData32-GDT_BASE)/8) | TI_GDT | RPL0)
SelectorVideo      equ (((SectionVideo -GDT_BASE)/8) | TI_GDT | RPL0)
SelectorColorVideo equ (((SectionColorVideo-GDT_BASE)/8) | TI_GDT | RPL0)

gdt_ptr dw GDT_LIMIT
        dd GDT_BASE

times (0x300 - ($ - $$)) db 0

;&total_memory_bytes = 0x500+0x300 = 0x800
total_memory_bytes dq 0 ;内存大小(单位:字节)

ards_buf times 240 db 0
ards_nr dw 0

times (0x500-($ - $$)) db 0;对齐到文件起始0x500处

;$ =0x500 + 0x500 = 0xa00

;loader从此处开始执行
start:

; int 0x15 eax=0xe820 edx=0x534d4150:获取内存布局
    xor ebx,ebx       ;将ebx清零
    mov edx,0x534d4150;edx = "SMAP"
    mov di,ards_buf
    .e820_memory_get_loop:
        mov ax,0xe820 ;int 0x15子功能号e820
        mov ecx,20    ;ards结构大小是20字节
        int 0x15
        jc .try_e801       ;cf为1表示有错误,尝试e801模式
        add di,cx          ;使di指向下一个ards结构
        inc word [ards_nr] ;让ards_nr自增1
        cmp ebx,0
        jnz .e820_memory_get_loop
    ;寻找内存容量,就是最大的那一块内存
    mov cx,[ards_nr]
    mov ebx,ards_buf
    xor edx,edx       ;edx先清零
    .find_max_memory: ;冒泡排序
        mov eax,[ebx]
        add eax,[ebx + 8]
        add ebx,20
        cmp edx,eax
        jge .next_ards
        mov edx,eax   ;edx是内存总大小
    .next_ards:
        loop .find_max_memory
        jmp memory_get_success

;int 0x15 ax=0xe801:获取内存布局,最大4GB
;返回值:
;ax == cx,以KB为单位
;bx == dx,以64kb为单位
    .try_e801:
        mov ax,0xe801
        int 0x15
        jc .try_88 ;有错误,尝试0x88功能
        ;把以KB为单位的低15MB内存的容量转换为以字节为单位
        mov cx,0x400
        mul cx ;ax*cx,结果是以字节为单位的内存容量
        shl edx,16
        and eax,0x0000ffff
        or edx,eax
        add edx,0x100000 ;ax只是第15MB,所以总内存要加上1MB
        mov esi,edx      ;先备份edx
        ;将16MB以上内存的容量转为以字节为单位
        xor eax,eax ;eax清零
        mov ax,bx
        mov ecx,0x1000 ;64kb
        mul ecx        ;eax*ecx,积的高32位在edx,低32位在eax
        add esi,eax    ;只能获取4GB内存,所以只要低32位就够了
        mov edx,esi
        jmp memory_get_success

;int 0x15 ah=0x88 :获取内存容量,只能获取64MB以内
;返回值:
;ax:以MB为单位的内存容量
    .try_88:
        mov ah,0x88
        int 0x15
        jc .get_memory_error ;无法获取内存容量,启动终止
        and eax,0x0000ffff
        mov cx,0x400
        mul cx
        shl edx,16
        or edx,eax
        add edx,0x100000;加上1MB,是实际内存容量
        jmp memory_get_success
        .get_memory_error:
            hlt                   ;让CPU休眠
            jmp .get_memory_error ;在此处死循环,停止启动
    memory_get_success:
        mov dword [total_bytes],edx
jmp $
