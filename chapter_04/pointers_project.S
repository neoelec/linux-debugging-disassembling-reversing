.data
a:
    .word   0
b:
    .word   0

.text
.global main
main:
    lea     a(%rip),%rax
    movl    $1,(%rax)

    lea     b(%rip),%rbx
    movl    $1,(%rbx)

    mov     (%rax),%edx
    add     %edx,(%rbx)

    incl    (%rax)

    mov     (%rax),%eax
    imul    (%rbx),%eax
    mov     %eax,(%rbx)

    mov     $0x3c,%rax
    mov     $0,%rdi
    syscall
