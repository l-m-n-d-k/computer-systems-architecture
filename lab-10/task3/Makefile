SYSROOT ?= $(HOME)/riscv64-sysroot/sysroot
CC = riscv64-linux-gnu-gcc
STRIP = riscv64-linux-gnu-strip
GHIDRA ?= $(HOME)/opt/ghidra_12.2_PUBLIC
PROJDIR = ghidra_proj
SRC = ../task2/convert.c

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif

target.elf: $(SRC)
	$(CC) --sysroot=$(SYSROOT) $(DEBUGFLGS) -O3 -c -o convert.o $(SRC)
	$(CC) --sysroot=$(SYSROOT) -nostdlib -static -o $@ convert.o
	$(STRIP) -s $@

ghidra: target.elf
	rm -rf $(PROJDIR)
	mkdir -p $(PROJDIR)
	$(GHIDRA)/support/analyzeHeadless $(PROJDIR) lab10proj \
		-import target.elf -overwrite \
		-scriptPath $(CURDIR) \
		-postScript DecompileAll.java decompiled.c

QEMU = qemu-riscv64 -L $(SYSROOT)

# Собрать и запустить восстановленный Ghidra код (с минимальными правками
# из restored.c) рядом с оригиналом и сравнить результат - задание требует
# не только декомпилировать, но и запустить.
run_restored: restored.c test_restored.c
	$(CC) --sysroot=$(SYSROOT) -Wall -O3 -o test_restored test_restored.c restored.c $(SRC)
	$(QEMU) ./test_restored

clean:
	rm -rf target.elf convert.o $(PROJDIR) decompiled.c test_restored

.PHONY: ghidra run_restored clean
