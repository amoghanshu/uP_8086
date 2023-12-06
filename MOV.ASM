disp macro msg
lea dx,msg
mov ah,9
int 21h
endm
.model small
.data
s1 db '>CITY ENGINEERING COLLEGE$'
len dw ($-s1)
s2 db ($-s1) dup(?),'$'
m1 db 'The given string is:',10,13,'$'
m2 db 10,13,'the string after transfer is :','$'
.code
mov ax,@data
mov ds,ax
mov es,ax
disp m1
disp s1
lea si,s1
lea di,s2
cld
mov cx,len
rep movsb
disp m2
disp s2
mov ah,4ch
int 21h
end
