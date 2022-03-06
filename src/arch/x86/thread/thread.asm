[bits 32]
section .text
    global switch_to
    switch_to:
        push esi
        push edi
        push ebx
        push ebp
        mov eax,[esp + ((4 * 4) + 4)]
        mov [eax],esp

        mov eax,[esp + ((4 * 4) + 8)]
        mov esp,[eax]
        pop ebp
        pop ebx
        pop edi
        pop esi
        ret
