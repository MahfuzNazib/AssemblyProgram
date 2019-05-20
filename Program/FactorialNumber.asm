
mov al,5
mov bl,4
mov ch,0
mov cl,4
l:
mul bl
dec bl
loop l

mov dh,ah
mov ch,al
mov ah,2
mov dl,dh
int 21h
mov dl,ch
int 21h   