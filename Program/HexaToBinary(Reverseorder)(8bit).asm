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
    shr bh,1
    
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


    
    




