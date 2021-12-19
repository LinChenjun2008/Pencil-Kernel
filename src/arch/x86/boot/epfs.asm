jmp short start              ; 2B
nop                          ; 3B
Magic           db "EPFS01  " ; 8B
DiskTotSec      dw 
BytesPerSector  dw 512
BitmapStartSec  dw
BitmapSectors   dw             ;  4B bitmap占用的扇区数
DataSecStart    dw             ;  4B 数据区起始扇区
DataSectors     dw             ;  4B 数据区大小
RootDirStartSec dw             ;  4B 根目录起始扇区
RootDirSectors  dw             ;  4B 根目录占用扇区数
                               ;465B 引导程序
                               ;  2B 0x55,0xaa
start:
    jmp $
