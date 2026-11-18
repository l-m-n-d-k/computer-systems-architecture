SYSROOT ?= $(HOME)/riscv64-sysroot/sysroot
QEMU = qemu-riscv64 -L $(SYSROOT)

libup:
	$(MAKE) --no-print-directory -C ../task3 libup.so.1.0

run: libup
	$(QEMU) -E LD_LIBRARY_PATH=../task3 $(SYSROOT)/usr/bin/python3.12 uppertst.py

.PHONY: libup run
