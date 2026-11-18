.global _start

.equ len, 69

_start:
    addi a0, x0, 1
    la   a1, msg
    addi a2, x0, len
    addi a7, x0, 64
    ecall

    addi a0, x0, 0
    addi a7, x0, 93
    ecall

.data
msg: .ascii "Докукин Дмитрий Алексеевич_ИКБО-42-25_10\n"
