SYSROOT ?= $(HOME)/riscv64-sysroot/sysroot
CC = riscv64-linux-gnu-gcc
OBJDUMP = riscv64-linux-gnu-objdump
CFLAGS = --sysroot=$(SYSROOT)
QEMU = qemu-riscv64 -L $(SYSROOT)

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif

main: main.c convert.o convert_asm.o
	$(CC) $(CFLAGS) $(DEBUGFLGS) -o $@ main.c convert.o convert_asm.o

convert.o: convert.c
	$(CC) $(CFLAGS) $(DEBUGFLGS) -O3 -c -o $@ convert.c

convert_asm.o: convert.S
	$(CC) $(CFLAGS) $(DEBUGFLGS) -c -o $@ convert.S

run: main
	$(QEMU) ./main

disasm_c: convert.o
	$(OBJDUMP) -d convert.o

disasm_asm: convert_asm.o
	$(OBJDUMP) -d convert_asm.o

clean:
	rm -f main convert.o convert_asm.o

.PHONY: run disasm_c disasm_asm clean
