# Pencil-Kernel Makefile

# tools
TOOL_DIR := ../../../tools/
AS := $(TOOL_DIR)as
CC1 := $(TOOL_DIR)cc1
DD := $(TOOL_DIR)dd
GCC := $(TOOL_DIR)gcc
LD := $(TOOL_DIR)ld
MAKE := $(TOOL_DIR)make
NASM := $(TOOL_DIR)nasm
OBJCOPY :=$(TOOL_DIR)objcopy
OBJDUMP :=$(TOOL_DIR)objdump
#IMGCOPY := $(TOOL_DIR)/imgcopy/imgcopy

#src path
BOOT_DIR := boot/
BUILD_DIR := build
DEVICE_DIR := device/
GRAPHIC_DIR := graphic/
INCLUDE_DIR := include/
KERNEL_DIR := kernel/
LIB_DIR := lib/
THREAD_DIR := thread/

#exec
MBR := $(BOOT_DIR)mbr.bin
BOOT := $(BOOT_DIR)boot.bin
LOADER := $(BOOT_DIR)loader.bin

#obj
LIBS := $(LIB_DIR)bitmap.co \
$(KERNEL_DIR)debug.co       \
$(LIB_DIR)fifo.co           \
$(LIB_DIR)font.co           \
$(GRAPHIC_DIR)graphic.co    \
$(KERNEL_DIR)init.co        \
$(KERNEL_DIR)interrupt.ao   \
$(KERNEL_DIR)interrupt.co   \
$(LIB_DIR)list.co           \
$(KERNEL_DIR)memory.co      \
$(LIB_DIR)print.ao          \
$(LIB_DIR)string.co         \
$(THREAD_DIR)thread.ao      \
$(THREAD_DIR)thread.co      \
$(DEVICE_DIR)time.co        \
$(DEVICE_DIR)timer.co

OBJ_FILE := $(KERNEL_DIR)start.ao $(KERNEL_DIR)main.co $(LIBS)
KERNEL_OBJ_FILE := $(BUILD_DIR)/kernel.o
KERNEL := $(BUILD_DIR)/kernel.bin
#file
v_disk := a.img

#other
OBJ_FORMAT := elf32-i386
K_VERSION := 0.0.0 test
COPYRIGHT := Copyright 2021-2022 LinChenjun
#command
COPY := copy
CD := cd
DELET := del
ECHO := echo
MAKE_DIR := md

#.asm to .bin
%.bin: %.asm $(INCLUDE_DIR)boot.inc
	@$(ECHO) -----------
	@$(ECHO) --- compile $<
	@$(ECHO) -----------
	$(NASM) -I $(INCLUDE_DIR) -I ../ -o $*.bin $*.asm

#.asm to .ao (elf)
%.ao: %.asm
	@$(ECHO) -----------
	@$(ECHO) --- compile $<
	@$(ECHO) -----------
	$(NASM) -f elf -I $(INCLUDE_DIR) -I ../ -o $*.ao $*.asm

#.c to .co (elf)
# cc1 参数说明:
# -fno-builtin: 不识别内建函数
# -m32: 编译32位代码
# -Os:启用优化,优化等级介于-O2和-O3之间
# -quiet: 不显示多余的信息?
# -Wall:发出警告

%.co: %.c
	@$(ECHO) -----------
	@$(ECHO) --- compile $<
	@$(ECHO) -----------
	$(CC1) -I $(INCLUDE_DIR) -I ../  -fno-builtin -m32 -Os -quiet -Wall  -o $*.s $*.c
	$(AS) -I $(INCLUDE_DIR) -I ../ -o $*.co $*.s

#command:
#all: make all
#build: compile all file
#clean: delet all obj file
#debug: debug kernel
#dump
#mkdir: make build/ dir
#run: start qenu
#vhd: make a virtual disk

.PHONY: all build clean debug dump logo mkdir run system  vhd
all: $(BOOT) $(LOADER) $(OBJ_FILE) $(v_disk)

build: all system $(v_disk)
	$(DD) if=$(LOADER) of=$(v_disk) bs=512 count=7 seek=65 conv=notrunc
	$(DD) if=$(KERNEL) of=$(v_disk) bs=512 count=200 seek=72 conv=notrunc

