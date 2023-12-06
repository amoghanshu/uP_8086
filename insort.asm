.model small
.data
num dw 4567h, 3456h,9876h, 1234h, 6789h
cnt dw 0005h
.code
mov ax, @data ;[ initialize
mov ds, ax ; data segment]
mov cx, cnt ; cnt value moved to cx reg
dec cx ; decrement cx reg
mov si,02 ; move 02h to si reg
L2: push si ; push si contents to stack
L1: mov ax, num[si-2] ; move num[0] content to ax reg
mov bx, num[si] ; move num[2] content to bx reg
cmp ax, bx ; [ax]-[bx]
jb next ; if not zero,jump to next
mov num[si-2], bx ;copy content of bx to num[0]

; location

mov num[si], ax ;copy content of ax to num[2]

; location

dec si ;decrement si 2 times
dec si
jnz L1 ; if not zero,jump to L1
next: dec cx ;decrement cx reg
jz exit ; if [cx]=0,jump to exit
pop si ;pop contents of si from stack
inc si ; increment si two times
inc si
jmp L2 ; jump to L2
exit: mov ah, 4ch ; [terminate
int 21h ; exit to DOS]
end

