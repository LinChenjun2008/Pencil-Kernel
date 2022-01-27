[bits 32]
section .data
    global intr_entry_table
    intr_entry_table:
        dd intr0x00_entry
        dd intr0x01_entry
        dd intr0x02_entry
        dd intr0x03_entry
        dd intr0x04_entry
        dd intr0x05_entry
        dd intr0x06_entry
        dd intr0x07_entry
        dd intr0x08_entry
        dd intr0x09_entry
        dd intr0x0a_entry
        dd intr0x0b_entry
        dd intr0x0c_entry
        dd intr0x0d_entry
        dd intr0x0e_entry
        dd intr0x0f_entry

        dd intr0x10_entry
        dd intr0x11_entry
        dd intr0x12_entry
        dd intr0x13_entry
        dd intr0x14_entry
        dd intr0x15_entry
        dd intr0x16_entry
        dd intr0x17_entry
        dd intr0x18_entry
        dd intr0x19_entry
        dd intr0x1a_entry
        dd intr0x1b_entry
        dd intr0x1c_entry
        dd intr0x1d_entry
        dd intr0x1e_entry
        dd intr0x1f_entry

        dd intr0x20_entry ;时钟中断
        dd intr0x21_entry ;键盘中断
        dd intr0x22_entry ;级联使用
        dd intr0x23_entry ;串口2
        dd intr0x24_entry ;串口1
        dd intr0x25_entry ;并口2
        dd intr0x26_entry ;软盘
        dd intr0x27_entry ;并口1
        dd intr0x28_entry ;实时时钟
        dd intr0x29_entry ;重定向
        dd intr0x2a_entry ;保留
        dd intr0x2b_entry ;保留
        dd intr0x2c_entry ;PS/2 鼠标
        dd intr0x2d_entry ;fpu浮点单元异常
        dd intr0x2e_entry ;硬盘
        dd intr0x2f_entry ;保留

section .text
extern idt_table
    global load_idt
    load_idt:
        push ebp
        mov ebp,esp
        lidt [ebp + 8]
        ret

%define ERROR_CODE nop ;有错误码了,不做处理
%define ZERO push 0    ;没有错误码,手动压入一个0

%macro VECTOR 2
    intr%1_entry:
        ; 保存上下文
        %2
        push ds
        push es
        push fs
        push gs
        pushad;PUSHAD指令压入32位寄存器,其入栈顺序是: EAX,ECX,EDX,EBX,ESP,EBP,ESI,EDI

        push %1 ;压入中断号
        call [idt_table + %1 * 4] ;调用C语言版的中断处理程序
        ;恢复上下文
        add esp,4; 跳过中断号
        popad
        pop gs
        pop fs
        pop es
        pop ds
        add esp,4; 跳过错误码
        iretd
%endmacro

VECTOR 0x00,ZERO
VECTOR 0x01,ZERO
VECTOR 0x02,ZERO
VECTOR 0x03,ZERO 
VECTOR 0x04,ZERO
VECTOR 0x05,ZERO
VECTOR 0x06,ZERO
VECTOR 0x07,ZERO 
VECTOR 0x08,ERROR_CODE
VECTOR 0x09,ZERO
VECTOR 0x0a,ERROR_CODE
VECTOR 0x0b,ERROR_CODE 
VECTOR 0x0c,ZERO
VECTOR 0x0d,ERROR_CODE
VECTOR 0x0e,ERROR_CODE
VECTOR 0x0f,ZERO 
VECTOR 0x10,ZERO
VECTOR 0x11,ERROR_CODE
VECTOR 0x12,ZERO
VECTOR 0x13,ZERO 
VECTOR 0x14,ZERO
VECTOR 0x15,ZERO
VECTOR 0x16,ZERO
VECTOR 0x17,ZERO 
VECTOR 0x18,ERROR_CODE
VECTOR 0x19,ZERO
VECTOR 0x1a,ERROR_CODE
VECTOR 0x1b,ERROR_CODE 
VECTOR 0x1c,ZERO
VECTOR 0x1d,ERROR_CODE
VECTOR 0x1e,ERROR_CODE
VECTOR 0x1f,ZERO 
VECTOR 0x20,ZERO	;时钟中断
VECTOR 0x21,ZERO	;键盘中断
VECTOR 0x22,ZERO	;级联使用
VECTOR 0x23,ZERO	;串口2
VECTOR 0x24,ZERO	;串口1
VECTOR 0x25,ZERO	;并口2
VECTOR 0x26,ZERO	;软盘
VECTOR 0x27,ZERO	;并口1
VECTOR 0x28,ZERO	;实时时钟
VECTOR 0x29,ZERO	;重定向
VECTOR 0x2a,ZERO	;保留
VECTOR 0x2b,ZERO	;保留
VECTOR 0x2c,ZERO	;PS/ 2鼠标
VECTOR 0x2d,ZERO	;fpu浮点单元异常
VECTOR 0x2e,ZERO	;硬盘
VECTOR 0x2f,ZERO	;保留
