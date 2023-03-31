DATA SEGMENT
    ARRAY DB 12H, 4H, 56H, 27H, 8H, 19H, 10H, 6H, 33H, 41H, 25H
    COUNT DB 0AH
    LARGEST DB ?
DATA ENDS

CODE SEGMENT
START:
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, COUNT     ; load the counter
    MOV AL, ARRAY     ; load the first element of the array in AL
    MOV LARGEST, AL   ; set LARGEST to the first element of the array

    LOOP_START:
        INC ARRAY      ; move to the next element of the array
        MOV BL, ARRAY  ; load the current element of the array in BL
        CMP LARGEST, BL ; compare the current element with LARGEST
        JNC LOOP_NEXT  ; if current element is not greater than LARGEST, go to next iteration
        MOV LARGEST, BL ; if current element is greater than LARGEST, set LARGEST to the current element

    LOOP_NEXT:
        LOOP LOOP_START ; repeat until all elements of the array are checked

    ; display the result
    MOV DL, LARGEST
    ADD DL, 30H       ; convert the number to ASCII
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
CODE ENDS
