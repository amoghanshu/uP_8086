.model small
.data
a      db 23h,45h,55h,22h,64h
size1  dw ($-a)        ; Calculate the size of the array 'a'
.code
mov ax, @data          ; Initialize data segment
mov ds, ax             ; Set DS to data segment
mov bx, size1          ; Initialize the loop counter (size of array - 1)

outloop:
    mov cx, bx          ; Set inner loop counter to current outer loop counter
    mov si, 00h         ; Set array index to 0

inloop:
    mov al, a[si]       ; Load current element
    inc si              ; Move to the next element
    cmp al, a[si]       ; Compare current element with the next one
    jnb next             ; Jump if below (swap needed)

    xchg al, a[si]      ; Swap elements
    mov a[si-1], al

next:
    loop inloop         ; Repeat inner loop

    dec bx              ; Decrement outer loop counter
    jnz outloop         ; Repeat outer loop if not finished

mov ah, 4ch             ; DOS function: Exit program
int 21h                 ; Invoke DOS interrupt

end
