;program to sort elements of array using bubble sort

data segment
    org 1000h
    array db 22h, 55h, 33h, 66h, 11h
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax
    mov cl, 04h ;outer loop counter

outer_loop:
    mov ch, cl ;inner loop counter
    lea si, array

inner_loop:
    mov al, [si]
    mov bl, [si+1]
    cmp al, bl
    jle no_swap
    mov [si], bl
    mov [si+1], al

no_swap:
    inc si

    dec ch
    jnz inner_loop

    dec cl
    jnz outer_loop

    mov ah, 4ch
    int 21h

code ends
end start
