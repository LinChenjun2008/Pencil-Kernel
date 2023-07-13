# Pencil-Kernel
#### 介绍
64位,支持UEFI引导的Pencil-Kernel
#### 编译工具
[Windows工具](https://gitee.com/LinChenjun2008/pencil_build/)
#### 安装步骤
* 寻找一个空U盘作为启动盘,格式化为FAT类文件系统.
* 在根目录下创建`EFI`目录,然后在`EFI`文件夹中创建`Boot`目录.
* 在根目录下创建`Kernel`目录,然后在`Kernel`目录中创建`resource`目录.
* 将一个ttf字库重命名为`typeface.ttf`,并放在`Kernel/resource/`目录中.
* 打开项目目录的`build/config.txt`,将`PHYSICAL_DISK = `后改为启动盘的卷标.
* 在`build/`下打开终端,运行`make install`.当出现成功的提示后安装完成.