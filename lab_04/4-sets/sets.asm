%include "../io.mac"

section .text
    global main
    extern printf

main:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139    ; 10001011
    mov ebx, 169    ; 10101001
    
    PRINTF32 `%u\n\x0`, eax ; afiseaza prima multime
    PRINTF32 `%u\n\x0`, ebx ; afiseaza cea de-a doua multime

    ; TODO1: reuniunea a doua multimi
    mov ecx, 0
    or ecx, eax
    or ecx, ebx
    PRINTF32 `reuniunea este: \x0`
    PRINTF32 `%u\n\x0`, ecx

    ; TODO2: adaugarea unui element in multime
    ; adaug 16 si 4 la primul
    or eax, 4
    or eax, 16
    PRINTF32 `noua multime va fi: \x0`
    PRINTF32 `%u\n\x0`, eax

    ; TODO3: intersectia a doua multimi
    mov ecx, 255
    and ecx, eax
    and ecx, ebx
    PRINTF32 `intersectia este: \x0`
    PRINTF32 `%u\n\x0`, ecx

    ; TODO4: complementul unei multimi
    mov ecx, eax
    shl ecx, 24
    not ecx
    shr ecx, 24
    PRINTF32 `complementul este: \x0`
    PRINTF32 `%u\n\x0`, ecx

    ; TODO5: eliminarea unui element
    ; scot 8 din prima
    mov cl, 8
    not cl
    and al, cl
    PRINTF32 `noua multime va fi: \x0`
    PRINTF32 `%u\n\x0`, eax

    ; TODO6: diferenta de multimi EAX-EBX
    mov ecx, ebx
    xor ecx, eax
    and ecx, eax
    PRINTF32 `diferenta este: \x0`
    PRINTF32 `%u\n\x0`, ecx

    xor eax, eax
    ret
