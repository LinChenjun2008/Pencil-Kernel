;boot.asm
org 0x7c00
[bits 16]
%include "boot.inc"

;初始化寄存器
mov ax,cs
mov ds,ax
mov es,ax
mov ss,ax
mov fs,ax

;栈指针寄存器初始化为0x7c00
mov sp,0x7c00

;向gs段寄存器写入0xb800(显存)
mov ax,0xb800
mov gs,ax

;清屏

mov ax,0x600
mov bx,0x700
mov cx,0
mov dx,0x184f
int 0x10

;显示一条信息
mov bp,bootmsg
mov cx,8;8个字符
mov ax,0x1301
mov bx,0x0007;第0页,黑底白字
mov dx,0x0000;行,列
int 0x10


Loadfile:
    ;加载loader
    mov eax,0x02 ;第2扇区(LBA)
    mov bx,LoaderBaseAddress ;读取到内存0x700地址处
    mov cx,10 ;读取的扇区数
    ;ReadSector:读取磁盘
    ;参数:
    ;eax   :扇区号
    ;cx    :要读取的扇区数
    ;es:bx :读取到的数据存放处
    ;dx    :驱动器号,0x00~0x7f:软盘 0x80~0xff:硬盘
    ReadSector:

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
        mov  ax,0x42   ;代表读
                       ;dx为驱动器号,0x00为第一个软盘,0x80为主硬盘驱动器
                       ;不必担心是否是主硬盘/软盘,mbr所在的磁盘默认为是主硬盘/软盘
        mov  dx,0x0000 ;驱动器号
        mov  si,sp     ;
        int 0x13       ;调用扩展硬盘读取功能
        jc load_error  ;读取错误
        add  sp,0x10   ;将栈指针上移16B(0x10),相当于释放硬盘地址包占用的栈空间
        jmp load_success
        load_error:    ;读取失败
            add  sp,0x10   ;将栈指针上移16B(0x10),相当于释放硬盘地址包占用的栈空间
            mov bp,errmsg
            mov cx,32;32个字符
            mov ax,0x1301
            mov bx,0x008c;第0页,黑底红字闪烁
            mov dx,0x0100;行,列
            int 0x10
            jmp Loadfile ;重新读取,直到成功
    
    load_success:
        ;读取结束后显示一条信息,代表将要执行loader
        mov bp,loaderstartmsg
        mov cx,16;16个字符
        mov ax,0x1301
        mov bx,0x0007;第0页,黑底白字
        mov dx,0x0100;行,列
        int 0x10
        ;跳转到loader,boot到此结束
        jmp LoaderBaseAddress+LoaderOffsetAddress

;其他数据
bootmsg db "Starting"
loaderstartmsg db "Go to Loader.bin"
errmsg db "Start Error: can't load 'LOADER'"

times 510 -($ - $$) db 0x00
db 0x55,0xaa
