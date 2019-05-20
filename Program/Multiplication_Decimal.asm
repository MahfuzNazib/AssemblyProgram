;.model small
;.stack 100h
;.data
;    msg1 db 'Enter 1st Number : $'
;    msg2 db 0dh,0ah,'Enter 2nd Number : $'
;    msg3 db 0dh,0ah,'Result in (Mult) : $'
;.code
;main proc
;    mov ax,@data
;    mov ds,ax
;    
;    mov ah,9
;    lea dx,msg1
;    int 21h
;    
;    mov ah,1
;    int 21h
;    
;    mov bl,al
;    sub bl,30h
;    
;    mov ah,9
;    lea dx,msg2
;    int 21h
;    
;    mov ah,1
;    int 21h
;    
;    sub al,30h
;    
;    mul bl
;    AAM
;    
;    mov cx,ax
;    
;    add ch,30h
;    add cl,30h
;    
;    mov ah,9
;    lea dx,msg3
;    int 21h
;    
;    mov ah,2
;    mov dl,ch
;    int 21h
;    
;    mov dl,cl
;    int 21h
;    
;    mov ah,4ch
;    int 21h 
;    
;    main endp
;end main

.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 0DH,0AH,'ENTER YOUR FIRST  NUMBER : $'
    MSG2 DB 0DH,0AH,'ENTER YOUR SECOND NUMBER : $'
    MSG3 DB 0DH,0AH,'RESULT IN (MULT) IS      : $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL
    SUB BL,30H
    
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV AH,1
    INT 21H
    
    SUB AL,30H
    
    MUL BL
    AAM
    
    ADD AH,30H
    ADD AL,30H
    MOV CX,AX
    
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    MOV DL,CL
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    
    