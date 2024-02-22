.model small
.data
str db 'UVCE', '$'
len equ $-str-1
.code
mov ax, @data
mov ds, ax
mov si, offset str
mov di, offset str + len - 1
mov cx, len / 2
reverse_loop:
    mov al, [si]
    mov ah, [di]
    mov [si], ah
    mov [di], al
    inc si
    dec di
    loop reverse_loop
mov dx, offset str
mov ah, 09h
int 21h
mov ah, 4ch
int 21h
end
