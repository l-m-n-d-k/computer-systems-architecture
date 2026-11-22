.global convert_asm

convert_asm:
    mv   t5, a1

loop:
    lb   t2, 0(a0)
    addi a0, a0, 1
    beqz t2, done

    addi t4, t2, -'a'
    li   t3, 25
    bltu t3, t4, cont
    addi t2, t2, ('A'-'a')
cont:
    sb   t2, 0(a1)
    addi a1, a1, 1
    j    loop

done:
    li   t3, '!'
    sb   t3, 0(a1)
    sb   zero, 1(a1)
    addi a1, a1, 2
    sub  a0, a1, t5
    ret
