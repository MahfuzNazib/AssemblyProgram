.MODEL SMALL
.STACK 100H
.DATA
    Menu db 0dh,0ah,'1.Decimal To Octal   2.Decimal To Hexa  3.Decimal To Binary $'
    Line db 0dh,0ah,'-----------------    -----------------   -------------------- $'
    chso db 0dh,0ah,'Please choose your Option   : $'
    msg1 db 0dh,0ah,'Enter Total Number of Digit : $'
    msg2 db 0dh,0ah,'Enter a Decimal Number      : $'
    msg3 db 0dh,0ah,'Enter Decimal First Number  : $'
    msg4 db 0dh,0ah,'Enter Decimal Scond Number  : $'
    msg5 db 0dh,0ah,'---------------------------------- $'
    msg6 db 0dh,0ah,'Converted Octal Value is    : $'
    msg7 db 0dh,0ah,'Converted Hexa  Value is    : $'
    msg8 db 0dh,0ah,'Converted BinaryValue is    : $'
    msg9 db 0dh,0ah,'Do you want to continue?(Y/N) : $'
    invld db 0dh,0ah,'Invalid Key Press.Please Look at the option Number $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,Menu
    INT 21H 
    
    MOV AH,9
    LEA DX,Line
    INT 21H
    
    START:
    MOV AH,9
    LEA DX,chso
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL,31H
    JE OCTAL
    
    CMP AL,32H
    JE HEXA
    
    CMP AL,33H
    JE BINARY
    
    JMP INVALID
    
    OCTAL:
        MOV AH,9
        LEA DX,msg1
        INT 21H
        
        MOV AH,1
        INT 21H
        
        CMP AL,31H
        JE ONE_DIGIT8
        
        CMP AL,32
        JE TWO_DIGIT8
        
       
        
        
        JMP INVALID
        
        ONE_DIGIT8:
            MOV AH,9
            LEA DX,msg2
            INT 21H
            
            MOV AH,1
            INT 21H
            
            MOV BL,AL
            
             CMP AL,38H
            JE E8
        
            CMP AL,39H
            JE E9
        E8: 
            MOV AH,9
            LEA DX,msg2
            INT 21H
            
            MOV AH,2
            MOV DL,'1'
            INT 21H
            MOV DL,'0'
            INT 21H
            JMP ASK
       
            
        E9: 
            MOV AH,9
            LEA DX,msg2
            INT 21H
            
            MOV AH,2
            MOV DL,'1'
            INT 21H
            MOV DL,'1'
            INT 21H
            JMP ASK 
            
            CMP BL,30H
            JGE ONE_DIGIT8_1
            
           
            
            ONE_DIGIT8_1:
                CMP BL,37H
                JLE OK1_8
                JMP INVALID
                
                OK1_8:
                    MOV AH,9
                    LEA DX,msg6
                    INT 21H
                    
                    MOV AH,2
                    MOV DL,BL
                    INT 21H
                    JMP ASK
        
        TWO_DIGIT8:
            MOV AH,2
            MOV DL,'2'
            INT 21H
        
        JMP ASK
    
    HEXA:
        MOV AH,9
        LEA DX,msg1
        INT 21H
        
        MOV AH,1
        INT 21H
        
        CMP AL,31H
        JE ONE_DIGIT16
        
        CMP AL,32H
        JE TWO_DIGIT16
        
        JMP INVALID
        
        ONE_DIGIT16:
            MOV AH,2
            MOV DL,'1'
            INT 21H
        
        TWO_DIGIT16:
            MOV AH,2
            MOV DL,'2'
            INT 21H
        
        JMP ASK
    
    BINARY:
        MOV AH,9
        LEA DX,msg1
        INT 21H
        
        MOV AH,1
        INT 21H
        
        CMP AL,31H
        JE ONE_DIGIT2
        
        CMP AL,32
        JE TWO_DIGIT2
        
        JMP INVALID
        
        ONE_DIGIT2:
            MOV AH,2
            MOV DL,'1'
            INT 21H
        
        TWO_DIGIT2:
            MOV AH,2
            MOV DL,'1'
            INT 21H
        
        JMP ASK
        
    ASK:
        MOV AH,9
        LEA DX,msg9
        INT 21H
        
        MOV AH,1
        INT 21H
        
        CMP AL,'Y'
        JE START
        
        CMP AL,'y'
        JE START
        
        CMP AL,'N'
        JE EXIT
        
        CMP AL,'n'
        JE EXIT
        
        JMP INVALID
    
    
    INVALID:
        MOV AH,9
        LEA DX,invld
        INT 21H
        
        
        
        
        JMP START
    
    EXIT:
        MOV AH,4CH
        INT 21H
    
    
    MAIN ENDP
END MAIN
    