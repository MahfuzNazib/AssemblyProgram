;.model small
;.stack 100h
;.data
;    lb db 0dh,0ah,'$'
;.code
;main proc
;    mov ax,@data
;    mov ds,ax
;    
;    xor bx,bx
;    
;    input:
;    mov ah,1
;    int 21h
;    
;    cmp al,0dh
;    je Enter
;    
;    while:
;    and al,0Fh
;    shl bx,1
;    or bl,al
;    jmp input
;    
;    Enter:
;    mov ch,0
;    mov ah,9
;    lea dx,lb
;    int 21h
;    
;    output:
;        cmp ch,4
;        je exit
;        inc ch
;        
;        mov dl,bh
;        shr dl,4
;        
;        cmp dl,0Ah
;        jl digit
;        
;        add dl,37h
;        mov ah,2
;        int 21h
;        rol bx,4
;        jmp output
;        
;        digit:
;        
;        add dl,30h
;        mov ah,2
;        int 21h
;        rol bx,4
;        jmp output
;        
;        exit:
;        mov ah,4ch
;        int 21h
;        
        
  

;.MODEL SMALL
;.STACK 100H
;.DATA
;     STR DB 0AH,0DH,'Illegal Input. $'
;.CODE
;
;MAIN PROC
; 
;    MOV AX,@DATA
;    MOV DS,AX
; 
;    MOV BX,0
;    MOV CL,1
; 
;    TOP:
;       MOV AH,1            ; INPUT CHARACTER
;       INT 21H             ; COMPARE IS CR OR NOT
;       CMP AL,0DH          ; IF EQUAL JUMP TO END IF NO THAN CONTINUE
;       JE END_
;     
;       CMP AL,30H          ; COMPARE AL CONTAIN 0 OR NOT
;       JNE CHECK           ; IF NO GOTO CHECK
;
;       CONTINUE:
;           SUB AL,30H      ;SUBTRACT 30H AND PUT INTO AL
;                           ;
;           SHL BX,CL       ; SHIFT BX LEFT 1 TIME
;           OR BL,AL        ; OR BL AND AL
;
;       JMP TOP
;    CHECK:
;        CMP AL,31H         ;COMPARE AL CONTAIN 1 OR NOT
;        JNE MSG            ; IF NO GOTO MSG
;        JMP CONTINUE       ; IF YES THAN GOTO CONTINUE
;    END_:  
; 
;    MOV AH,2               ;
;    MOV DL,0AH             ;
;    INT 21H                ;NEW LINE
;    MOV DL,0DH             ;
;    INT 21H
; 
;    MOV CL,1
;    MOV CH,0
;    OUTPUT:
;          CMP CH,4         ;COMPARE CH IS EQUAL 4
;          JE FINISH        ;IF YES GOTO FINISH
;          INC CH           ;INCREMENT CH
;       
;          MOV DL,BH        ;MOVE BH TO DL
;          SHR DL,4         ;SHIFT DL 4 TIMES IN THE RIGHT
;       
;          CMP DL,0AH       ;COMPARE DL < 10
;          JL DIGIT         ;IF YES GOTO DIGIT
;       
;          ADD DL,37H       ;ADD DL WITH 37h
;          MOV AH,2         ;
;          INT 21H          ;PRINTING DL
;          ROL BX,4         ;ROTATE BX LEFT 4 TIMES
;          JMP OUTPUT       ;JUMP TO OUTPUT
;       
;    DIGIT:
;        ADD DL,30H         ;ADD DL WITH 30h
;        MOV AH,2
;        INT 21H            ;PRINTING DL
;        ROL BX,4           ;ROTATE BX LEFT 4 TIMES
;        JMP OUTPUT         ;JUMP TO OUTPUT
;    MSG:
;        MOV AH,9           ;
;        LEA DX,STR         ;ILLEGAL MSG
;        INT 21H            ;
;     
;    FINISH:  
;    MOV AH,4CH
;    INT 21H
;           
;   
;    MAIN ENDP
;END MAIN 

.model small
.stack 100h
.data
    msg1 db 0dh,0ah,'Total Number of 1 is : $'
    msg2 db 'Enter Number : $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9                            ;print msg2
    lea dx,msg2
    int 21h
    
    mov ah,1                             ;Input a value
    int 21h
    
    sub al,37h                           ;Subtract 30h to make pure number.if we input 5 then it will save 35.then 35-30=5.
    mov cl,0                             ;define cl=0
    mov ch,0                             ;define ch=0
    
    check:
        shl al,1                         ;shift left 1 times
        jc one                           ;if CF 1 then go to one label
        cmp cl,8                         ;check cl=8
        je output                        ;if cl=8 then go to output label
        inc cl                           ;if cl not equal to 8 then increment cl value
        jmp check                        ;go to check label
        
        one:
            inc ch                       ;increment ch value for count total number of 1
            jmp check                    ;go to check label
   output:
        add ch,30h                       ;add 30h.if ch=2 then the binary value is=0000 0010.it will show null.but if add 0011 0000.(0000 0010+0011 0000)=0011 0010;it will print 2
        mov ah,9
        lea dx,msg1                      ;print msg2
        int 21h
        mov ah,2
        mov dl,ch                        ;print ch
        int 21h 