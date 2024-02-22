;program to delete a character at start of string
.model small
.data
str db "gamma",'$'
.code
mov ax, @data
mov ds, ax
mov si, offset str
inc si ; increment si to point to the second character
mov di, si ; copy the pointer to di
dec di ; decrement di to point to the first character
next_char:
    mov al, [si] ; load the current character into AL
    mov [di], al ; move the current character to the previous position
    inc si ; move to the next character
    inc di ; move to the next position
    cmp byte ptr [si], '$' ; check if we reached the end of the string
    jne next_char ; if not, repeat the loop
mov dx, offset str
mov ah, 09h
int 21h
mov ah, 4ch
int 21h
end



  ;alternatively the below program can also be used
    
.model small
.data
str db "beta"
.code
mov ax,@data
mov ds,ax
mov si,offset str ;si points to the first character of the string
mov byte ptr [si],' ' ;replace the first character with a space
lea dx,str
mov ah,9
int 21h
mov ah,4ch
int 21h
end
