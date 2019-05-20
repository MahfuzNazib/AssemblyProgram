;;;xor bx,bx
;;;input:
;;;    mov ah,1
;;;    int 21h
;;;    
;;;    cmp al,41h
;;;    jge letter
;;;    
;;;    cmp al,30h
;;;    jge Digit
;;;    
;;;    CMP AL,0DH
;;;    JE output
;;;    
;;;    letter:
;;;        cmp al,46h
;;;        jle lok
;;;        
;;;        lok:
;;;            SUB al,37h
;;;            shl bx,4
;;;            or bl,al
;;;            jmp input
;;;        
;;;    Digit:
;;;        cmp al,39h
;;;        jle Dok
;;;        
;;;        Dok:
;;;            SUB al,30h
;;;            shl bx,4
;;;            or bl,al
;;;            jmp input
;;;            
;;;        mov dl,0dh
;;;        mov ah,2
;;;        int 21h
;;;        mov dl,0ah
;;;        int 21h 
;;;            
;;;      
;;;        
;;;        MOV CX,4
;;;        ;Output Part construction
;;;        output:
;;;        mov dl,bh
;;;        shl bx,4
;;;        cmp dl,41h
;;;        jge lo
;;;        
;;;        cmp dl,30h
;;;        jge do
;;;        
;;;        lo:
;;;            ror dl,4
;;;            and dl,0Fh
;;;            and dl,37h
;;;            mov ah,2
;;;            int 21h
;;;            LOOP output
;;;        
;;;        do: 
;;;            ror dl,4
;;;            and dl,0Fh
;;;            or dl,30h 
;;;            mov ah,2
;;;            int 21h
;;;            LOOP output
;;;        
;;;        
;;;  
;;;
;;;;MOV DL,00001100B
;;;;AND DL,00111111B
;;;    
;;;.MODEL SMALL
;;;.STACK 100H
;;;.DATA
;;;    MSG1 DB 'ENTER 8 OR 16 BIT BINARY VALUE  : $'
;;;    MSG2 DB 0DH,0AH,'CONVERTED HEXA VALUE IS : $'
;;;    MSG3 DB 0DH,0AH,'INVALID KEY PRESS $'
;;;.CODE
;;;MAIN PROC
;;;    MOV AX,@DATA
;;;    MOV DS,AX
;;;    
;;;    MOV AH,9
;;;    LEA DX,MSG1
;;;    INT 21H
;;;    
;;;    MOV BX,0
;;;    
;;;    INPUT:
;;;        MOV AH,1
;;;        INT 21H
;;;        
;;;        CMP AL,'0'
;;;        JE ZERO
;;;        
;;;        CMP AL,'1'
;;;        JE ONE
;;;        
;;;        CMP AL,0DH
;;;        JE ENTER
;;;        
;;;        JMP INVALID
;;;        
;;;        ZERO:
;;;            SUB AL,30H
;;;            SHL BX,1
;;;            OR BL,AL
;;;            
;;;            JMP INPUT
;;;        
;;;        ONE:
;;;            SUB AL,30H
;;;            SHL BX,1
;;;            OR BL,AL
;;;            
;;;            JMP INPUT
;;;        
;;;        ENTER:
;;;            
;;;            MOV CH,0
;;;            MOV CL,1
;;;            
;;;            MOV AH,9
;;;            LEA DX,MSG2
;;;            INT 21H
;;;            
;;;            SHOW:
;;;                
;;;     
;;;                
;;;                CMP CH,4
;;;                JE FINISH
;;;                INC CH
;;;                
;;;                
;;;                MOV DL,BH
;;;                SHL DL,4
;;;                
;;;                
;;;                
;;;                CMP DL,30H
;;;                JGE DIGIT
;;;                
;;;                CMP DL,41H
;;;                JGE LETTER
;;;                
;;;                 
;;;                 
;;;                 
;;;                
;;;               
;;;                
;;;                DIGIT:
;;;                    CMP DL,39H
;;;                    JLE OKD
;;;                    JMP LETTER
;;;                        
;;;                        OKD:
;;;                            ADD DL,30H
;;;                            MOV AH,2
;;;                            INT 21H
;;;                            ROL BX,4
;;;                            JMP SHOW 
;;;                            
;;;              LETTER:
;;;                    CMP DL,46H
;;;                    JLE OKL
;;;                    JMP INVALID
;;;                    
;;;                        OKL:
;;;                            ADD DL,37H
;;;                            MOV AH,2
;;;                            INT 21H
;;;                            ROL BX,4
;;;                            JMP SHOW
;;;        
;;;        INVALID:
;;;            MOV AH,9
;;;            LEA DX,MSG3
;;;            INT 21H
;;;
;;;             MOV AH,4CH
;;;             INT 21H
;;;            
;;;        FINISH:
;;;            MOV AH,4CH
;;;            INT 21H
;;;            
;;;            MAIN ENDP
;;;END MAIN
;;;
;;;    
;;
;
;; 
;
;;;=====Hexa To Binary Convertion=========      
;
;.MODEL SMALL
;.STACK 100H
;.DATA
;    MSG1 DB '(1)-> 8 BIT BAINARY   (2)-> 16BIT BINARY $'
;    MSG2 DB 0DH,0AH,'ENTER YOUR OPTION : $'
;    MSG3 DB 0DH,0AH,'INVALID KEY PRESS $'
;    MSG4 DB 0DH,0AH,'ENTER 4 BIT HEXA VALUE : $'
;    MSG5 DB 0DH,0AH,'ENTER 8 BIT HEXA VALUE : $'
;    MSG6 DB 0DH,0AH,'CONVERTED BIANRY VALUE : $'
;.CODE
;MAIN PROC
;    MOV AX,@DATA
;    MOV DS,AX
;    
;    MOV AH,9
;    LEA DX,MSG1
;    INT 21H
;    
;    LEA DX,MSG2
;    INT 21H
;    
;    MOV AH,1
;    INT 21H
;    
;    CMP AL,'1'
;    JE B8
;    
;    CMP AL,'2'
;    JE B16
;    
;    JMP INVALID
;    
;    B8:
;        MOV AH,9
;        LEA DX,MSG4
;        INT 21H
;        
;        XOR BL,BL
;        
;        INPUT:
;            MOV AH,1
;            INT 21H
;        
;            CMP AL,0DH
;            JE FINISH
;            
;            CMP AL,41H
;            JGE LETTER
;            
;            CMP AL,30H
;            JGE DIGIT
;            
;            LETTER:
;            
;                CMP AL,46H
;                JLE LOK
;                JMP INVALID
;                
;                LOK:
;                    SUB AL,37H
;                    SHL BL,4
;                    OR BL,AL
;                    
;                    JMP INPUT
;                    
;            
;            DIGIT:
;                
;                CMP AL,39H
;                JLE DOK
;                JMP INVALID
;                
;                DOK:
;                    SUB AL,30H
;                    SHL BL,4
;                    OR BL,AL
;                    
;                    JMP INPUT
;                 
;            
;            FINISH:
;            
;                MOV DL,0
;                MOV CH,0
;                MOV DL,BL
;                
;                MOV AH,9
;                LEA DX,MSG6
;                INT 21H
;                
;                OUTPUT:
;                    CMP CH,8
;                    JE EXIT
;                    INC CH
;                    
;                    SHL BL,1
;                    JC ONE
;                    JMP ZERO
;                    
;                    ONE:
;                        MOV AH,2
;                        MOV DL,'1'
;                        INT 21H  
;                        
;                        LOOP OUTPUT
;                    
;                    ZERO:
;                        MOV AH,2
;                        MOV DL,'0'
;                        INT 21H
;                        
;                        LOOP OUTPUT
;                        
;                       
;                            
;                        EXIT:
;                            MOV AH,4CH
;                            INT 21H
;                            
; 
;    B16:
;    
;        MOV AH,9
;        LEA DX,MSG5
;        INT 21H
;        
;        XOR BX,BX
;        
;        INPUT1:
;            MOV AH,1
;            INT 21H
;            
;            CMP AL,0DH
;            JE FINISH1
;            
;            CMP AL,41H
;            JGE LETTER1
;            
;            CMP AL,30H
;            JGE DIGIT1
;            
;            LETTER1:
;            
;                CMP AL,46H
;                JLE LOK1
;                JMP INVALID
;                
;                LOK1:
;                    SUB AL,37H
;                    SHL BX,4
;                    OR BL,AL
;                    
;                    JMP INPUT1
;                    
;            
;            DIGIT1:
;                
;                CMP AL,39H
;                JLE DOK1
;                JMP INVALID
;                
;                DOK1:
;                    SUB AL,30H
;                    SHL BX,4
;                    OR BL,AL
;                    
;                    JMP INPUT1
;                 
;            
;            FINISH1:
;            
;                MOV DL,0
;                MOV CX,0
;                MOV DL,BL
;                
;                MOV AH,9
;                LEA DX,MSG6
;                INT 21H
;                
;                OUTPUT1:
;                    CMP CX,16
;                    JE EXIT1
;                    INC CX
;                    
;                    SHL BX,1
;                    JC ONE1
;                    JMP ZERO1
;                    
;                    ONE1:
;                        MOV AH,2
;                        MOV DL,'1'
;                        INT 21H  
;                        
;                        JMP OUTPUT1
;                    
;                    ZERO1:
;                        MOV AH,2
;                        MOV DL,'0'
;                        INT 21H
;                        
;                        JMP OUTPUT1
;                        
;                        
;                            
;                        EXIT1:
;                            MOV AH,4CH
;                            INT 21H
;    
;    
;    
;    INVALID:
;        MOV AH,9
;        LEA DX,MSG3
;        INT 21H
;                            
;       
;       
;       MOV AH,4CH
;       INT 21H 
;       
;       MAIN ENDP
;END MAIN
;
;
; 

