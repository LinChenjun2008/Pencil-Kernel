jmp short start                ;  2B 跳转指令
nop                            ;  3B 空指令
Magic           db "EPFS  01"  ;  8B epfs文件系统名称
TotSec          dw 131072      ;  4B 总扇区数 (131072 * 512)B = 64MB
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
    int 0x10

    mov byte [gs:0x00],'B'
    mov byte [gs:0x01],0x07
    mov byte [gs:0x02],'O'
    mov byte [gs:0x03],0x07
    mov byte [gs:0x04],'O'
    mov byte [gs:0x05],0x07
    mov byte [gs:0x06],'T'
    mov byte [gs:0x07],0x07
 
    jmp $

    jmp $
