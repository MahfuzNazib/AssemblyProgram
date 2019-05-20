;Assembly Language Program Problem solve link>>

https://prosencoa.blogspot.com/2015/07/binary-to-hexadecimal-output-in_6.html


##Decimal To Binary Convertion ;Inorder ()


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
    
    AND bh,0Fh
    
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


=================================================
1.1 Decimal To Binary (Reverse Order)
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
    
    AND bh,0Fh
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    
    l:
    shr bh,1
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

---------------------------------------------------------------------------------

2.Hexa To Binary (8 bit Binary Value)

.model small
.stack 100h
.data
    msg1 db 0dh,0ah,'Enter a Hexa Value : $'
    msg2 db 0dh,0ah,'Converted Binary Value is : $'
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
    
    MOV AH,9
    LEA DX,msg2
    INT 21H
    
    l:
    shL bh,1
    
    jc one
    jmp z
    one:
    mov ah,2
    mov dl,'1'
    int 21h
    
    loop l
    
    jmp Exit
    
    z:
    
    mov ah,2
    mov dl,'0'
    int 21h
    
    loop l
    
    Exit:
    mov ah,4ch
    int 21h
    main endp
end main 

=-================================

3.Binary Input

.model small
.stack 100h
.data
    msg1 db 0dh,0ah,'Enter your Bit number : $'
    msg2 db 0dh,0ah,'Enter Binary value    : $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    sub al,30h
    mov cl,al
    xor ch,ch
    
    l1:
    int 21h
    and al,1h
    shl bl,1
    add bl,al
    loop l1
    main endp 
end main

===========================================

4.Hexa To Binary

;.MODEL SMALL 
;.DATA 
;M1 DB   0AH,0DH,'TYPE A HEXA NUMBER (0 - FFFF) : ','$' 
;M2 DB   0AH,0DH,'IN BINARY IT IS : ','$' 
;M3 DB   0AH,0DH,'ILLEGAL HEXA DIGIT, TRY AGAIN :','$' 
; .CODE 
;MAIN PROC  
; 
;MOV AX,@DATA  ;intialize DS  MOV DS,AX 
; 
; MOV AH,9  ; prompts user  
;LEA DX,M1  
;INT 21H 
; 
;START :
;	XOR BX,BX  
;	MOV CL,4  
;	MOV AH,1  
;	INT 21H   ;read 
;WHILE_:  
;	CMP AL,0DH  
;	JE END_WHILE  ;exit if CR  
;	CMP AL,'0'  ;detect for error  
;	JL ERR  
;	CMP AL, '9'  
;	JG LETTER  
;	AND AL,0FH  ;get numerical value  
;	JMP SHIFT
;
;LETTER:  
;CMP AL,'F'    ;if not in range (A…B) error  
;JG ERR  
;CMP AL,'A'  
;JL ERR  
;SUB AL,37H ;get numerical value 
; 
;SHIFT:   
;SHL BX,CL   ; ready to enter in register  
;OR BL,AL  
;INT 21H  
;JMP WHILE_  ;continue reading hexa 
; 
;END_WHILE:
;MOV AH,9  ; if finish reading  
;LEA DX,M2  ;display result  
;INT 21H    
;MOV CX,16  ;display content of 
; MOV AH,2 
;SHOW: 
;SHL BX,1  
;JC ONE    
;MOV DL,'0'  
;INT 21H  
;JMP LOOP1 
; 
;ONE:     
;MOV DL,'1'  
;INT 21H   
;LOOP1: 
;LOOP SHOW  ;do it 16 times  
;JMP OUT_ 
;
;ERR:   
;MOV AH,9  
;LEA DX,M3  ;display error MSG    
;INT 21H  
;JMP START  ;and read again     
;OUT_: 
;MOV AH,4CH  
;INT 21H 
;MAIN   ENDP  
;END MAIN    

======================================

Binary To Hexa

.MODEL SMALL 
 
.DATA 
M1 DB 0AH,0DH,'TYPE A BINARY DIGIT ,UP TO 16-BIT: ','$' 
M2 DB 0AH,0DH,'IN HEXA IT IS :','$' 
 
.CODE 
MAIN PROC  
MOV AX,@DATA ;initialize DS  MOV DS,AX 
 
 MOV AH,9  ;prompt user  
LEA DX,M1  
INT 21H  ;--------------  
MOV BX,0  ;prepare for read binary  
MOV AH,1 
 MOV CX,16 
 
L1: 
INT 21H  
CMP AL,0DH ;finish enter  
JE OUT_ 
 
 AND AL,01H ;convert to numerical 0,1  
