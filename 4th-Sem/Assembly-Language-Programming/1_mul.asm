;program to multiply two 8bit numbers
data segment
    n1 db 08h
    n2 db 07h
    org 1000h
    n3 dw ?
data ends

code segment
    assume cs:code, ds:data
    
start: mov ax, data
       mov ds, ax

       mov al, n1
       mul n2 ;ax = al * n2

       mov n3, ax ;store 16bit result

       mov ah, 4ch
       int 21h
code ends
end start


