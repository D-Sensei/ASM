section .data
    num1 dw 10
    num2 dw 5
    result dw ?

section .text
    global _start

_start:
    mov ax, [num1]    ; move the value of num1 into ax register
    sub ax, [num2]    ; subtract the value of num2 from ax register
    mov [result], ax  ; move the result to the variable result
    mov eax, 4        ; write system call
    mov ebx, 1        ; file descriptor for stdout
    mov ecx, result   ; message to write
    mov edx, 2        ; length of message
    int 0x80          ; call kernel
    mov eax, 1        ; exit system call
    xor ebx, ebx      ; exit code 0
    int 0x80          ; call kernel
