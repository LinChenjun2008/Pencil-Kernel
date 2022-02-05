;Pencil-Kernel mbr
;给硬盘使用的,软盘引导的话就不用写入这个文件.

org 0x7c00

times 446 - ($ - $$) db 0;硬盘分区表
times 510 - ($ - $$) db 0;其实不写这个也没关系,这段空间会被硬盘分区表填充
db 0x55,0xaa
