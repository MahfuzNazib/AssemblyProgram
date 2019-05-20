.model samll
.stack 100h
.data
.code 
main proc
    
    mov bh,0
    mov bl,10d 
    
    input:
    mov ah,1
    int 21h
    cmp al,13d
    jne number 
    
    and cx,0
    mov cl,bh
    dec cl
    and ax,0
    mov al,bh
    jmp factorial
    
    
    number:
    sub al,30h
    mov cl,al
    mov al,bh
    mul bl
    add al,cl
    mov bh,al
    jmp input
    
    factorial:
    mul cx
    loop factorial 
    
    and dx,0
    mov cx,10d
    
    mov bx,0000h
    
    store:
    div cx
    mov [0000h+bx],dx
    
    add bx,2h
    mov dx,0
    cmp ax,0
    jne store
    
    mov ah,2
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h
        
    print:
    sub bx,2h
    mov dl,[0000h+bx]
    add dl,30h
    int 21h 
    cmp bx,0
    jne print