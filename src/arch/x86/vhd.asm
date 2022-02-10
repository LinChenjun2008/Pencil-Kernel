cyclinders equ 130
heands equ 16
spt equ 63

;磁盘容量计算公式:
;spt * cyclinders * 512 * heands
times (spt * cyclinders * 512 * heands) db 0