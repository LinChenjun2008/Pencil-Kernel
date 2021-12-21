jmp short start                ;  2B 跳转指令
nop                            ;  3B 空指令
Magic           db "EPFS  01"  ;  8B epfs文件系统名称
TotSec          dw 2880        ;  4B 总扇区数
BytesPerSector  dw 512         ;  4B 每扇区字节数
BitmapStartSec  dw 1           ;  4B bitmap的起始扇区数(LBA)
BitmapSectors   dw             ;  4B bitmap占用的扇区数
DataStartSec    dw             ;  4B 数据区起始扇区(LBA)
DataSectors     dw             ;  4B 数据区大小
RootDirStartSec dw             ;  4B 根目录起始扇区(LBA)
RootDirSectors  dw             ;  4B 根目录占用扇区数
                               ;465B 引导程序
                               ;  2B 0x55,0xaa
start:
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
    int 0x10;在qemu中,这一行会出问题(会导致显示不正常)其他虚拟机或物理电脑是正常的

    mov byte [gs:0x00],'M'
    mov byte [gs:0x01],0x07
    mov byte [gs:0x02],'B'
    mov byte [gs:0x03],0x07
    mov byte [gs:0x04],'R'
    mov byte [gs:0x05],0x07
 
    jmp $
