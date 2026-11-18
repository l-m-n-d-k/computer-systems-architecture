SYSROOT ?= $(HOME)/riscv64-sysroot/sysroot
CC = riscv64-linux-gnu-gcc
CFLAGS = --sysroot=$(SYSROOT)
QEMU = qemu-riscv64 -L $(SYSROOT)

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif

uppertst: uppertst.c upper.S
	$(CC) $(CFLAGS) $(DEBUGFLGS) -o $@ uppertst.c upper.S

run: uppertst
	$(QEMU) ./uppertst

clean:
	rm -f uppertst

.PHONY: run clean
