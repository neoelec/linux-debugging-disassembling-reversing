.data
a:
    .word   0
b:
    .word   0

.text
.global main
main:
    la      a0,a
    li      a3,1
    sw      a3,0x0(a0)

    la      a1,b
    sw      a3,0(a1)

    lw      a2,0x0(a0)
    lw      a3,0x0(a1)
    add     a4,a3,a2
    sw      a4,0x0(a1)

    addi    a2,a2,1
    sw      a2,0x0(a0)

    mul     a3,a4,a2
    sw      a3,0x0(a1)

    li      a0,0
    li      a7,93
    ecall
