.model small
.stack 100
.data
string db "college"
character db "e"
result db (?)
count equ 07h
.code
mov ax,@data
mov ds,ax
mov cx,count
lea si,string
mov al,character
back:
cmp al,[si]
je strobe1
inc si
dec cx
jnz back
jmp strobe
strobe1:
mov al,01h
mov result,al
jmp last
strobe:
mov al,00h
mov result,al
last:
mov ah,09h
int 21h
mov ah,4ch
int 21h
end

