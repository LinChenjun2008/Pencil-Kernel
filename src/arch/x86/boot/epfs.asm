read_super_block:
    mov ax,0x00
    mov es,ax
    mov bx,0x8000;super_block的缓冲区
    mov ax,0x2
    mov cx,1
    call read_sector

    jmp $
