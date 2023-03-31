;Adding two numbers
section .data
    message db "The sum is: %d", 10, 0
    num1 dd 10
    num2 dd 20
    sum dd 0

section .text
    global _start

_start:
    ; add num1 and num2 and store the result in sum
    mov eax, [num1]
    add eax, [num2]
    mov [sum], eax
    
    ; print the result
    push dword [sum]
    push dword message
    call printf
    
    ; exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80
