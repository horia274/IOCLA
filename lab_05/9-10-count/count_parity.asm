%include "../utils/printf32.asm"

%define ARRAY_SIZE    10

section .data
    array dd 100, 124, -123, 420, 23, -1, 24, 12, 10, -1423
    even_str db "Numarul numerelor pare: ", 0
    odd_str db "Numarul numerelor impare: ", 0

section .text
extern printf
global main

main:
    push ebp
    mov ebp, esp

    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx

check:
    cmp ecx, ARRAY_SIZE
    jz exit

check_parity:
    mov edx, [array + ecx * 4]
    inc ecx
    test edx, 1
    jz even

odd:
    inc ebx
    jmp check

even:
    inc eax
    jmp check

exit:
    PRINTF32 `%s\x0`, even_str
    PRINTF32 `%d\n\x0`, eax
    PRINTF32 `%s\x0`, odd_str
    PRINTF32 `%d\n\x0`, ebx

    leave
    ret