clean:
	$(CD) $(BOOT_DIR) && $(DELET) *.bin
	$(CD) $(BUILD_DIR) && $(DELET) *.bin
	$(CD) $(BUILD_DIR) && $(DELET) *.o
	$(CD) $(DEVICE_DIR) && $(DELET) *.s
	$(CD) $(DEVICE_DIR) && $(DELET) *.co
	$(CD) $(GRAPHIC_DIR) && $(DELET) *.s
	$(CD) $(GRAPHIC_DIR) && $(DELET) *.co
	$(CD) $(KERNEL_DIR) && $(DELET) *.ao
	$(CD) $(KERNEL_DIR) && $(DELET) *.co
	$(CD) $(KERNEL_DIR) && $(DELET) *.s
	$(CD) $(LIB_DIR) && $(DELET) *.ao
	$(CD) $(LIB_DIR) && $(DELET) *.co
	$(CD) $(LIB_DIR) && $(DELET) *.s
	$(CD) $(THREAD_DIR) && $(DELET) *.ao
	$(CD) $(THREAD_DIR) && $(DELET) *.co
	$(CD) $(THREAD_DIR) && $(DELET) *.s

debug: build
#	$(TOOL_DIR)qemu-new\qemu-system-i386 -m 512M -drive file=$(v_disk),index=0,if=floppy,format=raw -boot a -S
	$(TOOL_DIR)qemu-new\qemu-system-i386 -m 512M -drive file=$(v_disk),index=0,media=disk,format=raw -boot c -S

dump: $(KERNEL_OBJ_FILE)
#	$(OBJDUMP) -D $(KERNEL_OBJ_FILE) -M intel > $(BUILD_DIR)/kernel.dmp
	..\..\..\tools\objdump -D $(KERNEL_OBJ_FILE) -M intel > $(BUILD_DIR)/kernel.asm

img: img.asm
	$(NASM) -o $(v_disk) img.asm

logo:
	@$(ECHO) .................
	@$(ECHO) . ############# .
	@$(ECHO) . #           # .
	@$(ECHO) . #           # .
	@$(ECHO) . #           # .
	@$(ECHO) . #   #####   # .
	@$(ECHO) . #   #   #   # .
	@$(ECHO) . #   #   #   # .
	@$(ECHO) . #   #   #   # .
	@$(ECHO) . #########   # .
	@$(ECHO) . ##  #       # .
	@$(ECHO) . # # #       # .
	@$(ECHO) . #  ##       # .
	@$(ECHO) . ############# .
	@$(ECHO) .................

mkdir:
#	if [[ ! -d $(BUILD_DIR) ]];then $(MAKE_DIR) $(BUILD_DIR);fi
	-$(MAKE_DIR) $(BUILD_DIR)

mkvd:
	$(NASM) -o $(v_disk) vhd.asm

run: build
#	$(TOOL_DIR)qemu-new\qemu-system-i386 -m 512M -drive file=$(v_disk),index=0,if=floppy,format=raw -boot a
	$(TOOL_DIR)qemu-new\qemu-system-i386 -m 512M -drive file=$(v_disk),index=0,media=disk,format=raw -boot c

system: mkdir $(OBJ_FILE)
	@$(ECHO) --------------------------
	@$(ECHO) --- link Pencil-kernel ---
	@$(ECHO) --------------------------

	$(LD) -b $(OBJ_FORMAT) -z muldefs -o $(KERNEL_OBJ_FILE) $(OBJ_FILE) -T kernel.lds
	$(OBJCOPY) -I $(OBJ_FORMAT) -S -R ".eh_frame" -R ".comment" -O binary $(KERNEL_OBJ_FILE) $(KERNEL)

	@$(ECHO) --------------------------
	@$(ECHO) --- Pencil-kernel      ---
	@$(ECHO) --------------------------
	@$(ECHO) version: $(K_VERSION)
	@$(ECHO) $(COPYRIGHT)
	@$(ECHO) --------------------------

vhd: vhd.asm $(BOOT) $(LOADER)
	$(NASM) -o $(v_disk) vhd.asm
	$(DD) if=$(BOOT) of=$(v_disk) bs=512 count=1 seek=0 conv=notrunc