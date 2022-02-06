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

;界面,同样只能选一个
%define __UI_TEXT__
;%define __UI_GRAPHIC__

%ifdef __UI_GRAPHIC__
    ;这里是VBE模式号
    ;本系统可用的模式号:
    ;0x10f,320 * 200
    ;0x112,640 * 480
    ;0x115,800 * 600
    ;0x118,1024 * 768
    ;0x11b,1280 * 1024
    VBE_MODE1 0x118 ;首选模式号:1024 * 768 32位色彩
    VBE_MODE2 0x115 ;备选号1: 800 * 600 32位色彩
    VBE_MODE3 0x112 ;备选号2: 640 * 480 32位色彩
%endif

;磁盘驱动器号
DrvNum equ 0x00 ;软盘
;DrvNum equ 0x80 ;硬盘

;BootLoader的信息
;以下内容的地址都是物理地址
BaseOfBootStack equ 0x7c00  ;boot栈区起始地址

LoaderStartSec equ 0x02       ;loader在2扇区(LBA)开始处
LoaderSectors equ 7           ;loader占用7扇区
LoaderBaseAddress equ 0x1000  ;loader加载到0x1000地址处
LoaderOffsetAddress equ 0x500 ;loader前0x4ff字节是数据,代码正式开始是0x500字节
LoaderStackTop equ 0x700

;Loader向内核传递的参数
;设备相关
TotMem_l    equ 0x7c00 ; +  0 总内存容量低32位
TotMem_h    equ 0x7c04 ; +  4 总内存容量高32位(对于32位系统,这个值没有意义)
DiskNum     equ 0x7c08 ; +  8 磁盘数量
;显示相关
DisplayMode equ 0x7c0c ; + 12 显示模式(文本(0)或图形(1))
Vram_l      equ 0x7c0f ; + 16 显存地址低32位
Vram_h      equ 0x7c10 ; + 20 显存地址高32位(对于32位系统,这个值没有意义)
ScrnX       equ 0x7c14 ; + 24 对于文本模式,这是指列数;对于图形模式,这是指x轴方向上的像素数
ScrnY       equ 0x7c18 ; + 28 对于文本模式,这是指行数;对于图形模式,这是指y轴方向上的像素数


KernelStartSec equ 0x09       ;Kernel在9扇区(LBA)开始处
KernelSectors equ 200         ;Kernel占用200扇区
KernelBufAddress equ 0x7F00   ;Kernel临时转存区
KernelBaseAddress equ 0x7F00  ;Kernel从物理地址0x7F00开始,虚拟地址要加上0xc0000000
KernelStackTop equ 0x7b00     ;kernel栈顶在0x7b00,虚拟地址是0xc0007b00
