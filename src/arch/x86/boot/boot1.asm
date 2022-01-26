org 0x7c00

RETRY_CNT equ 5
SecPerCyc equ 18;每磁道扇区数

;将lba转换为CHS
; S_CHS_C equ ((LoaderStartSec/SecPerCyc) >> 1);要读入的起始柱面号
; S_CHS_H equ ((LoaderStartSec/SecPerCyc) & 1) ;要读入的起始磁头号
; S_CHS_S equ ((LoaderStartSec - (LoaderStartSec/SecPerCyc)) + 1);要读入的起始扇区号

; E_CHS_C equ (((LoaderStartSec + LoaderSectors)/SecPerCyc) >> 1)
; E_CHS_H equ (((LoaderStartSec + LoaderSectors)/SecPerCyc) & 1)
; E_CHS_S equ (((LoaderStartSec + LoaderSectors) - (LoaderStartSec/SecPerCyc)) + 1)
S_CHS_C equ 0;要读入的起始柱面号
S_CHS_H equ 0 ;要读入的起始磁头号
S_CHS_S equ 3;要读入的起始扇区号

E_CHS_C equ 18
E_CHS_H equ 10
E_CHS_S equ 7

[bits 16]
%include "boot.inc"

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
;int 0x10

;显示一条信息
mov bp,bootmsg
mov cx,8;8个字符
mov ax,0x1301
mov bx,0x0007;第0页,黑底白字
mov dx,0x0000;行,列
int 0x10

;加载loader
;由于int 0x13,ah = 0x42在虚拟机中不能正确读取,
;所以使用int 0x13, ah = 0x02尝试读取
;int 0x13, ah = 0x02:读取磁盘
;al = 要处理的扇区数
;ch = 柱面(磁道)号
;cl = (扇区号0~5位| (柱面号 & 0x300) >> 2)
;dh = 磁头号
;dl = 驱动器号
;es:bx = 缓冲地址
;返回值:
;cf = 0:没有错误,ah = 0
;cf = 1:有错误,ah = 错误码
mov ax,0
mov ds,ax
mov sp,0x7c00
mov bx,0
Loadfile:
    mov ax,LoaderBaseAddress >> 4
    mov es,ax    ;缓冲地址基地址LoaderBaseAddress >> 4
    mov ch,S_CHS_C ;柱面(磁道)号
    mov dh,S_CHS_H ;磁头号
    mov cl,S_CHS_S ;扇区号
    .readloop:
        mov si,0 ;si记录读取失败的次数
        .retry:
            mov ah,0x02 ;读取磁盘
            mov al,1    ;一个扇区
            mov bx,0    ;缓冲区偏移地址:0
            mov dl,0x00 ;驱动器号
            int 0x13    ;调用BIOIS读取磁盘功能
            jnc .next   ;没出错,继续读取下一扇区
            ;出错了:
            add si,1        ;si+1,代表错误了一次
            cmp si,RETRY_CNT;比较si和RETRU_CNT
            jae .error      ;si>=RETRY_CNT,读取失败
            mov ah,0x00
            mov dl,0x00
            int 0x13   ;ah = 0x00:重置驱动器
            jmp .retry ;重新读取
        .next:
            push ax
            push bx
            ;显示一个'.'
            mov ah,0x0e
            mov al,'.'
            mov bx,0x0f
            int 0x10
            pop bx
            pop ax
            mov ax,es
            add ax,0x0020 ;加上512(一扇区)
            mov es,ax
            add cl,1      ;下一个扇区
            cmp cl,SecPerCyc
            jbe .readloop ;cl <= SecPerCyc时跳转到readloop
            mov cx,1      ;1扇区
            add dh,1      ;磁头号 + 1
            cmp dh,E_CHS_H
            jb .readloop   ;dh < E_CHS_H 时跳转到readloop
            mov dh,0      ;磁头号置为0
            add ch,1      ;磁道号 + 1
            cmp ch,E_CHS_S
            jb .readloop   ;ch < E_CHS_S时跳转到readloop
            jmp gotoLoader
    .error:
        mov bp,Errmsg
        mov cx,5;5个字符
        mov ax,0x1301
        mov bx,0x0007;第0页,黑底白字
        mov dx,0x0100;行,列
        int 0x10
        jmp $
gotoLoader:
    mov bp,loaderstartmsg
    mov cx,16;16个字符
    mov ax,0x1301
    mov bx,0x0007;第0页,黑底白字
    mov dx,0x0200;行,列
    int 0x10
    jmp LoaderBaseAddress+LoaderOffsetAddress

bootmsg db "Starting"
Errmsg db "Error"
loaderstartmsg db "Go to Loader.bin"

times 510 - ($ - $$) db 0
db 0x55,0xaa
