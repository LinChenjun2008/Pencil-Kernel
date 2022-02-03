# 文件说明
## x86
### boot/
如果要在物理机上启动系统,需要在include/boot.inc中设置.
在编译时请使用boot3.asm,而不是boot.asm
#### boot.asm
这是初代的boot,现在已经不用了,不舍得删,所以留下来了.不要用这个来引导.
### include/
#### boot.inc
boit.inc是启动阶段的配置文件,用于决定平台(虚拟机还是物理机),
驱动器(磁盘还是软盘),等等.有些设置要和config.h和global.h一致,
所以要同时修改这三个文件.
