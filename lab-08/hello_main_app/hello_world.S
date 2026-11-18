.global main_app

.equ len, 69

main_app:
    addi a0, x0, 1
    la   a1, msg
    addi a2, x0, len
    addi a7, x0, 64
    ecall

    j main_app

.data
msg: .ascii "Докукин Дмитрий Алексеевич_ИКБО-42-25_10\n"
