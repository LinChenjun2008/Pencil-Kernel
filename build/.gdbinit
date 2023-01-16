target remote localhost:1234
file ../kernel/kernel.o
b kernel_main

define regs
    info registers
end

define r
    info register $arg0
end

define dis
    disassemble $pc
end