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