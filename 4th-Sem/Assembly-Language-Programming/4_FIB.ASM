data segment
    num db 10
    org 1000h
    fib db 10 dup(?)
data ends

code segment
    assume cs:code, ds:data

start: 
    mov ax, data
    mov ds, ax

    
    lea si, fib
    mov al, 00h
    mov [si], al
    inc si
    inc al
    mov [si], al
    mov cx, 00h
    mov cl, num
    sub cl, 2 ;since first two elements are already initialize

l: 
    mov al, [si-1]
    add al, [si]
    inc si
    mov [si], al
loop l

exit:
    mov ah, 4ch
    int 21h

code ends
end start


