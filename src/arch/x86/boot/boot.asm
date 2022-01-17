;boot.asm

org 0x7c00
[bits 16]
jmp short start                ;  2B 跳转指令
nop                            ;  3B 空指令
Magic           db "EPFS  01"  ;  8B epfs文件系统名称
TotSec          dw 131072      ;  4B 总扇区数 (131072 * 512)B = 64MB
BytesPerSector  dw 512         ;  4B 每扇区字节数
BitmapStartSec  dw 1           ;  4B bitmap的起始扇区数(LBA)
BitmapSectors   dw ((((64*1024*1024)/512)/8)/8)           ;  4B bitmap占用的扇区数
DataStartSec    dw             ;  4B 数据区起始扇区(LBA)
DataSectors     dw             ;  4B 数据区大小
RootDirStartSec dw             ;  4B 根目录起始扇区(LBA)
RootDirSectors  dw             ;  4B 根目录占用扇区数
                               ;465B 引导程序
                               ;  2B 0x55,0xaa

;%include "epfs.asm"
    jmp $

read_sector:
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
    mov  dl,0x80   ;驱动器号
    mov  si,sp
    int 0x13
    add  sp,0x10   ;将栈指针上移16B(0x10),相当于释放硬盘地址包占用的栈空间
    ret

times 510 -($ - $$) db 0x00
db 0x55,0xaa
