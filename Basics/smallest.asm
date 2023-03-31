.model small
.stack 100h

.data
array db 5, 3, 7, 1, 8, 4, 2, 9, 6 ; the array
array_size equ ($ - array) ; size of array

smallest db 255 ; initialize smallest variable to maximum value

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, array_size
    mov si, offset array

    ; loop through the array
    L1:
    mov al, [si]
    cmp al, smallest
    jge L2
    mov smallest, al
    L2:
    inc si
    loop L1

    ; print the smallest number
    mov ah, 09h
    mov dx, offset smallest
    int 21h

    mov ah, 4ch ; exit program
    int 21h
main endp
end main
