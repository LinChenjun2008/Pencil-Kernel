;epfs.asm
;Copyright 2021-2022 Lin Chenjun,All rights reserved.

FileName: db "loader.bin     " ;文件名15B
RootDirSizeForLoop dw RootDirSectors
SectorNo dd 0 ;下一次要读取的扇区号
Index1 dd 0 ;一级间接索所在内存
Index2 dd 0 ;二级间接索所在内存
Index3 dd 0 ;三级间接索所在内存

start:
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
    int 0x10

    mov byte [gs:0x00],'B'
    mov byte [gs:0x01],0x07
    mov byte [gs:0x02],'O'
    mov byte [gs:0x03],0x07
    mov byte [gs:0x04],'O'
    mov byte [gs:0x05],0x07
    mov byte [gs:0x06],'T'
    mov byte [gs:0x07],0x07
    mov word ax,[RootDirStartSec]
    mov word [SectorNo],ax

SerchInRootDirBegin:
    cmp word [RootDirSizeForLoop],0;没有扇区可以读取,说明没有loader
    jz No_file
    dec word [RootDirSizeForLoop]  ;已读取扇区减一
    mov ax,0x00
    mov es,ax              ;段基址0
    mov bx,0x7e00          ;段偏移0x7e00
    mov word ax,[SectorNo] ;读取的扇区号
    call read16
    mov si,FileName
    mov di,0x7e00
    mov dx,0x8 ;一个扇区几个文件描述符

SerchFileName:
    cmp dx,0
    jz GoToNextSectorInRootDir
    dec dx,1
    mov cx,0xe

    push di;保存比较前的di值

CmpFileName:
    cmp cx,0
    jz FileFound
    dec cx
    lodsb    ;从ds:(r|e)si地址读取到al/ax/eax/rax寄存器
             ;读取后,根据DF标志位将(r|e)si寄存器的值减或加上读入的数据大小
             ;这里是把loader的文件名载入一个字符到al
    cmp al,byte [es:di] ;比较文件名
    jz CmpGoOn
    jmp FileNameDifferent

CmpGoOn:
    inc di         ;继续比较下一个字符
    jmp CmpFileName

FileNameDifferent:
    pop di;恢复比较前的di
    add di,64;下一个文件描述符文件名开始处
    jmp SerchFileName

NoFile:
    jmp $
