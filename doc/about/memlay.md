内存布局
=
[返回目录](dir.md)
***
# 实模式
|起始地址 | 结束地址 | 大小 | 用途 |
|--------|--------|------|-----|
| FFFF0 | FFFFF | 16B | BIOS入口地址 (jmp 0xf000:0xe05b) |
| F0000 | FFFEF | 64KB-16B| 系统BIOS |
| C8000 | EFFFF | 160KB | 映射硬件适配器ROM或内存映射式io |
| C0000 | C7FFF | 32KB | 显示适配器BIOS |
| B8000 | BFFFF | 32KB | 文本模式显示适配器 |
| B0000 | B7FFF | 32KB | 黑白显示适配器 |
| A0000 | AFFFF | 64KB | 彩色显示适配器 |
| 9FC00 | 9FFFF | 1KB | EBDA 拓展BIOS数据区 |
| 7E00 | 9FBFF | 622080B 约64KB | 可用区域 |
| 7C00 | 7DFF | 512B | boot.bin |
| 500 | 7BFF | 30646B 约30KB | 可用区域 |
| 400 | 4FF | 256B | BIOS数据区 |
| 000 | 3FF | 1KB | 中断向量表 |
