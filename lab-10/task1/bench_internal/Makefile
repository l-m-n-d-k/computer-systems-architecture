#
# Дополнительный замер: те же три версии функции из toupper1.S/toupper2.S и
# toupper3.S (копии с переименованными метками, см. README-комментарии в
# .S файлах) вызываются миллион раз подряд в одном процессе, время меряется
# через clock_gettime (та же идея, что gettimeofday из задания).
# Нужен, так как чистый "time ./program" на отдельных процессах почти
# целиком уходит на накладные расходы запуска под qemu-riscv64 и не
# показывает разницу между версиями (см. цель time в ../Makefile).
#
SYSROOT ?= $(HOME)/riscv64-sysroot/sysroot
CC = riscv64-linux-gnu-gcc
CFLAGS = --sysroot=$(SYSROOT)
QEMU = qemu-riscv64 -L $(SYSROOT)

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif

bench: bench.c bench_toupper1.S bench_toupper2.S bench_toupper3.S
	$(CC) $(CFLAGS) $(DEBUGFLGS) -o $@ bench.c bench_toupper1.S bench_toupper2.S bench_toupper3.S

run: bench
	$(QEMU) ./bench

clean:
	rm -f bench

.PHONY: run clean
