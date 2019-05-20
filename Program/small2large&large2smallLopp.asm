.model small
.stack 100h
.data
    msg db 0dh,0ah,'Enter Your Starting Number : $'   ;Show to enter staring numner 
    msg1 db 0dh,0ah,'Enter Your Ending Number  : $'   ;Show to enter Ending Numner 
    msg3 db 0dh,0ah,'Number Printing is started ..... $' ;Show this message 
    msg4 db 0dh,0ah,'Both numbers are Equal. $'
    msg5 db 0dh,0ah,'Staring Number is Bigger then the Ending Number. $' ;Small number condition print 
    msg6 db 0dh,0ah,' 1.Small to Large    2.Large To Small   3.Exit Program  $'      ;Show first to chosse option
    msg7 db 0dh,0ah,'----------------    ----------------   --------------- $'
    msg8 db 0dh,0ah,'Invalid Key Press.Please Enter Y or N button .. $'      ;Invalid key press message 
    msg9 db 0dh,0ah,'Please Choose Your Option : $'                          ;Choose message print
    msg10 db 0dh,0ah,'Assembly Program Exit !! $'                            ;exit 
    msg11 db 0dh,0ah,'Staring Number is Smaller then the Ending Number $' 
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    Choose:
    
    mov ah,9
    lea dx,msg6
    int 21h
    
    mov ah,9
    lea dx,msg7
    int 21h
    
    mov ah,9
    lea dx,msg9
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    cmp bh,'1'
    je Small
    
    cmp bh,'2'
    je Big
    
    cmp bh,'3'
    je Exit
    
    jmp Invalid
    
    
    Small:
      mov ah,9
    lea dx,msg
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    
    mov ah,1
    int 21h
    mov bl,al
    
    
   
    option:
    cmp bh,bl
    
    jl L
    je nl
    jg nll
    
    L:
        mov ah,9
        lea dx,msg3
        int 21h
        
        mov dl,0dh
        mov ah,2
        int 21h
        mov dl,0ah
        int 21h
        
        
        mov ah,2
        mov dl,bh
        int 21h
        
        jmp n
        
        n:
            inc bh
                
            mov dl,0dh
            mov ah,2
            int 21h
            mov dl,0ah
            int 21h 
            
            mov ah,2
            mov dl,bh
            int 21h
            
            cmp bh,bl
            
            jl n
            je Choose
            
        ;jmp Exit
    
    nl:
        mov ah,9
        lea dx,msg4
        int 21h
        
        jmp Choose
    nll:
        mov ah,9
        lea dx,msg5
        int 21h
     
     
    
    jmp Choose
        
    
    Big:
        mov ah,9
    lea dx,msg
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    
    mov ah,1
    int 21h
    mov bl,al
    
    
   
    ;optionb:
    cmp bh,bl
    
    jg Lb
    je nlb
    jl nllb
    
    Lb:
        mov ah,9
        lea dx,msg3
        int 21h
        
        mov dl,0dh
        mov ah,2
        int 21h
        mov dl,0ah
        int 21h
        
        
        mov ah,2
        mov dl,bh
        int 21h
        
        jmp nb
        
        nb:
            dec bh
                
            ;mov dl,0dh
;            mov ah,2
;            int 21h
;            mov dl,0ah
;            int 21h
            
            mov ah,2
            mov dl,' '
            int 21h
            mov dl,'-'
            int 21h
            mov dl,'>'
            int 21h
            mov dl,' '
            int 21h 
            
            mov ah,2
            mov dl,bh
            int 21h
            
            cmp bh,bl
            
            jg nb
            je Choose
            
        
    
    nlb:
        mov ah,9
        lea dx,msg4
        int 21h
        
        jmp Choose
    nllb:
        mov ah,9
        lea dx,msg11
        int 21h
     
     
    
    jmp Choose
    
    
       
        
    Invalid:
    
    mov ah,9
    lea dx,msg8
    int 21h
    
   
         
    Exit:
    
        mov ah,9
        lea dx,msg10
        int 21h
        
        
        mov ah,4ch
        int 21h
        
    main endp
end main
    
    
   
    