.model small
.data
dividend dd 12345678h
divisor dw 1234h
quotient dw ?
remainder dw ?
.code
mov ax, @data
mov ds, ax

; Load the high word of the dividend into dx
mov dx, word ptr [dividend+2]

; Load the low word of the dividend into ax
mov ax, word ptr [dividend]

; Divide dx:ax by the divisor
idiv divisor

; Store the quotient and remainder
mov quotient, ax
mov remainder, dx

mov ax, 4c00h
int 21h
