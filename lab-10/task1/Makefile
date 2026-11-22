#
# Сборка по листингу 10.6 пособия (as/ld без gcc), адаптирована под
# кросс-инструментарий: вместо as/ld (нативных) используются
# riscv64-linux-gnu-as/riscv64-linux-gnu-ld, а запуск - через qemu-riscv64.
# Также добавлена цель upper1 (сборка базовой, неоптимизированной версии
# из toupper1.S) - в листинге 10.6 её нет, так как пособие сравнивает
# только toupper2 и toupper3.
#
AS = riscv64-linux-gnu-as
LD = riscv64-linux-gnu-ld
QEMU = qemu-riscv64

UPPER1OBJS = main.o toupper1.o
UPPER2OBJS = main.o toupper2.o
UPPER3OBJS = toupper3.o

ifdef DEBUG
DEBUGFLGS = -g
else
DEBUGFLGS =
endif

LSTFLGS =

all: upper1 upper2 upper3

%.o : %.S
	$(AS) $(DEBUGFLGS) -march=rv64i $(LSTFLGS) $< -o $@

upper1: $(UPPER1OBJS)
	$(LD) -o toupper1 $(UPPER1OBJS)

upper2: $(UPPER2OBJS)
	$(LD) -o toupper2 $(UPPER2OBJS)

upper3: $(UPPER3OBJS)
	$(LD) -o toupper3 $(UPPER3OBJS)

run: all
	@echo "--- toupper1 (два ветвления) ---"
	@$(QEMU) ./toupper1
	@echo "--- toupper2 (одно ветвление, сдвиг диапазона) ---"
	@$(QEMU) ./toupper2
	@echo "--- toupper3 (макрос, маска 0xDF) ---"
	@$(QEMU) ./toupper3

N ?= 2000

time: all
	@echo "--- toupper1 (N=$(N)) ---"
	@time ( for i in $$(seq $(N)); do $(QEMU) ./toupper1 >/dev/null; done )
	@echo "--- toupper2 (N=$(N)) ---"
	@time ( for i in $$(seq $(N)); do $(QEMU) ./toupper2 >/dev/null; done )
	@echo "--- toupper3 (N=$(N)) ---"
	@time ( for i in $$(seq $(N)); do $(QEMU) ./toupper3 >/dev/null; done )

clean:
	rm -f main.o toupper1.o toupper2.o toupper3.o toupper1 toupper2 toupper3

.PHONY: all run time clean
