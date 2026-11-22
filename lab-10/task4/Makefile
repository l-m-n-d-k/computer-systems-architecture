SYSROOT ?= $(HOME)/riscv64-sysroot/sysroot
CC = riscv64-linux-gnu-gcc
AS = riscv64-linux-gnu-as
LD = riscv64-linux-gnu-ld
OBJDUMP = riscv64-linux-gnu-objdump
QEMU = qemu-riscv64 -L $(SYSROOT)

ifdef DEBUG
ASFLAGS = -g
else
ASFLAGS =
endif

OBJS = creditcard.o toupper.o

%.o: %.S
	$(AS) $(ASFLAGS) $< -o $@

creditcard: $(OBJS)
	$(LD) -o $@ $(OBJS)

creditcard_pie: creditcard.S toupper.S
	$(CC) --sysroot=$(SYSROOT) -nostdlib -static-pie -o $@ creditcard.S toupper.S

run: creditcard
	timeout 1 $(QEMU) ./creditcard | head -5

run_count: creditcard
	-timeout 1 $(QEMU) ./creditcard | wc -l

run_pie: creditcard_pie
	-timeout 1 $(QEMU) ./creditcard_pie

disasm: creditcard
	$(OBJDUMP) -d creditcard

clean:
	rm -f $(OBJS) creditcard creditcard_pie

.PHONY: run run_count run_pie disasm clean
