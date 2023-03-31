section .data
  msg db "The product is: ", 0

section .bss
  num1 resb 2
  num2 resb 2
  product resb 4

section .text
  global _start

_start:
  ; prompt user for first number
  mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, 17
  int 80h

  ; read in first number from user
  mov eax, 3
  mov ebx, 0
  mov ecx, num1
  mov edx, 2
  int 80h

  ; prompt user for second number
  mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, 18
  int 80h

  ; read in second number from user
  mov eax, 3
  mov ebx, 0
  mov ecx, num2
  mov edx, 2
  int 80h

  ; convert the two numbers from ASCII to binary
  mov eax, num1
  sub eax, 30h
  mov ebx, num2
  sub ebx, 30h

  ; multiply the two numbers
  mul ebx

  ; convert the result back to ASCII
  add eax, 30h
  add edx, 30h

  ; save the result in the product variable
  mov [product], eax
  mov [product+2], edx

  ; print out the result to the user
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, 16
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, product
  mov edx, 4
  int 80h

  ; exit the program
  mov eax, 1
  xor ebx, ebx
  int 80h
