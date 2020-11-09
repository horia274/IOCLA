%include "../utils/printf32.asm"

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

    ; TODO - print the powers of 2 that generate number stored in EAX

check:
    ; PRINTF32 `%d %d\n\x0`, eax, ebx
    cmp eax, 0
    je exit
    test eax, ebx
    jnz print
    shl ebx, 1
    cmp eax, 0
    jnz check

print:
    sub eax, ebx
    PRINTF32 `%d\n\x0`, ebx
    shl ebx, 1
    jmp check

exit:
    leave
    ret