SHL BX,1  ;store it in BX  
OR BL,AL  
LOOP L1

OUT_: 
MOV AH,9                   
LEA DX,M2  
INT 21H 
 
 
 
 MOV DH,4  ;show 4-digit hexa 
L2: 
MOV CL,4  
MOV DL,BH  
SHR DL,CL  
MOV AH,2 
 
 
 CMP DL,9 ;detect the digit  
JG LETTER  
ADD DL,30H  
INT 21H  
JMP L3 
 
LETTER:  
ADD DL,37H 
 INT 21H 
L3: 
ROL BX,CL  ;get second hexa digit      
DEC DH  
CMP DH,0  
JNE L2  ;if 4-digit hexa displayed exit

MOV AH,4CH  ;return to DOS 
 
INT 21H 
MAIN ENDP 
END MAIN   
 
==================================================

 
.model small
.stack 100h
.data
    msg1 db 0dh,0ah,'Enter Your Input : $'
    
    lb db 0dh,0ah,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    
    cmp al,41h
    jge Letter
    cmp al,30h
    jge Number
    
    
    mov ah,9
    lea dx,lb
    int 21h
    
    Letter:
    sub al,37h
    xor bl,bl
    shl bl,4
    or bl,al
    
    Number:
    sub al,30h
    xor bl,bl
    shl bl,4
    mov ah,1
    or bl,al
    
    int 21h
    
    sub al,30h
    shl bl,4
    or bl,al
    
    
    main endp
end main
    
    
  ================================

;mov ah,1
;xor bl,bl
;input:
;int 21h
;cmp al,0dh
;je exit
;
;cmp al,41h
;jge l1
;
;cmp al,30h
;jge l2
;
;jmp invalid
;
;l1:
;cmp al,46h
;jle letter 
;
;jmp invalid
;
;l2:
;cmp al,39h
;jle digit
;jmp invalid
;
;letter:
;sub al,37h
;shl bl,4
;or bl,al
;jmp input
;digit:
;sub al,30h
;shl bl,4
;or bl,al
;jmp input
;
;invalid:
;mov ah,2
;mov dl,'I'
;int 21h
;jmp input
;exit:
;mov ah,4ch
;int 21h
;
;
;main endp
;end main 
.model small
.stack 100h
.data
.code
main proc
    
    mov ah,1
xor bl,bl
input:
int 21h
cmp al,0dh
je exit

cmp al,41h
jge l1

cmp al,30h
jge l2

jmp invalid

l1:
cmp al,46h
jle letter 

jmp invalid

l2:
cmp al,39h
jle digit
jmp invalid

letter:
sub al,37h
shl bl,4
or bl,al
jmp input
digit:
sub al,30h
shl bl,4
or bl,al
jmp input

invalid:
mov ah,2
mov dl,'I'
int 21h

jmp input
exit:
mov ah,4ch
int 21h


    
    main endp
end main

==========================18.11.2018================    
  
;binary t hexa    

.MODEL SMALL
.STACK 100H
.DATA
     STR DB 0AH,0DH,'Illegal Input. $'
.CODE

MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
 
    MOV BX,0
    MOV CL,1
 
    TOP:
       MOV AH,1            ; INPUT CHARACTER
       INT 21H             ; COMPARE IS CR OR NOT
       CMP AL,0DH          ; IF EQUAL JUMP TO END IF NO THAN CONTINUE
       JE END_
     
       CMP AL,30H          ; COMPARE AL CONTAIN 0 OR NOT
       JNE CHECK           ; IF NO GOTO CHECK

       CONTINUE:
           SUB AL,30H      ;SUBTRACT 30H AND PUT INTO AL
                           ;
           SHL BX,CL       ; SHIFT BX LEFT 1 TIME
           OR BL,AL        ; OR BL AND AL

       JMP TOP
    CHECK:
        CMP AL,31H         ;COMPARE AL CONTAIN 1 OR NOT
        JNE MSG            ; IF NO GOTO MSG
        JMP CONTINUE       ; IF YES THAN GOTO CONTINUE
    END_:  
 
    MOV AH,2               ;
    MOV DL,0AH             ;
    INT 21H                ;NEW LINE
    MOV DL,0DH             ;
    INT 21H
 
    MOV CL,1
    MOV CH,0
    OUTPUT:
          CMP CH,4         ;COMPARE CH IS EQUAL 4
          JE FINISH        ;IF YES GOTO FINISH
          INC CH           ;INCREMENT CH
       
          MOV DL,BH        ;MOVE BH TO DL
          SHR DL,4         ;SHIFT DL 4 TIMES IN THE RIGHT
       
          CMP DL,0AH       ;COMPARE DL < 10
          JL DIGIT         ;IF YES GOTO DIGIT
       
          ADD DL,37H       ;ADD DL WITH 37h
          MOV AH,2         ;
          INT 21H          ;PRINTING DL
          ROL BX,4         ;ROTATE BX LEFT 4 TIMES
          JMP OUTPUT       ;JUMP TO OUTPUT
       
    DIGIT:
        ADD DL,30H         ;ADD DL WITH 30h
        MOV AH,2
        INT 21H            ;PRINTING DL
        ROL BX,4           ;ROTATE BX LEFT 4 TIMES
        JMP OUTPUT         ;JUMP TO OUTPUT
    MSG:
        MOV AH,9           ;
        LEA DX,STR         ;ILLEGAL MSG
        INT 21H            ;
     
    FINISH:  
    MOV AH,4CH
    INT 21H
           
   
    MAIN ENDP
