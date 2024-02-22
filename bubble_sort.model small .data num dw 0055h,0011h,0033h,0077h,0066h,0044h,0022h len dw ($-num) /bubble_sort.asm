.model small
.data
num dw 0055h,0011h,0033h,0077h,0066h,0044h,0022h
len dw ($-num) / 2 ; length of the array
.code
mov ax, @data
mov ds, ax
mov cx, len ; load the length of the array into CX
dec cx ; decrement CX because the last element has no next element
outer_loop:
    mov si, 0 ; reset SI to the start of the array
    mov bx, cx ; BX will be our counter for the inner loop
    inner_loop:
        mov ax, num[si] ; load the current element into AX
        cmp ax, num[si+2] ; compare with the next element
        jbe skip ; if current <= next, skip the swap
        ; else, swap the elements
        xchg ax, num[si+2]
        mov num[si], ax
        skip:
        add si, 2 ; move to the next element
        dec bx ; decrement the counter
        jnz inner_loop ; repeat the inner loop if BX is not zero
    loop outer_loop ; repeat the outer loop
mov ah, 4ch ; terminate the program
int 21h
end
