# Pencil_Kernel
#### 介绍
支持UEFI引导的Pencil-Kernel
#### 编译环境
##### 编译器
使用GCC编译<br />
Windows下,可以用`Mingw`编译UEFI程序和内核.<br />
Linux下编译UEFI需要用交叉编译器.<br />
```bash
sudo apt install gcc-mingw-w64-x86-64
```
#### 编译命令
##### UEFI
```bash
# $(CC)为编译器,$(INCLUDE_DIR)是uefi所用头文件目录,$(ENTRY_POINT)为UEFI入口地址(UefiMain)
# $(OUTPUT)是编译后的efi程序(BootX64.efi),$(SRC)为源代码
$(CC) -Wall -Wextra -I$(INCLUDE_DIR) -e $(ENTRY_POINT) -nostdinc -nostdlib \
        -finput-charset=UTF-8 -fexec-charset=UTF-16 \
        -fno-builtin -Wl,--subsystem,10 -m64 -mcmodel=large -o $(OUTPUT) $(SRC)
```
##### Kernel
```bash
# Kernel
# $(CC)为编译器,$(INCLUDE_DIR)是所用头文件的目录,
# $(OBJ)是编译后的内核程序,$(SRC)为源代码
# -c :只编译,不链接
# -fPIC :使生成的程序可以被加载到任意地址

$(CC) -Wall -Wextra -I$(INCLUDE_DIR) -e $(KERNEL_ENTRY_POINT) -nostdlib -nostdinc \
-finput-charset=UTF-8 -fexec-charset=UTF-8 \
-fno-builtin -fno-strict-aliasing \
-D__COMPILE_DATE__=\"$(shell echo %date:~0,4%%date:~5,2%%date:~8,2%)\" \
-m64 -mcmodel=large -march=x86-64 -Ttext 0x100000 -O0 -o $@ $(SRC)

# 制作为纯二进制格式
# $(OBJ_FORMAT)为内核文件格式(pe-x86-64)
# $(OUTPUT_FORMAT) 是最终输出文件的格式(binary)
$(OBJCOPY) -I $(OBJ_FORMAT) -S -O $(OUTPUT_FORMAT) $(OBJ) $(OUTPUT)
```
#### 运行(以U盘为例)
1.先格式化为FAT32/16/12文件系统.(如果原来就是FAT32/16/12文件系统,则可以跳过此步骤)<br />
2.在根目录下创建EFI目录,然后在EFI文件夹中创建Boot目录<br />
3.将编译后的程序命名为`BootX64.efi`,复制进(2)中创建的Boot文件夹中<br />
4.将编译后的kernel.sys复制到根目录下.<br />
5.在根目录下创建`BootConfig.txt`,并输入以下内容:
```
.x=1920
.y=1018
.kernel = "kernel.sys"
.typeface = "typeface.sys"
```
需要保存为UTF-16 LE 格式.
其中,`.x`和`.y`设置分辨率,`.kernel`指定内核文件.
6.将符合utf-8编码的16*16点阵字库命名为`BootConfig.txt`中设定的文件名,并复制到根目录下.<br />
7.从U盘启动即可.<br />