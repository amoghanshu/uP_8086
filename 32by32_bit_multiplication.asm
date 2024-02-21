.model small
.data
num1_low dw 1234h
num1_high dw 5678h
num2_low dw 9abch
num2_high dw def0h
prod_low dw 0
prod_mid dw 0
prod_high dw 0
.code
mov ax, @data
mov ds, ax

; Multiply num1_low with num2_low
mov ax, num1_low
mul num2_low
mov prod_low, ax
mov prod_mid, dx

; Multiply num1_high with num2_low
mov ax, num1_high
mul num2_low
add prod_mid, ax
adc prod_high, dx

; Multiply num1_low with num2_high
mov ax, num1_low
mul num2_high
add prod_mid, ax
adc prod_high, dx

; Multiply num1_high with num2_high
mov ax, num1_high
mul num2_high
add prod_high, ax

mov ax, 4c00h
int 21h
end
