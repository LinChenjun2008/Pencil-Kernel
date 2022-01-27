;copyright Eytoue (Lin Chenjun)
;All rights reserved.

[bits 32]
section .text

;io端口操作函数

;uint32_t io_in8(uint32_t port);
global io_in8
io_in8:
    push ebp
    mov ebp,esp
    mov edx,[ebp + 8]
    mov eax,0
    in al,dx
    pop ebp
    ret

;uint32_t io_in16(uint32_t port);
global io_in16
io_in16:
    push ebp
    mov ebp,esp
    mov edx,[ebp + 8]
    mov eax,0
    in ax,dx
    pop ebp
    ret

;uint32_t io_in32(uint32_t port);
global io_in32
io_in32:
    push ebp
    mov ebp,esp
    mov edx,[esp + 8]
    mov eax,0
    in eax,dx
    pop ebp
    ret

;void io_out8(uint32_t port,uint32_t data);
global io_out8
io_out8:
    push ebp
    mov ebp,esp
    mov edx,[esp + 8]
    mov eax,[esp + 12]
    out dx,al
    pop ebp
    ret

;void io_out16(uint32_t port,uint32_t data);
global io_out16
io_out16:
    push ebp
    mov ebp,esp
    mov edx,[ebp + 8]
    mov eax,[ebp + 12]
    out dx,ax
    pop ebp
    ret

;void io_out32(uint32_t port,uint32_t data);
global io_out32
io_out32:
    push ebp
    mov ebp,esp
    mov edx,[esp + 8]
    mov eax,[esp + 12]
    out dx,eax
    pop ebp
    ret

global io_sti
io_sti:
    sti
    ret

global io_cli
io_cli:
    cli
    ret

global get_flages
get_flages:
    push ebp
    mov ebp,esp
    pushfd
    pop eax
    pop ebp
    ret