;Pencil-Kernel mbr
;给硬盘使用的,软盘引导的话就不用写入这个文件.

;大致的执行过程:
; 1. 初始化寄存器
; 2. 把自己搬到0x7f00地址处(搬到哪无所谓,主要是腾出0x7c00~0x7eff这512字节)
; 3. 寻找可引导分区,把分区前512字节加载到0x7c00地址处
; 4. 跳转到0x7c00,mbr结束

org 0x7c00
[bits 16]
Start:
    
;Function: ReadSector
;参数 (Input):
;eax   :扇区号(Sector Number)
;cx    :要读取的扇区数
;es:bx :读取到的数据存放处
;dx    :驱动器号,0x00~0x7f:软盘 0x80~0xff:硬盘
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
    dd ((64*1024*1024)/512)
times 510 - ($ - $$) db 0;这段空间会被硬盘分区表填充
db 0x55,0xaa
