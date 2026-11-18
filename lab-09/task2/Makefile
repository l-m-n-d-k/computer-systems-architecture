SYSROOT ?= $(HOME)/riscv64-sysroot/sysroot
CC = riscv64-linux-gnu-gcc
AS = riscv64-linux-gnu-as
AR = riscv64-linux-gnu-ar
CFLAGS = --sysroot=$(SYSROOT)
QEMU = qemu-riscv64 -L $(SYSROOT)

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif

all: uppertst2

%.o: %.S
	$(AS) $(DEBUGFLGS) $< -o $@

libupper.a: upper.o
	rm -f $@
	$(AR) -cvq $@ upper.o

uppertst2: uppertst.c libupper.a
	$(CC) $(CFLAGS) $(DEBUGFLGS) -o $@ uppertst.c libupper.a

run: uppertst2
	$(QEMU) ./uppertst2

clean:
	rm -f upper.o libupper.a uppertst2

.PHONY: all run clean
