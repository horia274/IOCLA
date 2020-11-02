%include "../io.mac"

section .text
    global main
    extern printf

main:
    mov eax, 7       ; vrem sa aflam al N-lea numar; N = 7

    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    mov ebx, 1
    mov ecx, 1
    sub eax, 2

fib:
    cmp eax, 0
    jz exit
    mov edx, ebx
    add edx, ecx
    mov ecx, ebx
    mov ebx, edx
    dec eax
    jmp fib

exit:
    PRINTF32 `%u\n\x0`, ebx
    ret
