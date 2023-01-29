include config.txt

# 编译所有文件
%.o: %.c
	@$(ECHO) compile $*.c
	@$(CC) -Wall -Wextra -Werror $(INCLUDE_DIR) -nostdlib -nostdinc \
	-finput-charset=UTF-8 -fexec-charset=UTF-8 \
	-fno-builtin -fno-strict-aliasing -fpic -fpie -mno-red-zone \
	-m64 -mcmodel=large -march=x86-64 \
	-Os -c -o $*.o $*.c -g

# 链接内核文件
%.sys: $(KERNEL_SRC:c=o)
	@$(ECHO) linking...
	@$(LD) -T $(KERNEL_LDS) -Map $(KERNEL_DIR)kernel.map -o $(KERNEL_OBJ) $^
	@$(OBJCOPY) -I $(KERNEL_OBJ_FORMAT) --strip-debug -S -R ".eh_frame" -R ".comment" -O $(KERNEL_OUTPUT_FORMAT) $(KERNEL_OBJ) $@

%.efi: $(UEFI_SRC) Makefile
	@$(ECHO) compile BootLoader...
	@$(CC) -Wall -Wextra  -Werror $(INCLUDE_DIR) -e UefiMain -nostdinc -nostdlib \
	-finput-charset=UTF-8 -fexec-charset=UTF-16 \
	-fno-builtin -Wl,--subsystem,10 -m64 -mcmodel=large -fpic -o $@ $(filter-out Makefile,$^)

.PHONY: uefi
uefi: $(UEFI_OUTPUT)

.PHONY: kernel
kernel: $(KERNEL_SRC:c=o) $(KERNEL_OUTPUT)

.PHONY: run
run: uefi kernel Makefile config.txt
	-@$(QEMU) -m 1024 -bios $(UEFI_BIOS) -drive file=fat:rw:$(DISK),index=0,format=vvfat -net none \
	-device nec-usb-xhci,id=xhci \
	-device usb-mouse \
	-no-shutdown \
	-monitor stdio

.PHONY: debug
debug: $(UEFI_OUTPUT) $(KERNEL_OUTPUT) Makefile config.txt
	-@$(QEMU) -m 1024 -bios $(UEFI_BIOS) -drive file=fat:rw:$(DISK),index=0,format=vvfat -net none \
	-device nec-usb-xhci,id=xhci \
	-device usb-mouse \
	-no-shutdown \
	-monitor stdio \
	-device usb-kbd -S -s

.PHONY: start-gdb
start-gdb:
	$(GDB) -quiet -n -x .gdbinit

.PHONY: install
install: $(REAL_UEFI_OUTPUT) $(REAL_KERNEL_OUTPUT)
	@echo [[[[[ Done. ]]]]]

.PHONY: uninstall
uninstall:
	$(RM) $(REAL_UEFI_OUTPUT) $(REAL_KERNEL_OUTPUT)

.PHONY: clean
clean:
	-$(RM) $(KERNEL_SRC:c=o) $(KERNEL_DIR)kernel.map
