;boot.asm

org 0x7c00
[bits 16]
%include "boot.inc"
;%include "epfs.inc"

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
int 0x10

mov bp,bootmsg
mov cx,11;11个字符
mov ax,0x1301
mov bx,0x0007;第0页,黑底白字
mov dx,0x0000;行,列
int 0x10

Loadfile:
;加载loader
mov eax,0x02 ;第2扇区(LBA)
mov bx,LoaderBaseAddress ;读取到内存0x700地址处
mov cx,10 ;读取的扇区数
call ReadSector
;call rd_disk_m_16

mov bp,loaderstartmsg
mov cx,16;16个字符
mov ax,0x1301
mov bx,0x0007;第0页,黑底白字
mov dx,0x0100;行,列
int 0x10

jmp LoaderBaseAddress:LoaderOffsetAddress


ReadSector:

                   ;int 0x13 ax=0x42:扩展硬盘读取功能
                   ;eax:扇区号
                   ;cx:扇区数
                   ;bx:传输缓冲区(偏移)
                   ;es,传输缓冲区(段)
                   ;创建硬盘地址包
    push dword 0x00;64位传送缓冲区地址(0x00)
    push dword eax ;扇区起始号(LBA模式)
    push word  es  ;传输缓冲区段
    push word  bx  ;传输缓冲区地址偏移
    push word  cx  ;传输的扇区数
    push word  0x10;偏移0x00 和 偏移0x01:硬盘地址包大小:0x10,保留值0
                   ;为int 0x13准备参数
    mov  ah,0x42   ;代表读
                   ;dx为驱动器号,0x00为第一个软盘,0x80为主硬盘驱动器
                   ;不必担心是否是主硬盘,mbr所在的磁盘默认为是主硬盘
    mov  dl,0x00   ;驱动器号
    mov  si,sp
    int 0x13
    jc .error
    add  sp,0x10   ;将栈指针上移16B(0x10),相当于释放硬盘地址包占用的栈空间
    ret
    .error:
    mov bp,errmsg
    mov cx,5;5个字符
    mov ax,0x1301
    mov bx,0x008c;第0页,黑底红字闪烁
    mov dx,0x0100;行,列
    int 0x10
    jmp Loadfile

    bootmsg db "Starting..."
    loaderstartmsg db "Go to Loader.bin"
    errmsg db "Error"
times 510 -($ - $$) db 0x00
db 0x55,0xaa
