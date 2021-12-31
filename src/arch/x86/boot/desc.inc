;desc.inc
;Copyright 2021-2022 Lin Chenjun,All rights reserved.

AR_P_0 equ 0x00
AR_P_1 equ 0x80

AR_DPL_0 equ 0x00
AR_DPL_1 equ 0x20
AR_DPL_2 equ 0x40
AR_DPL_3 equ 0x60

;DESC
;%1:段基址 %2:段界限 %3:属性
;属性:
;高8位: G D/B L AVL 0
;      1B 1B 1B 1B 4B

;低8位: P DPL S type
;      1B 2B 1B 4B

%macro SEGMDESC 3
    dw (%2 & 0xffff)      ;段界限15～0
    dw (%1 & 0xffff)      ;段基址15～0
    db ((%1 >> 16) & 0xff);段基址23～16
    db (%3 & 0xff)        ;段属性 (P, DPL, S, TYPE)
    db (((%2 >> 16) & 0x0f) | ((%3 >> 8) & 0xf0)) ;段界限19～16(低位) 和段属性(G, D/B, L, AVL)
    db ((%1 >> 24) & 0xff)                       ;段基址31～24
%endmacro

;GATE
;%1:目表代码段选择子 %2:偏移 %3:属性
%macro GATEDESC 3
    dw (%2 & 0xffff) ;偏移15~0
    dw (%1 & 0xffff) ;选择子
    db 0             ;保留值3B 空值5B
    db (%3 & 0xef)         ;P(1) DPL(2) 0(1) type(4)
    dw (%2 >> 15) & 0xffff);偏移31~16
%endmacro