END MAIN 

-------------------------------------------


.model small
.stack 100h
.data
    msg1 db 0dh,0ah,'Enter a Hexa Value : $'
    msg2 db 0dh,0ah,'Converted Binary Value is : $'
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
    
    MOV AH,9
    LEA DX,msg2
    INT 21H
    
    l:
    shL bh,1
    
    jc one
    jmp z
    one:
    mov ah,2
    mov dl,'1'
    int 21h
    
    loop l
    
    jmp Exit
    
    z:
    
    mov ah,2
    mov dl,'0'
    int 21h
    
    loop l
    
    Exit:
    mov ah,4ch
    int 21h
    main endp
end main 

----------------------------------------


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

------------------------------------



BINARY TO HEXA
-------------------------

    

.MODEL SMALL
.STACK 100H
.DATA
     STR DB 0AH,0DH,'Illegal Input. $'
.CODE

MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
 
    MOV BX,0
    MOV CL,1
 
    TOP:
       MOV AH,1            ; INPUT CHARACTER
       INT 21H             ; COMPARE IS CR OR NOT
       CMP AL,0DH          ; IF EQUAL JUMP TO END IF NO THAN CONTINUE
       JE END_
     
       CMP AL,30H          ; COMPARE AL CONTAIN 0 OR NOT
       JNE CHECK           ; IF NO GOTO CHECK

       CONTINUE:
           SUB AL,30H      ;SUBTRACT 30H AND PUT INTO AL
                           ;
           SHL BX,CL       ; SHIFT BX LEFT 1 TIME
           OR BL,AL        ; OR BL AND AL

       JMP TOP
    CHECK:
        CMP AL,31H         ;COMPARE AL CONTAIN 1 OR NOT
        JNE MSG            ; IF NO GOTO MSG
        JMP CONTINUE       ; IF YES THAN GOTO CONTINUE
    END_:  
 
    MOV AH,2               ;
    MOV DL,0AH             ;
    INT 21H                ;NEW LINE
    MOV DL,0DH             ;
    INT 21H
 
    MOV CL,1
    MOV CH,0
    OUTPUT:
          CMP CH,4         ;COMPARE CH IS EQUAL 4
          JE FINISH        ;IF YES GOTO FINISH
          INC CH           ;INCREMENT CH
       
          MOV DL,BH        ;MOVE BH TO DL
          SHR DL,4         ;SHIFT DL 4 TIMES IN THE RIGHT
       
          CMP DL,0AH       ;COMPARE DL < 10
          JL DIGIT         ;IF YES GOTO DIGIT
       
          ADD DL,37H       ;ADD DL WITH 37h
          MOV AH,2         ;
          INT 21H          ;PRINTING DL
          ROL BX,4         ;ROTATE BX LEFT 4 TIMES
          JMP OUTPUT       ;JUMP TO OUTPUT
       
    DIGIT:
        ADD DL,30H         ;ADD DL WITH 30h
        MOV AH,2
        INT 21H            ;PRINTING DL
        ROL BX,4           ;ROTATE BX LEFT 4 TIMES
        JMP OUTPUT         ;JUMP TO OUTPUT
    MSG:
        MOV AH,9           ;
        LEA DX,STR         ;ILLEGAL MSG
        INT 21H            ;
     
    FINISH:  
    MOV AH,4CH
    INT 21H
           
   
    MAIN ENDP
END MAIN 


**BINARY TO HEXA


================BINARY TO HEXA===============

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




===================hexa to binary===========



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




==============ADD 2 BINARY VALUE============

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




