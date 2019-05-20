.model small
.stack 100h
.data
    msg1 db 'Enter 1st Number : $'
    msg2 db 0dh,0ah,'Enter 2nd Number : $'
    msg3 db 0dh,0ah,'Result in (Mult) : $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    
    mov bl,al
    sub bl,30h
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,1
    int 21h
    
    sub al,30h
    
    mul bl
    AAM
    
    mov cx,ax
    
    add ch,30h
    add cl,30h
    
    mov ah,9
    lea dx,msg3
    int 21h
    
    mov ah,2
    mov dl,ch
    int 21h
    
    mov dl,cl
    int 21h
    
    mov ah,4ch
    int 21h 
    
    main endp
end main
    
 


