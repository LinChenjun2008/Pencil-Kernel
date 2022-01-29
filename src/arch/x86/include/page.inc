;page.inc

PAGE_DIR_TABLE_POS equ 0x100000 ;页目录表存放在0x100000地址处

;属性
PG_P equ 0x1
PG_RW_R equ 0x0
PG_RW_W equ 0x2
PG_US_S equ 0x0
PG_US_U equ 0x4
