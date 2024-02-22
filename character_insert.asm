;program to inser character at the end of the string
.model small
.data
string db "hello"
len equ $-string
char db "z"
.code
mov ax,@data
mov ds,ax
lea si,string
mov bl,len
add si,bl
mov bl,char
mov string[si],bl
mov ah,09h
lea dx,string
int 21h
mov ah,4ch
int 21h
end