;.MODEL SMALL
;.STACK 100H
;.DATA
;    MSG1 DB 'ENTER HEXA VALUE (0-FFFF) : $'
;    MSG2 DB 0DH,0AH,'RESULT : $'
;.CODE
;MAIN PROC
;    MOV AX,@DATA
;    MOV DS,AX
;    
;    XOR BX,BX
;    MOV CH,0
;    
;    MOV AH,9
;    LEA DX,MSG1
;    INT 21H
;    
;    INPUT:
;    MOV AH,1
;    INT 21H
;    
;    CMP AL,41H
;    JGE LETTER
;    
;    CMP AL,30H
;    JGE DIGIT
;    
;    CMP AL,0DH
;    JE ENTER
;    
;    LETTER:
;        CMP AL,46H
;        JLE LOK
;        LOK:
;            SUB AL,37H
;            SHL BX,4
;            OR BL,AL
;            JMP INPUT
;    
;    DIGIT:
;        CMP AL,39H
;        JLE DOK
;        DOK:
;            SUB AL,30H
;            SHL BX,4
;            OR BL,AL
;            JMP INPUT
;    
;    ENTER: 
;        MOV AH,9
;        LEA DX,MSG2
;        INT 21H
;    OUTPUT:
;        CMP CH,4
;        JE FINISH
;        INC CH
;        
;        MOV DL,BH
;        SHR DL,4
;        
;        CMP DL,0AH
;        JL DIGIT2
;        
;        ADD DL,37H
;        MOV AH,2
;        INT 21H
;        SHL BX,4
;        JMP OUTPUT
;        
;    DIGIT2:
;        ADD DL,30H
;        MOV AH,2
;        INT 21H
;        SHL BX,4
;        JMP OUTPUT
;    FINISH:
;        MOV AH,4CH
;        INT 21H
;        
;        MAIN ENDP
;END MAIN
;
;BINARY TO HEXA

