;Pencil-Kernel (PKn) boot3
;Copyright 2022 LinChenjun

org 0x7c00
[bits 16]

%include "boot.inc"

Start:
    ;初始化寄存器 (Initialize registers)
    mov ax,cs
    mov ds,ax
    mov es,ax
    mov ss,ax
    mov fs,ax
    mov sp,BaseOfBootStack

    ;清除屏幕 (Clean screen)
    mov ax,0x0600 ;ah = 0x60,al = 0
    mov bx,0x0700 ;bh = 0x07
    mov cx,0x0000 ;ch = 左上角坐标列号(x),cl = 左上角坐标行号(y)
    mov dx,0x184f ;dh = 右下角坐标列号(x),cl = 右下角坐标行号(y)
    int 0x10

    ;设置光标位置 (Set focus)
    mov ax,0x0200 ;ah = 0x20 ,al = 0
    mov bx,0x0000 ;bh = 页码 (Page Number)
    mov dx,0x0000 ;dh = 列 (col),dl = 行 (row)
    int 0x10

    ;在屏幕上显示:Starting (Display on screen:Starting)
    
