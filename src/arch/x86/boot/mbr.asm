;Pencil-Kernel mbr
;给硬盘使用的,软盘引导的话就不用写入这个文件.

org 0x7c00

times 446 - ($ - $$) db 0;硬盘分区表
part1:
    db 0x80 ;活动分区标记
    db 0
    db 0
    db 0
    db 0x95 ;分区类型:0x95,是Pencil-Kernel使用的EPFS
    db 0
    db 0
    db 0
    dd 0x3f
    dd ((64*1024*1024)/512)
times 510 - ($ - $$) db 0;这段空间会被硬盘分区表填充
db 0x55,0xaa
