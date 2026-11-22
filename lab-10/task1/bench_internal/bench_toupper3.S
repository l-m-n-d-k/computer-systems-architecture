#
# То же самое тело цикла, что в макросе toupper из листинга 10.7, но в виде
# обычной вызываемой функции - нужно только для замера времени в общем
# цикле, так как макрос в листинге 10.7 неотделим от программы с _start.
#
.global bench_toupper3
bench_toupper3:
    mv t5, a1

loop3:
    lb t2, 0(a0)
    addi a0, a0, 1

    andi t2, t2, 0xdf

    sb t2, 0(a1)
    addi a1, a1, 1

    li t3, 0
    bne t2, t3, loop3

    sub a0, a1, t5
    ret
