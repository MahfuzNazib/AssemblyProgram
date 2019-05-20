;**Reverse Output Print

.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER TOTAL NUMBER OF INPUT: $'
    LB DB 0DH,0AH,'$'
    MSG2 DB 0DH,0AH,'REVERSED RESULT IS : $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    XOR CH,CH
    XOR CL,CL
    XOR BX,BX
    XOR DH,DH
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV CL,AL
    SUB CL,30H
    
    MOV AH,9
    LEA DX,LB
    INT 21H
    
    INPUT:
        MOV AH,1
        INT 21H
        MOV BL,AL
        PUSH BX
        INC DH
        LOOP INPUT
    
    MOV CL,DH
    MOV AH,9
    LEA DX,LB
    INT 21H
    
    OUTPUT:
        POP BX
        MOV AH,2
        MOV DL,BL
        INT 21H
        LOOP OUTPUT
        
        MAIN ENDP
END MAIN
        
    
    
    
    
    

           