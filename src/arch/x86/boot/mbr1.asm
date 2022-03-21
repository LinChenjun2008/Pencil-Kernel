boot_bz equ 0x7dbe;第一分区项引导标志的内存地址
data_fqsj equ 0x7000;保存主引导分区信息的数据段
org 0x7c00
    start:;主引导代码
    ;获取当前引导设备的设备号
        mov byte [data_fqsj+4],dl
        ;获取第一分区项引导标志的地址 [ds:di]
        mov bx, boot_bz
        mov ch, 1
        pd_boot:
            cmp ch, 4
            jg boot_error;如果没找到主引导分区就抱引导错误
        mov di, bx
        mov ax, 0x00
        mov ds, ax
        ;判断是否是引导扇区
        mov ah, byte [ds:di]
        cmp ah, 0x80
        je boot_fq;如果是引导分区则引导
        jne fq_add;如果不是引导分区则判断下一个分区
        jmp boot_error
        fq_add:;获取下一个分区项引导标志的内存地址
            add bx, 16
            add ch, 1
            jmp pd_boot
        boot_fq:;进入引导,得到了ch存储的是主引导分区的分区项，bx主引导扇区分区项的所在地址
            call fqxx;获取分区信息
            call hq_xx;获取其他信息
            call read;读取分区的第一扇区
            jmp 0x00:0x7e00;进入分区引导
read:;读取分区的第一扇区
push ax
push bx
push cx
push dx
push es
push ds
mov ax, 0x07e0
mov es, ax
mov ax, 0x00
mov ds, ax
mov ch, byte [ds:data_fqsj+2]
mov dh, byte [ds:data_fqsj]
mov cl, byte [ds:data_fqsj+1]
mov ah, 0x02
mov al, 1
mov bx, 0x00
mov dl, byte [ds:data_fqsj+4]
int 0x13
pop ds
pop es
pop dx
pop cx
pop bx
pop ax
ret
boot_error:;引导错误
mov ax, 0xb800
mov ds, ax
mov byte [ds:0x00], 'E'
mov byte [ds:0x01], 0x07
mov byte [ds:0x02], 'r'
mov byte [ds:0x03], 0x07
mov byte [ds:0x04], 'r'
mov byte [ds:0x05], 0x07
mov byte [ds:0x06], 'o'
mov byte [ds:0x07], 0x07
mov byte [ds:0x08], 'r'
mov byte [ds:0x09], 0x07
jmp boot_error
fqxx:;读取分区信息
push ax
push bx
push cx
push dx
;段寄存器初始化
mov ax, 0x00
mov ds, ax
;得到分区的起始位置磁头
add bx, 1
mov dl, byte [ds:bx]
mov byte [ds:data_fqsj], dl
;得到分区的起始位置扇区
add bx, 1
mov dl, byte [ds:bx]
mov byte [ds:data_fqsj+1], dl
;得到分区的起始位置柱面
add bx, 1
mov dl, byte [ds:bx]
mov byte [ds:data_fqsj+2], dl
pop dx
pop cx
pop bx
pop ax
ret
hq_xx:;获取其他信息
ret
;mbr分区表
times 446-($-$$) db 0
;第一分区项
db 0x00
db 0x00, 0x00, 0x00
db 0x00
db 0x00, 0x00, 0x00
db 0x00, 0x00, 0x00, 0x00
db 0x00, 0x00, 0x00, 0x00
;第二分区项
db 0x80
db 0x00, 0x07, 0x00
db 0xff
db 0x01, 0xff, 0xff
db 0x00, 0x00, 0x00, 0x06
db 0x00, 0x00, 0xfb, 0xbb
;第三分区项
db 0x00
db 0x00, 0x00, 0x00
db 0x00
db 0x02, 0x00, 0x00
db 0x00, 0x00, 0x00, 0x00
db 0x00, 0x00, 0x00, 0x00
;第四分区项
db 0x02
db 0x05, 0x01, 0x02
db 0x02
db 0x02, 0x01, 0x00
db 0x02, 0x02, 0xfc, 0x05
db 0x02, 0x01, 0xf7, 0x82
;引导扇区有效标志
times 510-($-$$) db 0
db 0x55, 0xaa
