;引导启动阶段的配置文件
;启动设备:磁盘还是硬盘
;只能选一个
%define __BOOT_ON_VIR_MACHINE__
;软盘
;%define __BOOT_FLOPPY__
;硬盘
%define __BOOT_HARDDISK__

%ifdef __BOOT_FLOPPY__
    SecPerCyc equ 18 ;软盘用
%endif
%ifdef __BOOT_HARDDISK__
    SecPerCyc equ 63 ;硬盘用
%endif

;磁盘驱动器号
%ifdef __BOOT_FLOPPY__
    DrvNum equ 0x00 ;软盘
%endif
%ifdef __BOOT_HARDDISK__
    DrvNum equ 0x80 ;硬盘
%endif

;界面,同样只能选一个,同时选择将使用文本界面
;%define __UI_TEXT__
%define __UI_GRAPHIC__

%ifdef __UI_GRAPHIC__
    ;这里是VBE模式号
    ;本系统可用的模式号(可能还有更多,这里只列举了一些):
    ;0x140,320 * 200
    ;0x142,640 * 480
    ;0x143,800 * 600
    ;0x144,1024 * 768
    ;0x145,1280 * 1024
    ;0x18c,2560 * 1600
    ;这里挑3个来尝试,总会有一个可以的吧？
    %ifdef __BOOT_ON_VIR_MACHINE__
        VBE_MODE1 equ 0x143 ;首选模式号:1024 * 768 32位色彩
        VBE_MODE2 equ 0x142 ;备选号1: 800 * 600 32位色彩
        VBE_MODE3 equ 0x140 ;备选号2: 640 * 480 32位色彩
    %else
        VBE_MODE1 equ 0x118
    %endif
%endif

;BootLoader的信息
;以下内容的地址都是物理地址
BaseOfBootStack equ 0x7c00  ;boot栈区起始地址

%ifdef __BOOT_FLOPPY__
    LoaderStartSec equ 0x02   ;loader在2扇区(LBA)开始处
%endif
%ifdef __BOOT_HARDDISK__
    LoaderStartSec equ 0x41   ;loader在65扇区(LBA)开始处
%endif

LoaderSectors equ 7           ;loader占用7扇区
LoaderBaseAddress equ 0x1000  ;loader加载到0x1000地址处
LoaderOffsetAddress equ 0x500 ;loader前0x4ff字节是数据,代码正式开始是0x500字节
LoaderStackTop equ 0x700

;Loader向内核传递的参数
;设备相关
TotalMem_l    equ 0x7c00 ; +  0 总内存容量低32位
TotalMem_h    equ 0x7c04 ; +  4 总内存容量高32位(对于32位系统,这个值没有意义)
DiskCnt       equ 0x7c08 ; +  8 磁盘数量
;显示相关
DisplayMode equ 0x7c0c ; + 12 显示模式(文本(0)或图形(1))
Vram_l      equ 0x7c10 ; + 16 显存地址低32位
Vram_h      equ 0x7c14 ; + 20 显存地址高32位(对于32位系统,这个值没有意义)
ScrnX       equ 0x7c18 ; + 24 对于文本模式,这是指列数;对于图形模式,这是指x轴方向上的像素数
ScrnY       equ 0x7c1c ; + 28 对于文本模式,这是指行数;对于图形模式,这是指y轴方向上的像素数


%ifdef __BOOT_FLOPPY__
    KernelStartSec equ 0x09   ;Kernel在9扇区(LBA)开始处
%endif
%ifdef __BOOT_HARDDISK__
    KernelStartSec equ 0x48   
%endif


KernelSectors equ 200         ;Kernel占用200扇区
KernelBufAddress equ 0x7F00   ;Kernel临时转存区
KernelBaseAddress equ 0x7F00  ;Kernel从物理地址0x7F00开始,虚拟地址要加上0xc0000000
KernelStackTop equ 0x7b00     ;kernel栈顶在0x7b00,虚拟地址是0xc0007b00