.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER BINATY VALUE : $'
    MSG2 DB 0DH,0AH,'CONVERTED HEXA VALUE : $'
    MSG3 DB 0DH,0AH,'ILLEGAL INPUT PRESS.'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    XOR BX,BX               ;CLEAR BX REGISTER FOR SAVE BINARY VALUE 
    MOV CH,0                ;CLEAR CH REGISTER FOR OUTPUT COUNTING 
    MOV DL,0
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    INPUT:
        MOV AH,1
        INT 21H
        
        CMP AL,30H
        JE ZERO
        
        CMP AL,31H
        JE ONE
        
        CMP AL,0DH
        JE ENTER
        
        JMP INVALID 
        
        ZERO:
            SUB AL,30H
            SHL BX,1
            OR BL,AL
            JMP INPUT
            
        
        ONE:
            SUB AL,30H
            SHL BX,1
            OR BL,AL
            JMP INPUT
        
        
        
        ENTER:
            MOV AH,9
            LEA DX,MSG2
            INT 21H
            
            MOV DL,0
            
            OUTPUT:
                CMP CH,4
                JE FINISH
                INC CH
                
                MOV DL,BH
                SHR DL,4
                
                CMP DL,0AH
                JL DIGIT
                
                ADD DL,37H
                MOV AH,2
                INT 21H
                
                SHL BX,4
                JMP OUTPUT
           DIGIT:
                ADD DL,30H
                MOV AH,2
                INT 21H
                
                SHL BX,4
                JMP OUTPUT
                
               
                
        
        
        INVALID:
            MOV AH,9
            LEA DX,MSG3
            INT 21H
            
        
        
        FINISH:
               MOV AH,4CH
               INT 21H
               
               MAIN ENDP
END MAIN
        
        
     