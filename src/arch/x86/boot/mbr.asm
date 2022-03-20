;Pencil-Kernel mbr
;给硬盘使用的,软盘引导的话就不用写入这个文件.
;注意!这个程序还不能用,需要完善.

;大致的执行过程:
; 1. 初始化寄存器
; 2. 把自己搬到0x7f00地址处,并跳过去执行(搬到哪无所谓,主要是腾出0x7c00~0x7dff这512字节)
; 3. 寻找可引导分区,把分区前512字节加载到0x7c00地址处
; 4. 跳转到0x7c00,mbr结束

org 0x7c00
[bits 16]
Start:
    ;初始化寄存器 (Initialize registers)
    mov ax,cs
    mov ds,ax
    mov es,ax
    mov ss,ax
    mov fs,ax
    mov sp,0x7f00
    ;2.把自己搬到0x7f00地址处 
    mov ax,0x7c0
    mov ds,ax
    mov ax,0x7f0
    mov es,ax
    mov cx,256
    mov di,0
    mov si,0
    cld      ;清零方向标志位df,df默认是0,所以不写也没问题,但还是写上放心
    rep movsw ;从ds:si复制一个字(word)到es:di,复制次数:cx的值
             ;每次复制后,si和di的值会对应数据大小增加(df位为1时会减小)
        mov bp,Msg
        mov cx,3      ;3个字符 (chars:3)
        mov ax,0x1301
        mov bx,0x0007 ;第0页,黑底白字 (Page:0,Background color:black)
        mov dx,0x0000 ;行,列 (row and col)
        int 0x10

    jmp next
Go equ $
org 0x7f00 + Go
    next: ;这里就是复制到0x7f00后的mbr了
        mov ax,cs
        mov ds,ax ;向ds载入段值
        mov es,ax
        mov ss,ax
        mov fs,ax

        mov bp,Msg
        mov cx,3      ;3个字符 (chars:3)
        mov ax,0x1301
        mov bx,0x0007 ;第0页,黑底白字 (Page:0,Background color:black)
        mov dx,0x0000 ;行,列 (row and col)
        int 0x10

        ;接下来要寻找活动分区
        ;只管第一分区
        .check_part1:
            cmp byte [part1 + 0],0x80
            jnz .part2 ;第一分区不是活动分区,看看第二分区
            cmp byte [part1 + 4],0x95 ;分区类型,0x95是EPFS
            jnz .part2 ;第一分区不是EPFS,看看第二分区
            ;到了这里,就说明第一分区可引导,马上加载引导程序
            mov eax,[part1 + 8] ;分区起始lba扇区号
            jmp .load_boot
        .check_part2:;暂时不管第二分区
            mov ax,0xb800
            mov gs,ax
        mov byte [gs: 0x00],'E'
        mov byte [gs: 0x01],0x04
            jmp $
        .load_boot
            mov cx,1 ;1扇区
            mov bx,0x7c0
            mov es,bx
            mov bx,0
            call ReadSector
            jmp 0x07c0:0x0000

;Function: ReadSector
;参数 (Input):
;eax   :扇区号(Sector Number)
;cx    :要读取的扇区数
;es:bx :读取到的数据存放处
;dl    :驱动器号,0x00~0x7f:软盘 0x80~0xff:硬盘
ReadSector:
    ;为物理机准备的版本:
    %ifdef __BOOT_ON_PHY_MACHINE__
        .ReadOneSector:
            ;备份寄存器
            push dword eax
            push bx
            push dx
            push es
            mov word  [DiskAddressPacket + 2],1  ;一次一扇区
            mov word  [DiskAddressPacket + 4],bx ;看ReadSector和DiskAddressPacket的说明
            mov word  [DiskAddressPacket + 6],es ;同上
            mov dword [DiskAddressPacket + 8],eax;同上
            mov dl,DrvNum ;驱动器号
            mov ah,0x42
            mov si,DiskAddressPacket
            int 0x13
            ;恢复寄存器
            pop es
            pop dx
            pop bx
            pop dword eax
            inc eax
            add bx,512 ;下512字节
            loop .ReadOneSector
            ret
    %endif
    ;为虚拟机准备的版本
    %ifdef __BOOT_ON_VIR_MACHINE__
        push bp
        mov bp,sp
        sub esp,2
        mov byte [bp - 2],cl ;要读入的扇区数
        push bx ;备份
        ;将LBA模式转换为CHS模式
        ;LBA扇区号/每磁道扇区数
        ;商 >> 1 = 柱面(磁道)号
        ;商 & 1 = 磁头号
        ;余数 + 1 = 扇区号
        mov bl,SecPerCyc
        div bl    ;被除数:ax,除数:bl,商:al,余数:ah
        inc ah    ;余数 + 1 = 扇区号
        mov cl,ah ;cl是扇区号
        mov dh,al ;暂时用dh保存商
        shr al,1  ;商 >> 1 = 柱面(磁道)号
        mov ch,al ;ch是柱面(磁道)号
        and dh,1  ;商 & 1 = 磁头号
        pop bx    ;恢复bx
        mov dl,DrvNum;驱动器号
        .readloop:
            mov ah,0x02
            mov al, byte [bp - 2]
            int 0x13
            jc .readloop
        add esp,2
        pop bp
        ret
    %endif

align 4
DiskAddressPacket:
    db 0x10 ;+ 0 硬盘地址包大小     (Size of DiskAddressPacket(bytes))
    db 0    ;+ 1 保留,必须为0       (Reserved,must be 0)
    dw 0    ;+ 2 扇区数             (Sector Count)
    dw 0    ;+ 4 传送缓冲区偏移地址 (buf(offset))
    dw 0    ;+ 6 传送缓冲区基地址   (buf(seg))
    dq 0    ;+ 8 扇区起始号(LBA模式)(Start Sector number(LBA mode))
    dq 0    ;+10 64位缓冲区地址拓展 (未始用)(64-bit buffer address extension(unusing))

Msg db "MBR"
times 446 - ($ - $$) db 0
;硬盘分区表
part1:
    db 0x80 ;活动分区标记
    db 0
    db 0
    db 0
    db 0x95 ;分区类型:0x95,是Pencil-Kernel使用的EPFS
    db 0
    db 0
    db 0
    dd 0x3f
    dd ((64*1024*1024)/512) - 0x3f ;分区大小
times 510 - ($ - $$) db 0;这段空间会被硬盘分区表填充
db 0x55,0xaa
