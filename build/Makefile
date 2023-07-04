include config.txt

# 编译所有文件
%.o: %.c
	@$(ECHO) compile $*.c
	@$(CC)  $(INCLUDE_DIR) -nostdlib -nostdinc $(CFLAGS) -c -o $*.o $*.c

# 链接内核文件
%.sys: $(KERNEL_SRC:c=o)
	@$(ECHO) link
	@$(LD) -T $(KERNEL_LDS) -Map $(KERNEL_DIR)kernel.map --no-warn-rwx-segments -o $(KERNEL_OBJ) $^

	@$(NM) -n $(KERNEL_OBJ) > kernel.sym
	@$(KALLSYMS) kernel.sym kallsyms.c
	@$(CC) kallsyms.c -c -o kallsyms.o

	@$(ECHO) relink
	@$(LD) -T $(KERNEL_LDS) -Map $(KERNEL_DIR)kernel.map --no-warn-rwx-segments -o $(KERNEL_OBJ) $^ kallsyms.o
#	@$(RM) kernel.sym kallsyms.c kallsyms.o
	@$(OBJCOPY) -I $(KERNEL_OBJ_FORMAT) --strip-debug -S -R ".eh_frame" -R ".comment" -O $(KERNEL_OUTPUT_FORMAT) $(KERNEL_OBJ) $@

%.efi: $(UEFI_SRC)
	@$(ECHO) compile BootLoader...
	@$(Mingw_CC) -Wall -Wextra -Werror $(INCLUDE_DIR) -e UefiMain -nostdinc -nostdlib \
	-finput-charset=UTF-8 -fexec-charset=UTF-16 -fno-stack-protector -O0 \
	-fno-builtin -Wl,--subsystem,10 -m64 -mcmodel=large -fpic -o $@ $(filter-out Makefile,$^)

.PHONY: uefi config.txt
uefi: $(UEFI_OUTPUT)

.PHONY: kernel
kernel: $(KERNEL_SRC:c=o) $(KERNEL_OUTPUT)

.PHONY: run
run: uefi kernel config.txt
	-@$(QEMU) -m $(GuestMemory) -bios $(UEFI_BIOS) -drive file=fat:rw:$(DISK),index=0,format=vvfat -net none \
	-device nec-usb-xhci,id=xhci \
	-device usb-mouse \
	-no-shutdown \
	-chardev stdio,mux=on,id=com1 \
	-serial chardev:com1

.PHONY: debug
debug: $(UEFI_OUTPUT) $(KERNEL_OUTPUT) config.txt
	-@$(QEMU) -m $(GuestMemory) -bios $(UEFI_BIOS) -drive file=fat:rw:$(DISK),index=0,format=vvfat -net none \
	-device nec-usb-xhci,id=xhci \
	-device usb-mouse \
	-no-shutdown \
	-chardev stdio,mux=on,id=com1 \
	-serial chardev:com1 \
	-device usb-kbd -S -s

.PHONY: start-gdb
start-gdb:
	$(GDB) -quiet -n -x .gdbinit

.PHONY: dump
dump: kernel
	"$(OBJDUMP)" -D -S $(KERNEL_OBJ) > kernel.dump

.PHONY: install
install: $(REAL_UEFI_OUTPUT) $(REAL_KERNEL_OUTPUT)
	@echo [[[[[ Done. ]]]]]

.PHONY: uninstall
uninstall:
	$(RM) $(REAL_UEFI_OUTPUT) $(REAL_KERNEL_OUTPUT)

.PHONY: clean
clean:
	-$(RM) -f $(KERNEL_SRC:c=o) $(KERNEL_DIR)kernel.map \
	kernel.sym kallsyms.c kallsyms.o