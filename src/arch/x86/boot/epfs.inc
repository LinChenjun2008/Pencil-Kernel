;epfs.asm
;Copyright 2021-2022 Lin Chenjun,All rights reserved.

;%include "boot.inc"
TotalDiskSize equ (64*1024*1024)
BitmapSec equ ((((TotalDiskSize/512)/8)/8)512)
BitmapEndSec equ (((1 + BitmapSec)+7)/8)

jmp short start                ;  2B 跳转指令
nop                            ;  3B 空指令
Magic           db "EPFS  01"  ;  8B epfs文件系统名称
TotSec          dw 131072      ;  4B 总扇区数 (131072 * 512)B = 64MB
BytesPerSector  dw 512         ;  4B 每扇区字节数
BitmapStartSec  dw 1           ;  4B bitmap的起始扇区数(LBA)
BitmapSectors   dw BitmapSec   ;  4B bitmap占用的扇区数
DataStartSec    dw BitmapEndSec;  4B 数据区起始扇区(LBA)
DataSectors     dw             ;  4B 数据区大小
RootDirStartSec dw BitmapEndSec;  4B 根目录起始扇区(LBA)
RootDirSectors  dw             ;  4B 根目录占用扇区数
