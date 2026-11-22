#
# Небольшая программа-драйвер для toupper1.S/toupper2.S: вызывает функцию
# toupper и выводит результат. Такого файла нет в листингах пособия (там
# дан только Makefile, ссылающийся на main.o), поэтому он написан по
# аналогии с листингом 10.7 - тем же способом вывода строки через write/exit.
#
.global _start

_start:
    # Инициализация gp - без неё GP-относительная адресация, которую
    # выбирает линковщик для instr/outstr, обращается по неверному
    # адресу (см. такую же находку в задании 4)
.option push
.option norelax
    la gp, __global_pointer$
.option pop

    la a0, instr
    la a1, outstr
    call toupper

    mv a2, a0            # Кодом возврата является длина строки
    li a0, 1             # 1 = StdOut
    la a1, outstr        # выводимый строковый литерал
    li a7, 64            # системный вызов операции записи Linux
    ecall                # вывести строковый литерал

    li a0, 0             # Использовать код возврата
    li a7, 93             # Код 93 служебной команды завершает программу
    ecall                # завершить программу

.data
instr:
    .asciz "ThisIsRatherALargeVariableNameAaZz//['[\n"
outstr:
    .fill 255, 1, 0
