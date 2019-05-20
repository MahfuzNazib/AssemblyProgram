;;.MODEL SMALL
;;.STACK 100H
;;.DATA
;;.CODE
;;MAIN PROC
;;    MOV AH,1
;;    INT 21H
;;
;
;mov al,14h
;;sub al,30h
;mov bl,33h
;sub bl,30h
;mul bl
;sub al,06h
;mov ah,2
;mov dl,al
;int 21h
;

.model small
.stack 100h
.data
    msg1 db 0dh,0ah,'Enter a Decimal Number  : $'
    msg2 db 0dh,0ah,'Factorial Value in hexa : $'
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
    
    dec al
    mov cl,al
    sub cl,30h
    mov ch,0
    
    mov ax,bx
    
    l:
    dec bl
    mul bx
    loop l
    
    
    
    
    main endp
end main
    
        