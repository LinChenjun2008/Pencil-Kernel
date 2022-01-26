;引导启动阶段的配置文件
;启动设备:虚拟机还是物理机
;只能选一个

;物理机
;%define __BOOT_ON_PHY_MACHINE__
;虚拟机
%define __BOOT_ON_VIR_MACHINE__

%ifdef __BOOT_ON_VIR_MACHINE__
    SecPerCyc equ 18
%endif

;磁盘驱动器号
DrvNum equ 0x00
;loader的信息
BaseOfBootStack equ 0x7c00  ;boot栈区起始地址

LoaderStartSec equ 0x02       ;loader在2扇区(LBA)开始处
LoaderSectors equ 7           ;loader占用7扇区
LoaderBaseAddress equ 0x700   ;loader加载到0x700地址处
LoaderOffsetAddress equ 0x500 ;loader前0x4ff字节是数据,代码正式开始是0x500字节
LoaderStackTop equ 0x700

KernelStartSec equ 0x09       ;Kernel在9扇区(LBA)开始处
KernelSectors equ 200         ;Kernel占用200扇区
KernelBufAddress equ 0x7F00   ;Kernel临时转存区
KernelBaseAddress equ 0x7F00  ;Kernel从物理地址0x7F00开始
