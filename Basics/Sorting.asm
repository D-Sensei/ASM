;We will be using buble sort for this one
section .data
    array db 6, 2, 8, 1, 5 ; array to be sorted
    array_len equ $-array ; length of the array

section .text
    global _start

_start:
    ; outer loop (controls number of passes)
    mov ecx, array_len - 1
outer_loop:
    push ecx ; save outer loop counter value
    xor ecx, ecx ; reset inner loop counter
    ; inner loop (compares adjacent elements)
inner_loop:
    mov edx, [array + ecx] ; move current element into edx
    cmp edx, [array + ecx + 1] ; compare with next element
    jle skip_swap ; jump if current element is less than or equal to next element
    ; swap elements
    xchg edx, [array + ecx + 1]
    mov [array + ecx], edx
skip_swap:
    inc ecx ; increment inner loop counter
    cmp ecx, [esp] ; compare with outer loop counter
    jb inner_loop ; jump if inner loop counter is less than outer loop counter
    pop ecx ; restore outer loop counter value
    dec ecx ; decrement outer loop counter
    jnz outer_loop ; jump if outer loop counter is not zero

    ; display sorted array
    mov ecx, array_len
    mov esi, array
print_loop:
    movzx eax, byte [esi]
    call print_num
    inc esi
    loop print_loop

    ; exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

print_num:
    push ecx ; save ecx register
    mov ecx, 10
    xor edx, edx
    div ecx
    test eax, eax
    jz print_digit
    push eax
    call print_num
    pop eax
print_digit:
    add al, '0'
    mov [buf], al
    mov eax, 4
    mov ebx, 1
    mov ecx, buf
    mov edx, 1
    int 0x80
    pop ecx ; restore ecx register
    ret

section .bss
    buf resb 1 ; buffer for storing digits
