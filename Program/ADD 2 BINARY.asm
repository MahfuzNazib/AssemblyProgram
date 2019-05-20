.MODEL SMALL
.STACK 100H
.DATA
     STR DB 0AH,0DH,'Illegal Input. $'
     LB DB 0DH,0AH,'$'
.CODE

MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
 
    MOV BL,0
    MOV CL,1
 
    TOP:
       MOV AH,1            ; INPUT CHARACTER
       INT 21H             ; COMPARE IS CR OR NOT
       CMP AL,0DH          ; IF EQUAL JUMP TO END IF NO THAN CONTINUE
       JE ENTER
     
       CMP AL,30H          ; COMPARE AL CONTAIN 0 OR NOT
       JNE CHECK           ; IF NO GOTO CHECK

       CONTINUE:
           SUB AL,30H      ;SUBTRACT 30H AND PUT INTO AL
                           ;
           SHL BL,CL       ; SHIFT BX LEFT 1 TIME
           OR BL,AL        ; OR BL AND AL

       JMP TOP
    CHECK:
        CMP AL,31H         ;COMPARE AL CONTAIN 1 OR NOT
        ;JNE MSG            ; IF NO GOTO MSG
        JMP CONTINUE       ; IF YES THAN GOTO CONTINUE
    
    ENTER:
        MOV AH,9
        LEA DX,LB
        INT 21H 
        MOV BH,0
        ;MOV CL,1
        
        JMP INPUT2
        
        INPUT2:
            MOV AH,1
            INT 21H
            
            CMP AL,0DH
            JE RESULT
            
            CMP AL,30H
            JNE CHECK1
            
            CONTINUE1:
                SUB AL,30H
                SHL BH,1
                OR BH,AL
                
                JMP INPUT2
                
                CHECK1:
                    CMP AL,31H
                    JMP CONTINUE1 
                    
            RESULT:
                ;MOV CL,8
                ADD BH,BL
                
                SHL BH,1
                JC ONE
                JMP ZERO
                
                ONE:
                    MOV AH,2
                    MOV DL,'1'
                    INT 21H
                    
                
                
                ZERO:
               
                MOV AH,2
                MOV DL,BH
                INT 21H
                
                
                
              
   
    MAIN ENDP
END MAIN 
