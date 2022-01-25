;loader的信息
LoaderStartSec equ 0x02       ;loader在2扇区(LBA)开始处
LoaderSectors equ 5           ;loader占用5扇区
LoaderBaseAddress equ 0x700   ;loader加载到0x700地址处
LoaderOffsetAddress equ 0x500 ;loader前0x4ff字节是数据,代码正式开始是0x500字节

KernelBaseAddress equ 0x100000 ;1MB
