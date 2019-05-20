
.model small
.stack 100h
.data
   msg1 db 0dh,0ah,09,'Please Choose Your Option $'
   msg2 db 0dh,0ah,09,'1. UpperToLower   2.LowerToUpper  3.Exit $'
   msg3 db 0dh,0ah,09,' --------------   --------------  ------ $'
   msg4 db 0dh,0ah,09,'Enter a Upper Case Alphabet  : $'
   msg5 db 0dh,0ah,09,'Enter a Lower Case Alphabet  : $'
   msg6 db 0dh,0ah,09,'Converted Result is (Gates)  : $'
   msg7 db 0dh,0ah,09,'Invalid Key Press.Please Press 1,2 or 3 $'
   msg8 db 0dh,0ah,09,'Do you Want To Exit Program (Y/N) : $'
   msg9 db 0dh,0ah,09,'-----Exit Program ------------ $'
   msg10 db 0dh,0ah,09,'Do you Run program (Y/N) : $'
   msg11 db 0dh,0ah,09,'Enter Your Option No. : $'   
.code
main proc
    mov ax,@data
    mov ds,ax
    
    option:
    mov ah,9
    lea dx,msg10
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    cmp al,'Y'
    je Yes
    cmp al,'y'
    je Yes
    
    cmp al,'N'
    je Exit
    cmp al,'n'
    JE Exit
    
    jmp Invalid
    
    Yes:
    mov ah,9
    lea dx,msg1
    int 21h
    
    lea dx,msg2
    int 21h
    
    lea dx,msg3
    int 21h
    
    lea dx,msg11
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    cmp bl,'1'
    je UpperToLower
    
    cmp bl,'2'
    je LowerToUpper
    
    cmp bl,'3'
    je Exit
    
    
    
    UpperToLower:
    
    mov ah,9
    lea dx,msg4
    int 21h
    
    mov ah,1
    int 21h
    mov ch,al
    
    OR ch,20h
    
    mov ah,9
    lea dx,msg6
    int 21h
    
    mov ah,2
    mov dl,ch
    int 21h
    
    
    
    
    jmp option
    
    
    LowerToUpper:
    
    mov ah,9
    lea dx,msg5
    int 21h
    
    mov ah,1
    int 21h
    mov ch,al
    
    and ch,0DFh
    
    mov ah,9
    lea dx,msg6
    int 21h
    
    mov ah,2
    mov dl,ch
    int 21h
    
    
    jmp option
    
    Invalid:
    mov ah,9
    lea dx,msg7
    int 21h
    
    je option
    
    Exit:
    mov ah,9
    lea dx,msg8
    int 21h
    
    mov ah,1
    int 21h
    mov ch,al
    cmp ch,'y'
    je dismiss
    cmp ch,'Y'
    je dismiss
    
    cmp ch,'n'
    je option
    cmp ch,'N'
    je option
    
    dismiss:
    mov ah,4ch
    int 21h
    
    main endp
end main
    
    
    
    
    















;MOV AH,2
;MOV BL,'p'
;MOV DL,BL
;INT 21H  
;and BL,0DFh
;MOV DL,BL
;INT 21H 