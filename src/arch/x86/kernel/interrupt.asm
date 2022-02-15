[bits 32]

extern intr0x20_handler

section .text
    global asm_intr0x20_handler
    asm_intr0x20_handler:
        push es
        push ds
        pushad
        mov eax,esp
        push eax
        mov ax,ss
        mov ds,ax
        mov es,ax
        call intr0x20_handler
        pop eax
        popad
        pop ds
        pop es
        iretd

section .data
    global intr_entry_table
    intr_entry_table:
        times 0x2f dd 0
