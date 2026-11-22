.global _start

DownloadCreditCardNumbers:
    li   a0, 1
    la   a1, getcreditcards
    li   a2, 30
    li   a7, 64
    ecall
    ret

calltoupper:
    addi sp, sp, -16
    sd   ra, 0(sp)
    addi sp, sp, -16
    la   a0, instr
    mv   a1, sp

    call toupper

aftertoupper:
    addi sp, sp, 16
    ld   ra, 0(sp)
    addi sp, sp, 16
    ret

_start:
.option push
.option norelax
    la gp, __global_pointer$
.option pop

    call calltoupper

    li   a0, 0
    li   a7, 93
    ecall

.data
instr:
    .ascii "This is our Test"
    .quad 0x00000000000100e8
getcreditcards: .asciz "Downloading Credit Card Data!\n"
    .align 4
