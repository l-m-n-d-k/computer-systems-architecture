.global mytoupper

mytoupper:
    addi sp, sp, -16
    sd   ra, 8(sp)
    sd   s0, 0(sp)
    mv   s0, a1

loop:
    lb   t2, 0(a0)
    addi a0, a0, 1

    li   t3, 'z'
    bgt  t2, t3, cont

    li   t3, 'a'
    blt  t2, t3, cont

    addi t2, t2, ('A'-'a')
cont:
    sb   t2, 0(a1)
    addi a1, a1, 1
    li   t3, 0
    bne  t2, t3, loop

    sub  a0, a1, s0
    ld   s0, 0(sp)
    ld   ra, 8(sp)
    addi sp, sp, 16
    ret
