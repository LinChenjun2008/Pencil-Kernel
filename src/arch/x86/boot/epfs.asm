jmp short start                ;  2B 跳转指令
nop                            ;  3B 空指令
Magic           db "EPFS01  "  ;  8B epfs文件系统名称
TotSec          dw 2880        ;  4B 总扇区数
BytesPerSector  dw 512         ;  4B 每扇区字节数
BitmapStartSec  dw             ;  4B bitmap的起始扇区数
BitmapSectors   dw             ;  4B bitmap占用的扇区数
DataSecStart    dw             ;  4B 数据区起始扇区
DataSectors     dw             ;  4B 数据区大小
RootDirStartSec dw             ;  4B 根目录起始扇区
RootDirSectors  dw             ;  4B 根目录占用扇区数
                               ;465B 引导程序
                               ;  2B 0x55,0xaa
start:
    jmp $
