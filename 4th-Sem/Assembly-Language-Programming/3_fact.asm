;factorial of a number
data segment
    org 1000h
    num dw 04h
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax

    mov ax, num
    mov cx, num
    dec cx  

fact_loop:
    mul cx
    dec cx
    jnz fact_loop

    mov num, ax
    
exit:
    mov ah, 4ch
    int 21h

code ends
end start