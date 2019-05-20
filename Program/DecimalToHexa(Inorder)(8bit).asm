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