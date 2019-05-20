;
;
;
;;-=============================================================================================
.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER 8 OR 16 BIT BINARY VALUE  : $'
    MSG2 DB 0DH,0AH,'CONVERTED HEXA VALUE IS : $'
    MSG3 DB 0DH,0AH,'INVALID KEY PRESS $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV BX,0
    
    INPUT:
        MOV AH,1
        INT 21H
        
        CMP AL,'0'
        JE ZERO
        
        CMP AL,'1'
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
            
            MOV CH,0
            MOV CL,1
            
            MOV AH,9
            LEA DX,MSG2
            INT 21H
            
            SHOW:
                
     
                
                CMP CH,4
                JE FINISH
                INC CH
                
                
                MOV DL,BH
                SHL DL,4
                
                
                
                CMP DL,30H
                JGE DIGIT
                
                CMP DL,41H
                JGE LETTER
                
                 
                 
                 
                
               
                
                DIGIT:
                    CMP DL,39H
                    JLE OKD
                    JMP LETTER
                        
                        OKD:
                            ADD DL,30H
                            MOV AH,2
                            INT 21H
                            ROL BX,4
                            JMP SHOW 
                            
              LETTER:
                    CMP DL,46H
                    JLE OKL
                    JMP INVALID
                    
                        OKL:
                            ADD DL,37H
                            MOV AH,2
                            INT 21H
                            ROL BX,4
                            JMP SHOW
        
        INVALID:
            MOV AH,9
            LEA DX,MSG3
            INT 21H

             MOV AH,4CH
             INT 21H
            
        FINISH:
            MOV AH,4CH
            INT 21H
            
            MAIN ENDP
END MAIN
 
 
;;.MODEL SMALL
;;.STACK 100H
;;.DATA
;;     STR DB 0AH,0DH,'Illegal Input. $'
;;.CODE
;;
;;MAIN PROC
;; 
;;    MOV AX,@DATA
;;    MOV DS,AX
;; 
;;    MOV BX,0
;;    MOV CL,1
;; 
;;    TOP:
;;       MOV AH,1            ; INPUT CHARACTER
;;       INT 21H             ; COMPARE IS CR OR NOT
;;       CMP AL,0DH          ; IF EQUAL JUMP TO END IF NO THAN CONTINUE
;;       JE END_
;;     
;;       CMP AL,30H          ; COMPARE AL CONTAIN 0 OR NOT
;;       JNE CHECK           ; IF NO GOTO CHECK
;;
;;       CONTINUE:
;;           SUB AL,30H      ;SUBTRACT 30H AND PUT INTO AL
;;                           ;
;;           SHL BX,CL       ; SHIFT BX LEFT 1 TIME
;;           OR BL,AL        ; OR BL AND AL
;;
;;       JMP TOP
;;    CHECK:
;;        CMP AL,31H         ;COMPARE AL CONTAIN 1 OR NOT
;;        JNE MSG            ; IF NO GOTO MSG
;;        JMP CONTINUE       ; IF YES THAN GOTO CONTINUE
;;    END_:  
;; 
;;    MOV AH,2               ;
;;    MOV DL,0AH             ;
;;    INT 21H                ;NEW LINE
;;    MOV DL,0DH             ;
;;    INT 21H
;; 
;;    MOV CL,1
;;    MOV CH,0
;;    OUTPUT:
;;          CMP CH,4         ;COMPARE CH IS EQUAL 4
;;          JE FINISH        ;IF YES GOTO FINISH
;;          INC CH           ;INCREMENT CH
;;       
;;          MOV DL,BH        ;MOVE BH TO DL
;;          SHR DL,4         ;SHIFT DL 4 TIMES IN THE RIGHT
;;       
;;          CMP DL,0AH       ;COMPARE DL < 10
;;          JL DIGIT         ;IF YES GOTO DIGIT
;;       
;;          ADD DL,37H       ;ADD DL WITH 37h
;;          MOV AH,2         ;
;;          INT 21H          ;PRINTING DL
;;          ROL BX,4         ;ROTATE BX LEFT 4 TIMES
;;          JMP OUTPUT       ;JUMP TO OUTPUT
;;       
;;    DIGIT:
;;        ADD DL,30H         ;ADD DL WITH 30h
;;        MOV AH,2
;;        INT 21H            ;PRINTING DL
;;        ROL BX,4           ;ROTATE BX LEFT 4 TIMES
;;        JMP OUTPUT         ;JUMP TO OUTPUT
;;    MSG:
;;        MOV AH,9           ;
;;        LEA DX,STR         ;ILLEGAL MSG
;;        INT 21H            ;
;;     
;;    FINISH:  
;;    MOV AH,4CH
;;    INT 21H
;;           
;;   
;;    MAIN ENDP
;;END MAIN             
;;    
;;
;;
;;    
;;
;;   
;;
;;
;;
;;   

.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER BINARY VALUE : $'
    MSG2 DB 0DH,0AH,'CONVERTED HEXA VALUE : $'
    MSG3 DB 0DH,0AH,'INVALID INPUT $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    XOR BX,BX
    
    INPUT:
    MOV AH,1
    INT 21H
    
    CMP AL,'1'
    JE ONE
    
    CMP AL,'0'
    JE ZERO
    
    CMP AL,0DH
    JE ENTER
    
    JMP FINISH
    
    ONE:
    
        MOV AH,1
        INT 21H
        
        SUB AL,30H
        SHL BX,4
        OR BL,AL
        
        JMP INPUT 
    
    ZERO:
    
        MOV AH,1
        INT 21H
        
        SUB AL,30H
        SHL BX,4
        OR BL,AL
        
        JMP INPUT
    
    ENTER:
        
        MOV CH,0
        MOV CL,1
        
        MOV AH,9
        LEA DX,MSG2
        INT 21H
        
        OUTPUT:
            CMP CH,4
            JE FINISH
            
            INC CH
            
            MOV DL,BH
            SHR DL,4
            
            CMP DL,30H
            JGE DIGIT
            
            CMP DL,41H
            JGE LETTER
            
            DIGIT:
                CMP DL,39H
                JLE DOK
                JMP LETTER
                
                DOK:
                    ADD DL,30H
                    MOV AH,2
                    INT 21H
                    ROL BX,4
                    JMP OUTPUT
                    
            LETTER:
                CMP DL,46H
                JLE LOK
                JMP FINISH
                    
                    LOK:
                        ADD DL,37H
                        MOV AH,2
                        INT 21H
                        ROL BX,4
                        JMP OUTPUT
                         
             FINISH:
                MOV AH,4CH
                INT 21H
                
                MAIN ENDP
END MAIN
 
 
 
 
;.MODEL SMALL
;.STACK 100H   
;.DATA
;.CODE
;MAIN PROC
;    MOV AH,1
;    INT 21H
;    
;    CMP AL,30H
;    JGE DIGIT
;    
;    CMP AL,41H
;    JGE DIGIT
;    
;    DIGIT:
;        CMP AL,39H
;        JLE DOK
;        JMP LETTER
;            DOK:
;                MOV AH,2
;                MOV DL,'D'
;                INT 21H
;                JMP EXIT
;   LETTER:
;        CMP AL,46H
;        JLE LOK
;            LOK:
;                MOV AH,2
;                MOV DL,'L'
;                INT 21H
;                
;                EXIT:
;                    MOV AH,4CH
;                    INT 21H
;                    
;                MAIN ENDP
;END MAIN
;         
;    