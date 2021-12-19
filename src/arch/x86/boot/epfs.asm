jmp short start              ; 2B
nop                          ; 3B
Magic          db "EPFS01  " ; 8B
DiskSize       dw 
BytesPerSector dw 512


read_super_block:
    mov ax,0x00
    mov es,ax
    mov bx,0x8000;super_block的缓冲区
    mov ax,0x2
    mov cx,1
    call read_sector
    mov RootDirStart,[bx:(4*7)]
    jmp $

RootDirStart dw 0x0000
