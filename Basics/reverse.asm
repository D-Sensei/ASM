; program to reverse the order of an array

.model small
.stack 100h

.data
arr db 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ; array to be reversed
msg db 'Array before reverse: $'
msg2 db 'Array after reverse: $'

.code
main proc
mov ax, @data
mov ds, ax ; initialize data segment

; print array before reverse
mov ah, 09h ; print string function
mov dx, offset msg ; offset of string to be printed
int 21h ; call DOS interrupt

mov cx, 10 ; loop counter
lea si, arr ; load effective address of array to SI

print_array_before:
mov dl, [si] ; load array element to DL
add dl, 30h ; convert to ASCII character
mov ah, 02h ; print character function
int 21h ; call DOS interrupt

inc si ; point to next array element
loop print_array_before ; loop until all elements are printed

; reverse the array
mov cx, 10 ; loop counter
lea si, arr ; load effective address of array to SI
lea di, arr+9 ; load effective address of last element in array to DI

reverse_array:
mov al, [si] ; load first array element to AL
mov bl, [di] ; load last array element to BL
mov [di], al ; store first element in last position
mov [si], bl ; store last element in first position

inc si ; point to next array element
dec di ; point to previous array element
loop reverse_array ; loop until all elements are reversed

; print array after reverse
mov ah, 09h ; print string function
mov dx, offset msg2 ; offset of string to be printed
int 21h ; call DOS interrupt

mov cx, 10 ; loop counter
lea si, arr ; load effective address of array to SI

print_array_after:
mov dl, [si] ; load array element to DL
add dl, 30h ; convert to ASCII character
mov ah, 02h ; print character function
int 21h ; call DOS interrupt

inc si ; point to next array element
loop print_array_after ; loop until all elements are printed

mov ah, 4ch ; return control to DOS
int 21h
main endp
end main
