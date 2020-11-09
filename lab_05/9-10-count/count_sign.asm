%include "../utils/printf32.asm"

%define ARRAY_SIZE    10

section .data
    array dd 100, 124, -123, 420, 23, -1, 24, 12, 10, -1423
    pos_str db "Numarul numerelor pozitive: ", 0
    neg_str db "Numarul numerelor negative: ", 0

section .text
extern printf
global main

main:
    push ebp
    mov ebp, esp

    xor eax, eax ; count positive numbers
    xor ebx, ebx ; count negative numbers
    xor ecx, ecx

check:
    cmp ecx, ARRAY_SIZE
    jz exit

check_number:
    mov edx, [array + ecx * 4]
    inc ecx
    cmp edx, 0
    jge positive

negative:
    inc ebx
    jmp check

positive:
    inc eax
    jmp check

exit:
    PRINTF32 `%s\x0`, pos_str
    PRINTF32 `%d\n\x0`, eax
    PRINTF32 `%s\x0`, neg_str
    PRINTF32 `%d\n\x0`, ebx
    leave
    ret
