include config.txt

$(KERNEL_OBJ): $(KERNEL_SRC) Makefile
	$(CC) -Wall -Wextra -Werror $(INCLUDE_DIR) -nostdlib -nostdinc \
	-finput-charset=UTF-8 -fexec-charset=UTF-8 \
	-fno-builtin -fno-strict-aliasing -fpic -fpie -mno-red-zone \
	-m64 -mcmodel=large -march=x86-64 \
	-Wl,-Map,$(KERNEL_DIR)kernel.map,-T,$(KERNEL_LDS) -Os -g -o $@ $(filter-out Makefile,$^)
	
%.sys: $(KERNEL_OBJ)
	$(OBJCOPY) -I $(KERNEL_OBJ_FORMAT) --strip-debug -S -R ".eh_frame" -R ".comment" -O $(KERNEL_OUTPUT_FORMAT) $< $@

%.efi: $(UEFI_SRC) Makefile
	$(CC) -Wall -Wextra  -Werror $(INCLUDE_DIR) -e UefiMain -nostdinc -nostdlib \
	-finput-charset=UTF-8 -fexec-charset=UTF-16 \
	-fno-builtin -Wl,--subsystem,10 -m64 -mcmodel=large -fpic -o $@ $(filter-out Makefile,$^)

.PHONY: uefi
uefi: $(UEFI_OUTPUT)

.PHONY: kernel
kernel: $(KERNEL_OUTPUT)

.PHONY: run
run: $(UEFI_OUTPUT) $(KERNEL_OUTPUT) Makefile config.txt
	-$(QEMU) -m 1024 -bios $(UEFI_BIOS) -drive file=fat:rw:$(DISK),index=0,format=vvfat -net none \
	-device nec-usb-xhci,id=xhci \
	-device usb-mouse \
	-no-shutdown \
	-monitor stdio
	-$(MAKE) -r clean

.PHONY: debug
debug: $(UEFI_OUTPUT) $(KERNEL_OUTPUT) Makefile config.txt
	-$(QEMU) -m 1024 -bios $(UEFI_BIOS) -drive file=fat:rw:$(DISK),index=0,format=vvfat -net none \
	-device nec-usb-xhci,id=xhci \
	-device usb-mouse \
	-no-shutdown \
	-monitor stdio \
	-device usb-kbd -S -s 
	-$(MAKE) -r clean

.PHONY: start-gdb
start-gdb:
	$(GDB) -quiet -n -x .gdbinit

.PHONY: install
install: $(REAL_UEFI_OUTPUT) $(REAL_KERNEL_OUTPUT)
	$(MAKE) -r clean
	@echo [[[[[ Done. ]]]]]

uninstall:
	$(RM) $(REAL_UEFI_OUTPUT) $(REAL_KERNEL_OUTPUT)

clean:
	-$(RM) $(KERNEL_OBJ) $(KERNEL_DIR)kernel.map