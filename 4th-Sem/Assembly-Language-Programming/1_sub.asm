;program to subtract two 16bit numbers
data segment
    n1 dw 08h
    n2 dw 07h
    org 1000h
    n3 dw ?
data ends

code segment
    assume cs:code, ds:data
    
start: mov ax, data
       mov ds, ax

       mov ax, n1
       mov bx, n2
       sub ax, bx ;ax = ax - bx

       mov n3, ax ;store 16bit result

       mov ah, 4ch
       int 21h
code ends
end start


