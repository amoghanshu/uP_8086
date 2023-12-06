.model small
.data
x db "UVCE"
z dw ($-x)
y db ($-x) dup (?), '$'
.code
mov ax, @data ;[ initialize
mov ds, ax ; data segment]
mov es, ax
lea si, x ; get the address of x in si
add si, z ;[si]+[z]→si
dec si ; decrement si
lea di, y ; get the address of y in di
mov cx, z ; copy contents of z to cx reg
L1: mov al, [si] ; contents of si moved to di reg
mov [di], al
dec si ; decrement si
inc di ; increment di
dec cx ; decrement cx reg
jnz L1 ; if [cx]#0,jump to L1
mov dx, offset y ; get address of y in dx reg
mov ah, 09h ;display y
int 21h
mov ah, 4ch ; [ terminate
int 21h ; exit to DOS]
end
