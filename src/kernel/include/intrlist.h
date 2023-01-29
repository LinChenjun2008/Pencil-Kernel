INTR_HANDLER(asm_intr0x00_handler,0x00, pushq $0)
INTR_HANDLER(asm_intr0x01_handler,0x01, pushq $0)
INTR_HANDLER(asm_intr0x02_handler,0x02, pushq $0)
INTR_HANDLER(asm_intr0x03_handler,0x03, pushq $0)
INTR_HANDLER(asm_intr0x04_handler,0x04, pushq $0)
INTR_HANDLER(asm_intr0x05_handler,0x05, pushq $0)
INTR_HANDLER(asm_intr0x06_handler,0x06, pushq $0)
INTR_HANDLER(asm_intr0x07_handler,0x07, pushq $0)
INTR_HANDLER(asm_intr0x08_handler,0x08,      nop)
INTR_HANDLER(asm_intr0x09_handler,0x09, pushq $0)
INTR_HANDLER(asm_intr0x0a_handler,0x0a,      nop)
INTR_HANDLER(asm_intr0x0b_handler,0x0b,      nop)
INTR_HANDLER(asm_intr0x0c_handler,0x0c, pushq $0)
INTR_HANDLER(asm_intr0x0d_handler,0x0d,      nop)
INTR_HANDLER(asm_intr0x0e_handler,0x0e,      nop)
INTR_HANDLER(asm_intr0x0f_handler,0x0f, pushq $0)
INTR_HANDLER(asm_intr0x10_handler,0x10, pushq $0)
INTR_HANDLER(asm_intr0x11_handler,0x11,      nop)
INTR_HANDLER(asm_intr0x12_handler,0x12, pushq $0)
INTR_HANDLER(asm_intr0x13_handler,0x13, pushq $0)
INTR_HANDLER(asm_intr0x14_handler,0x14, pushq $0)
INTR_HANDLER(asm_intr0x15_handler,0x15, pushq $0)
INTR_HANDLER(asm_intr0x16_handler,0x16, pushq $0)
INTR_HANDLER(asm_intr0x17_handler,0x17, pushq $0)
INTR_HANDLER(asm_intr0x18_handler,0x18,      nop)
INTR_HANDLER(asm_intr0x19_handler,0x19, pushq $0)
INTR_HANDLER(asm_intr0x1a_handler,0x1a,      nop)
INTR_HANDLER(asm_intr0x1b_handler,0x1b,      nop)
INTR_HANDLER(asm_intr0x1c_handler,0x1c, pushq $0)
INTR_HANDLER(asm_intr0x1d_handler,0x1d,      nop)
INTR_HANDLER(asm_intr0x1e_handler,0x1e,      nop)
INTR_HANDLER(asm_intr0x1f_handler,0x1f, pushq $0)

INTR_HANDLER(asm_intr0x20_handler,0x20, pushq $0) // 时钟中断对应的入口
INTR_HANDLER(asm_intr0x21_handler,0x21, pushq $0) // 键盘中断对应的入口
INTR_HANDLER(asm_intr0x22_handler,0x22, pushq $0) // 级联用的
INTR_HANDLER(asm_intr0x23_handler,0x23, pushq $0) // 串口2对应的入口
INTR_HANDLER(asm_intr0x24_handler,0x24, pushq $0) // 串口1对应的入口
INTR_HANDLER(asm_intr0x25_handler,0x25, pushq $0) // 并口2对应的入口
INTR_HANDLER(asm_intr0x26_handler,0x26, pushq $0) // 软盘对应的入口
INTR_HANDLER(asm_intr0x27_handler,0x27, pushq $0) // 并口1对应的入口
INTR_HANDLER(asm_intr0x28_handler,0x28, pushq $0) // 实时时钟对应的入口
INTR_HANDLER(asm_intr0x29_handler,0x29, pushq $0) // 重定向
INTR_HANDLER(asm_intr0x2a_handler,0x2a, pushq $0) // 保留
INTR_HANDLER(asm_intr0x2b_handler,0x2b, pushq $0) // 保留
INTR_HANDLER(asm_intr0x2c_handler,0x2c, pushq $0) // ps/2鼠标
INTR_HANDLER(asm_intr0x2d_handler,0x2d, pushq $0) // fpu浮点单元异常
INTR_HANDLER(asm_intr0x2e_handler,0x2e, pushq $0) // 硬盘
INTR_HANDLER(asm_intr0x2f_handler,0x2f, pushq $0) // 保留