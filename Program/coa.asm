1.How to identify whether a hexa number is even or odd ? 
Ans>>
xor bx,bx               ;clear BX register to Save Value
mov bl,0Ah              ;Define 'A' in DL Register
shr bl,1                ;Shift Right to Check the LSB is 0 or 1
jc Odd                  ;if CF is 1 then go to Odd Label
jmp Even                ;if CF is not 1 then go to Even Label
Odd:
    mov ah,2
    mov dl,'O'          ;Print that this is a Odd Value
    int 21h 
    jmp exit            ;After print Odd then go to Exit label
Even:
    mov ah,2
    mov dl,'E'          ;Print that this is a Even Value
    int 21h
exit:
    mov ah,4ch
    int 21h 
    
       ;**************//////We define A in bl register.The binary value of A = 1010. The LSB is 0. its a Even number.********************//
	   
	   

2.Input a Negative Number.
Ans>>
mov bh,0Ah

;****Its a Negative Value. Because the MSB is 1.If the MSB is 0 then this number is Positive

3.Input a hexa value and save it BX Register
Ans>>
xor bL,bL                ;clear BL register
input:               
mov ah,1                 ;Input Number
int 21h

cmp al,41h               ;compare,is it equal or greater then 41h
jge l                    ;if its greater or equal 41h then go to l label

cmp al,30h               ;compare,is it equal or greater then 30h
jge d                    ;if its greater or equal 30h then go to d label

l:
    cmp al,46h            ;compare,is it equal or less  then 46h         
    jle lok               ;if its less or equal 46h then go to lok label
    lok:
        sub al,37h       ;subtract 37h         
        shl bl,4         ;4 times shift left to input next number
        or bl,al         ;OR bl and al
        jmp input        ;again go to input
d:
    cmp al,39h
    jle dok
    dok:
        sub al,30h
        shl bl,4
        or bl,al
        jmp input



4.Input a Hexa Value
Ans>>
xor bL,bL                ;clear BL register
input:               
mov ah,1                 ;Input Number
int 21h

cmp al,41h               ;compare,is it equal or greater then 41h
jge l                    ;if its greater or equal 41h then go to l label

cmp al,30h               ;compare,is it equal or greater then 30h
jge d                    ;if its greater or equal 30h then go to d label

l:
    cmp al,46h            ;compare,is it equal or less  then 46h         
    jle lok               ;if its less or equal 46h then go to lok label
    lok:
        sub al,37h       ;subtract 37h         
        shl bl,4         ;4 times shift left to input next number
        or bl,al         ;OR bl and al
        jmp input        ;again go to input
d:
    cmp al,39h
    jle dok
    dok:
        sub al,30h
        shl bl,4
        or bl,al
        jmp input

5.How to check Bit Position Number
Ans>>
;if we want to check Bit position number then we use shl or shr.it depends bit position value.suppose we have 0101 binary value.now we want to check bit position 2.
;In 0101 bit position value is 1

mov ah,1
int 21h
shr al,3
jc one
jmp zero
one:
    mov ah,2
    mov dl,' '
    int 21h
    mov dl,'1'
    int 21h
    jmp exit
zero:
    mov ah,2
    mov dl,' '
    int 21h
    mov dl,'0'
    int 21h
exit:
    mov ah,4ch
    int 21h
    
6.How to check total number of 1 in a binary number 
Ans>>
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
    
    sub al,30h                           ;Subtract 30h to make pure number.if we input 5 then it will save 35.then 35-30=5.
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
    
 ;*****This program is applicable for number (0-9).if we input (A-F) the make another label in the same way :0              



8.How to check ZF 
Ans>> 
mov ah,1
int 21h

sub al,30h

shl al,8
jz y
jmp n
y:
mov ah,2
mov dl,'Y'
int 21h
jmp e

n:
mov ah,2
mov dl,'N'
int 21h
e:
mov ah,4ch
int 21h


9.Input Hexa value and print it in console
Ans>>
go to" https://notepad.pw/17k783q " this link 
10.Binary input and print in Hexa
go to" https://notepad.pw/17k783q " this link
					|
					|
					|
					|
					|
					|
					|
					|
					|
					|
					|
					|
				  <<>>
				  HAPPY LAB EXAM
				  
				  






 
