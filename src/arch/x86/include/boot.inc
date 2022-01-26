;启动方式:虚拟机还是物理机

;物理机
;%define __BOOT_ON_PHY_MACHINE__
;虚拟机

%define __BOOT_ON_VIR_MACHINE__
%ifdef __BOOT_ON_VIR_MACHINE__
    SecPerCyc equ 18
%endif
;loader的信息
BaseOfBootStack equ 0x7c00  ;boot栈区起始地址

LoaderStartSec equ 0x02       ;loader在2扇区(LBA)开始处
LoaderSectors equ 5           ;loader占用5扇区
LoaderBaseAddress equ 0x700   ;loader加载到0x700地址处
LoaderOffsetAddress equ 0x500 ;loader前0x4ff字节是数据,代码正式开始是0x500字节

KernelStartSec equ 0x09       ;Kernel在9扇区(LBA)开始处
KenrelSectors equ 200         ;Kernel占用200扇区
KernelBufAddress equ 0x7F00   ;Kernel临时转存区
KernelBaseAddress equ 0x100000;Kernel从1MB开始