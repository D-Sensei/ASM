section .data
    num1 dd 10
    num2 dd 2
    result dd 0

section .text
    global _start

_start:
    ; load first number into eax
    mov eax, [num1]

    ; divide eax by second number
    div dword [num2]

    ; store quotient into result
    mov [result], eax

    ; display result
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 4
    int 0x80

    ; exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
