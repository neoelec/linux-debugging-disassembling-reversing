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
    lea     a(%rip),%rax
    mov     %rax,pa(%rip)

    mov     pa(%rip),%rax
    movl    $1,(%rax)

    mov     pb(%rip),%rbx
    movl    $1,(%rbx)

    mov     (%rax),%ecx
    add     (%rbx),%ecx
    mov     %ecx,(%rbx)

    mov     $0x3c,%rax
    mov     $0,%rdi
    syscall
