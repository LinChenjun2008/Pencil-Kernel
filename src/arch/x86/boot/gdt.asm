%macro DESC 3
    dw (%2 & 0xffff)
    dw (%1 & 0xffff)
    db ((%1 >> 16) & 0xff)
    db (%3 & 0xff)
    db (((%2 >> 16)& 0x0f) | ((%3 >> 8)& 0xf0))
    db ((%1 >> 24)& 0xff)
%endmacro
