;program to count 0s and 1s

data segment
    num db 03h
    org 1000h
    ones db 00h
    zeros db 00h
data ends

code segment
    assume cs:code, ds:data

start:
    mov ax, data
    mov ds, ax

    mov ch, 00h
    mov cl, 08h
    mov al, num
    clc ;clear carry flag

l:
    rcl al, 01h ;rcl stands for rotate carry left
    jnc add_zero
    inc ones
    jmp continue

add_zero:
    inc zeros

continue:
    loop l

    mov ah, 4ch
    int 21h
code ends
end start