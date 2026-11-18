SYSROOT ?= $(HOME)/riscv64-sysroot/sysroot
CC = riscv64-linux-gnu-gcc
AS = riscv64-linux-gnu-as
CFLAGS = --sysroot=$(SYSROOT)
QEMU = qemu-riscv64 -L $(SYSROOT)

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif

all: uppertst3 uppertst4

%.o: %.S
	$(AS) $(DEBUGFLGS) $< -o $@

libup.so.1.0: upper.o
	$(CC) $(CFLAGS) -shared -Wl,-soname,libup.so.1 -o $@ upper.o
	ln -sf libup.so.1.0 libup.so.1
	ln -sf libup.so.1.0 libup.so

uppertst3: uppertst.c libup.so.1.0
	$(CC) $(CFLAGS) $(DEBUGFLGS) -o $@ uppertst.c -L. -lup

uppertst4: uppertst4.c
	$(CC) $(CFLAGS) $(DEBUGFLGS) -o $@ uppertst4.c

run: all
	$(QEMU) -E LD_LIBRARY_PATH=. ./uppertst3
	$(QEMU) ./uppertst4

clean:
	rm -f upper.o libup.so libup.so.1 libup.so.1.0 uppertst3 uppertst4

.PHONY: all run clean
