;Pencil-Kernel mbr
;给硬盘使用的,软盘引导的话就不用写入这个文件.

org 0x7c00

times 446 - ($ - $$) db 0
times 510 - ($ - $$) db 0
db 0x55,0xaa
