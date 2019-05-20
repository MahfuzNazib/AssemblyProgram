.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    XOR BX,BX
    INPUT:
    MOV AH,1
    INT 21H
    
    CMP AL,41H
    JGE LETTER
    
    CMP AL,30H
    JGE DIGIT
    
    CMP AL,0DH
    JE ENTER
    
    LETTER:
        CMP AL,46H
        JLE LOK
        LOK:
            SUB AL,37H
            SHL BX,4
            OR BL,AL
            JMP INPUT
    DIGIT:
        CMP AL,39H
        JLE DOK
        DOK:
            SUB AL,30H
            SHL BX,4
            OR BL,AL
            JMP INPUT
    ENTER:
        MOV AH,2
        MOV DL,0DH
        INT 21H
        MOV DL,0AH
        INT 21H
        MOV CH,0
        
    OUTPUT:
        
        
         CMP CH,4
         JE FINISH
         INC CH
         
         MOV DL,BH
         SHR DL,4
         
         CMP DL,0AH
         JL D
         ADD DL,37H
         MOV AH,2
         INT 21H
         ROL BX,4
         JMP OUTPUT
         
         D:
         ADD DL,30H
         MOV AH,2
         INT 21H
         ROL BX,4
         JMP OUTPUT 
         
         FINISH:
         MOV AH,4CH
         INT 21H
         
            
    
    