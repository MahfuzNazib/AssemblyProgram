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