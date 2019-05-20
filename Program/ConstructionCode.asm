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
 