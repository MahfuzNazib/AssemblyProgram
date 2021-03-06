
;**Decimal To Binary 
;--------------------
.model small
.stack 100h
.data
    msg1 db 0dh,0ah,'Enter a Decimal Value  : $'
    msg2 db 0dh,0ah,'Converted Binary Value : $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov cx,8
    
    AND bh,000Fh
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    
    l:
    shl bh,1
    jc one
    jmp zero
    
    one:
    mov ah,2
    mov dl,'1'
    int 21h
    
    loop l
    
    jmp exit
    
    zero:
    mov ah,2
    mov dl,'0'
    int 21h
    
    loop l
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main
;==============================================================
;**Hexa to Binary
;-----------------------


.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB '(1)-> 8 BIT BAINARY   (2)-> 16BIT BINARY $'
    MSG2 DB 0DH,0AH,'ENTER YOUR OPTION : $'
    MSG3 DB 0DH,0AH,'INVALID KEY PRESS $'
    MSG4 DB 0DH,0AH,'ENTER 4 BIT HEXA VALUE : $'
    MSG5 DB 0DH,0AH,'ENTER 8 BIT HEXA VALUE : $'
    MSG6 DB 0DH,0AH,'CONVERTED BIANRY VALUE : $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    LEA DX,MSG2
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL,'1'
    JE B8
    
    CMP AL,'2'
    JE B16
    
    JMP INVALID
    
    B8:
        MOV AH,9
        LEA DX,MSG4
        INT 21H
        
        XOR BL,BL
        
        INPUT:
            MOV AH,1
            INT 21H
        
            CMP AL,0DH
            JE FINISH
            
            CMP AL,41H
            JGE LETTER
            
            CMP AL,30H
            JGE DIGIT
            
            LETTER:
            
                CMP AL,46H
                JLE LOK
                JMP INVALID
                
                LOK:
                    SUB AL,37H
                    SHL BL,4
                    OR BL,AL
                    
                    JMP INPUT
                    
            
            DIGIT:
                
                CMP AL,39H
                JLE DOK
                JMP INVALID
                
                DOK:
                    SUB AL,30H
                    SHL BL,4
                    OR BL,AL
                    
                    JMP INPUT
                 
            
            FINISH:
            
                MOV DL,0
                MOV CH,0
                MOV DL,BL
                
                MOV AH,9
                LEA DX,MSG6
                INT 21H
                
                OUTPUT:
                    CMP CH,8
                    JE EXIT
                    INC CH
                    
                    SHL BL,1
                    JC ONE
                    JMP ZERO
                    
                    ONE:
                        MOV AH,2
                        MOV DL,'1'
                        INT 21H  
                        
                        LOOP OUTPUT
                    
                    ZERO:
                        MOV AH,2
                        MOV DL,'0'
                        INT 21H
                        
                        LOOP OUTPUT
                        
                       
                            
                        EXIT:
                            MOV AH,4CH
                            INT 21H
                            
 
    B16:
    
        MOV AH,9
        LEA DX,MSG5
        INT 21H
        
        XOR BX,BX
        
        INPUT1:
            MOV AH,1
            INT 21H
            
            CMP AL,0DH
            JE FINISH1
            
            CMP AL,41H
            JGE LETTER1
            
            CMP AL,30H
            JGE DIGIT1
            
            LETTER1:
            
                CMP AL,46H
                JLE LOK1
                JMP INVALID
                
                LOK1:
                    SUB AL,37H
                    SHL BX,4
                    OR BL,AL
                    
                    JMP INPUT1
                    
            
            DIGIT1:
                
                CMP AL,39H
                JLE DOK1
                JMP INVALID
                
                DOK1:
                    SUB AL,30H
                    SHL BX,4
                    OR BL,AL
                    
                    JMP INPUT1
                 
            
            FINISH1:
            
                MOV DL,0
                MOV CX,0
                MOV DL,BL
                
                MOV AH,9
                LEA DX,MSG6
                INT 21H
                
                OUTPUT1:
                    CMP CX,16
                    JE EXIT1
                    INC CX
                    
                    SHL BX,1
                    JC ONE1
                    JMP ZERO1
                    
                    ONE1:
                        MOV AH,2
                        MOV DL,'1'
                        INT 21H  
                        
                        JMP OUTPUT1
                    
                    ZERO1:
                        MOV AH,2
                        MOV DL,'0'
                        INT 21H
                        
                        JMP OUTPUT1
                        
                        
                            
                        EXIT1:
                            MOV AH,4CH
                            INT 21H
    
    
    
    INVALID:
        MOV AH,9
        LEA DX,MSG3
        INT 21H
                            
       
       
       MOV AH,4CH
       INT 21H 
       
       MAIN ENDP
END MAIN

;=================================================================================

;**fACTORIAL Number
;----------------------

.model small
.stack 100h
.data
    msg1 db 0dh,0ah,'Enter a Decimal Number  : $'
    msg2 db 0dh,0ah,'Factorial Value in hexa : $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    
    mov bl,al
    sub bl,30h
    
    dec al
    mov cl,al
    sub cl,30h
    mov ch,0
    
    mov ax,bx
    
    l:
    dec bl
    mul bx
    loop l
    
    
    
    
    main endp
end main
    
;=========================================================


