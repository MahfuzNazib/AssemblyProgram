.model small
.stack 100h
.data

.code
    main proc
        mov ah,1
        int 21h
        sub al,37h
        
        mov bl,al
        
        shl bx,8
        inc al
        mov bl,al
        shl bx,4