xor bx,bx

input:
mov ah,1
int 21h

cmp al,0dh
je e

while:
and al,0Fh
shl bx,1


or bl,al

jmp input

e:
mov ch,0
mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

output:
cmp ch,16
je finish
inc ch

mov bh,dl
ror dl,4

shl dl,1
jc one
jmp zero

one:
mov ah,2
mov dl,'1'
int 21h
jmp output
zero:
mov ah,2
mov dl,'0'
int 21h
jmp output

finish:
mov ah,4ch
int 21h

