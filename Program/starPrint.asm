.model small
.stack 100h
.data
    msg1 db 'Enter Your Input : $'
    LB db 0dh,0ah,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    sub al,30h
    
    mov cl,al
    
    mov bl,0
    mov bh,0
    
    outerloop:
    cmp bl,cl
    je endo
    inc bl
    
    mov ah,9
    lea dx,LB
    int 21h
    mov bh,1
    
    Innerloop:
   
    mov ah,2
    mov dl,'*'
    int 21h
    cmp bh,bl
    
    je outerloop
    inc bh
    jmp Innerloop
    
    mov ah,9
    lea dx,LB
    int 21h 
    
    jmp outerloop
    
    endo:
    
    mov ah,4ch
    int 21h
    
    main endp
end main
    
    
    
     