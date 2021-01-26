section .data
    format_equals db "Numarul %d este egal cu rasturnatul sau", 13, 10, 0
    format_smaller db "Numarul %d este mai mic decat rasturnatul sau", 13, 10, 0
    format_bigger db "Numarul %d este mai mare decat rasturnatul sau", 13, 10, 0

section .text

extern printf
global main

compute_mirror:                           ; functia primeste ca parametru un numar
    push ebp                              ; si intoarce rasturnatul lui 
    mov ebp, esp                          ; aici se creeaza cadrul stivei de apel

    mov eax, dword [ebp + 8]              ; pun parametrul in registrul eax
    xor ebx, ebx                          ; in ebx voi calcula rasturnatul
    mov ecx, 10                           ; tin numarul 10 la care urmeaza sa impart

continue:   
    test eax, eax                         ; verific daca numarul este 0
    je exit_compute                       ; caz in care ma opresc din procesat cifre
    xor edx, edx                          ; daca nu, setez registrul edx pe 0
    div ecx                               ; impart numarul din eax la 10
    push eax                              ; salvez catul pe stiva
    push edx                              ; salvez restul pe stiva

    mov ax, bx                            ; mut rasturnatul in eax
    mul ecx                               ; il inmultesc cu 10

    pop edx                               ; iau inapoi restul salvat pe stiva
    add ax, dx                            ; si il adun la rasturnatul curent
    mov ebx, eax                          ; apoi salvez rasturnatul inapoi in ebx

    pop eax                               ; iau numarul caruia i-am taiat o cifra inapoi
    jmp continue                          ; in eax si continui procedeul

exit_compute:
    mov eax, ebx                          ; salvez rezultatul in eax, pentru ca aici
    leave                                 ; se retine valoarea de return
    ret

compare:
    push ebp                              ; functia primeste ca argumente doua numere
    mov ebp, esp                          ; si le compara

    mov ebx, dword [ebp + 8]              ; salvez fiecare parametru in cate un registru
    mov ecx, dword [ebp + 12]

    cmp ebx, ecx                          ; compar numerele
    je equals                             ; daca sunt egale ma duc pe eticheta "equals"
    cmp ebx, ecx
    ja bigger                             ; daca primul e mai mare, pe eticheta "bigger"

    push ebx                              ; daca nu se intampla niciuna, primul e mai mic
    push format_smaller                   ; apelez printf pentru a afisa mesajul 
    call printf                           ; corespunzator primului argument mai mic
    add esp, 8
    jmp exit_compare                      ; sar la sfarsitul functiei

bigger:
    push ebx                              ; la fel, apelez printf cu mesajul in care
    push format_bigger                    ; primul numar e mai mare
    call printf
    add esp, 8
    jmp exit_compare

equals:
    push ebx                              ; la fel pentru egale
    push format_equals
    call printf
    add esp, 8

exit_compare:
    leave                                 ; ies din functie
    ret

main:
    push ebp
    mov ebp, esp

    mov ebx, 8989                        ; inputul programului
    push ebx

    push ebx                              ; apelez functia de obtinere a rasturnatului
    call compute_mirror
    add esp, 4
    mov ecx, eax
    pop ebx

    push eax
    push ebx
    call compare                          ; compar numarul cu rasturnatul
    add esp, 8

    leave
    ret
