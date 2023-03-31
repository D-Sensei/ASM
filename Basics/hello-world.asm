;Displaying "Hello, World!" 
section .data
    msg db 'Hello, World!',0Ah,0Dh

section .text
    global _start

_start:
    ; display message on the screen
    mov ah, 09h       ; set up the "print string" function
    mov dx, msg       ; point to the message to display
    int 21h           ; call DOS interrupt 21h

    ; exit the program
    mov ah, 4Ch       ; set up the "exit program" function
    mov al, 0         ; return code (0=success)
    int 21h           ; call DOS interrupt 21h
