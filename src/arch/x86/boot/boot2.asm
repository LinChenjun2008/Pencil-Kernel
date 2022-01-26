[bits 16]
%include "boot.inc"
section code vstart=0x7c00 ;org 0x7c00
mov ax,cs
mov ds,ax
mov es,ax
mov ss,ax
mov fs,ax

mov sp,0x7c00

mov ax,0xb800
mov gs,ax

;清屏

mov ax,0x600
mov bx,0x700
mov cx,0
mov dx,0x184f
;int 0x10

mov byte [gs:0x00],'M'
mov byte [gs:0x01],0x70
mov byte [gs:0x02],'B'
mov byte [gs:0x03],0x70
mov byte [gs:0x04],'R'
mov byte [gs:0x05],0x70
mov byte [gs:0x06],' '
mov byte [gs:0x07],0x70
mov byte [gs:0x08],' '
mov byte [gs:0x09],0x70
mov byte [gs:0x0a],' '
mov byte [gs:0x0b],0x70

;加载loader
mov eax,0x02 ;第二扇区
mov bx,0x700 ;读取到内存0x900地址处
mov cx,4 ;读取的扇区数
call read16
jmp 0x700+0x500

; read16:
; ;创建硬盘地址包
; push dword 0x00;64位传送缓冲区地址(0x00)
; push dword eax ;扇区起始号(LBA模式)
; push word  es  ;传输缓冲区地址
; push word  bx  ;传输缓冲区地址
; push word  cx  ;传输的扇区数
; push word  0x10;偏移0x00 和 偏移0x01:硬盘地址包大小:0x10,保留值0
; ;为int 0x13准备参数
; mov  ah,0x42 ;代表读
; mov  dl,0x80;驱动器号
; mov  si,sp
; int 0x13
; add  sp,0x10;将栈指针上移16B(0x10),相当于释放硬盘地址包占用的栈空间
; ret



read16:
    mov esi,eax
    mov di,cx

    mov dx,0x1f2
    mov al,cl
    out dx,al
    mov eax,esi

    ;lba 7~0
    mov dx,0x1f3
    out dx,al
    ;lba 15~8
    mov cl,8
    shr eax,cl ;eax >> cl
    mov dx,0x1f4
    out dx,al
    ;lba 23~16
    shr eax,cl
    mov dx,0x1f5
    out dx,al
    ;lba 27~24
    shr eax,cl
    and al,0x0f ;lba 27~24
    or al,0xe0 ;0xe0: 1110 0000
    mov dx,0x1f6
    out dx,al

    ;读取数据

    mov dx,0x1f7
    mov al,0x20 ;代表读数据
    out dx,al

    .waite:
        nop
        in al,dx
        and al,0x88
        cmp al,0x08
        jnz .waite

    mov ax,di
    mov dx,256
    mul dx
    mov cx,ax
    mov dx,0x1f0

    .read:
        in ax,dx
        mov [bx],ax
        add bx,2
        loop .read
    ret

times 510 - ($ - $$) db 0
db 0x55,0xaa
