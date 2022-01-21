# Pencil-Kernel Makefile

# tools
TOOLPATH := ../../../tools/
AS := $(TOOLPATH)as
CC1 := $(TOOLPATH)cc1
DD := $(TOOLPATH)dd
LD := $(TOOLPATH)ld
MAKE := $(TOOLPATH)make
NASM := $(TOOLPATH)nasm
OBJCOPY :=$(TOOLPATH)objcopy
#IMGCOPY := $(TOOLPATH)/imgcopy/imgcopy

#src path
BOOTPATH := boot/
BUILD_DIR := build
INCLUDE := include/
KERNELPATH := kernel/
LIB := lib/
#exec
BOOT := $(BOOTPATH)boot.bin
LOADER := $(BOOTPATH)loader.bin

#obj
LIBS := $(LIB)bitmap.co $(KERNELPATH)debug.co $(LIB)list.co $(LIB)string.co 
OBJ_FILE := $(KERNELPATH)start.ao $(KERNELPATH)main.co $(LIBS)
KERNEL_OBJ_FILE := $(BUILD_DIR)/kernel.o
KERNEL := $(BUILD_DIR)/kernel.bin
#file
v_disk := a.img

#other
OBJ_FORMAT := elf32-i386
K_VERSION := 0.0.0 test
COPYRIGHT := copyright 2021-2022 Linchenjun, All right reserved.
#command
COPY := copy
CD := cd
DELET := del
ECHO := echo
MAKE_DIR := md
#.asm to .bin
%.bin: %.asm
	@$(ECHO) -----------
	@$(ECHO) --- compile $<
	@$(ECHO) -----------
	$(NASM) -I $(INCLUDE) -I ../ -o $*.bin $*.asm
#.asm to .ao (elf)
%.ao: %.asm
	@$(ECHO) -----------
	@$(ECHO) --- compile $<
	@$(ECHO) -----------
	$(NASM) -f elf -I $(INCLUDE) -I ../ -o $*.ao $*.asm

#.c to .co (elf)
%.co: %.c
	@$(ECHO) -----------
	@$(ECHO) --- compile $<
	@$(ECHO) -----------
	$(CC1) -I $(INCLUDE) -I ../ -Os -Wall -quiet -fno-builtin -o $*.s $*.c
	$(AS) -I $(INCLUDE) -I ../ -o $*.co $*.s

#command:
#all: make all
#mkdir: make build/ dir
#mkvhd: make a virtual disk
#build: compile all file
#run: start qenu
#clean: delet all obj file
.PHONY: all build clean logo mkdir mkvhd run system
all: $(BOOT) $(LOADER) $(OBJ_FILE)

build: all system
	$(DD) if=$(BOOT) of=$(v_disk) bs=512 count=1 conv=notrunc
	$(DD) if=$(LOADER) of=$(v_disk) bs=512 count=200 seek=2 conv=notrunc

clean:
	$(CD) $(BOOTPATH) && $(DELET) *.bin
	$(CD) $(BUILD_DIR) && $(DELET) *.bin
	$(CD) $(BUILD_DIR) && $(DELET) *.o
	$(CD) $(KERNELPATH) && $(DELET) *.ao
	$(CD) $(KERNELPATH) && $(DELET) *.co
	$(CD) $(KERNELPATH) && $(DELET) *.s
	$(CD) $(LIB) && $(DELET) *.ao
	$(CD) $(LIB) && $(DELET) *.co
	$(CD) $(LIB) && $(DELET) *.s

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
	$(COPY) $(v_disk) ..\..\..\tools\qemu\fdimage0.bin
	$(TOOLPATH)qemu\qemu-system-i386 -m 32 -drive file=$(v_disk),index=0,if=floppy,format=raw -boot a

system: mkdir $(OBJ_FILE)
	@$(ECHO) --------------------------
	@$(ECHO) --- link Pencil-kernel ---
	@$(ECHO) --------------------------

	$(LD) -b $(OBJ_FORMAT) -z muldefs -o $(KERNEL_OBJ_FILE) $(OBJ_FILE) -T kernel.lds
	$(OBJCOPY) -I $(OBJ_FORMAT) -S -R ".eh_frame" -R ".comment" -O binary $(KERNEL_OBJ_FILE) $(KERNEL)
	
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

	@$(ECHO) --------------------------
	@$(ECHO) --- Pencil-kernel      ---
	@$(ECHO) --------------------------
	@$(ECHO) version: $(K_VERSION)
	@$(ECHO) $(COPYRIGHT)
	@$(ECHO) --------------------------