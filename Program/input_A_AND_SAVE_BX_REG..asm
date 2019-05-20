

;;**Question : Input A to F and save BX Register This way A0B0.But if Input F then BX=A010 

;
XOR BH,BH
XOR BL,BL
mov ah,1
int 21h 

mov bh,al
sub bh,37h
shl bh,4
cmp al,46h
je exp
inc al
mov bl,al
sub bl,37h
shl bl,4
jmp exit
exp:
mov al,'1'
mov bl,al
shl bl,4
exit:
mov ah,4
int 21h
;

----------------------------------------------------------


;**Input A and It will save AB in BL Register

xor bl,bl
mov ah,1
int 21h

mov bl,al
sub bl,37h
shl bl,4
inc al
sub al,37h
or bl,al 
;
----------------------------------------------
;**Input A and save BA in BL Register
;
xor bl,bl
mov ah,1
int 21h

mov bl,al
sub bl,37h
inc al
sub al,37h
shl al,4
or bl,al 

--------------------------------------
;**Input A and It will Save B0A0 in BX Register

xor bh,bh
xor bl,bl

mov ah,1
int 21h

mov bl,al
sub bl,37h
shl bl,4

inc al
sub al,37h
mov bh,al
shl bh,4


