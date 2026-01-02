.data
a:
    .int    0
b:
    .int    0
pa:
    .quad   0
pb:
    .quad   b

.text
.global main
main:
    la      a0,a
    la      a1,pa
    sd      a0,0x0(a1)

    la      a0,pa
    ld      a0,0x0(a0)
    li      a2,1
    sw      a2,0x0(a0)

    la      a1,pb
    ld      a1,0x0(a1)
    sw      a2,0x0(a1)

    lw      a2,0x0(a0)
    lw      a3,0x0(a1)
    add     a3,a3,a2
    sw      a3,0x0(a1)

    li      a0,0
    li      a7,93
    ecall
