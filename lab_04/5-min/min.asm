%include "../io.mac"

section .text
    global main
    extern printf

main:
    ;cele doua numere se gasesc in eax si ebx
    mov eax, 4
    mov ebx, 10
    cmp eax, ebx
    jg swap
    PRINTF32 `%d\n\x0`, eax
    ret

swap:
    xchg eax, ebx
    PRINTF32 `%d\n\x0`, eax
    ret
    ; TODO: aflati minimul
    ; afiseaza minimul
