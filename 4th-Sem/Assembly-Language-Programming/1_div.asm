;program to divide two 8bit numbers
data segment
    n1 db 08h
    n2 db 04h
    org 1000h
    n3 db ?
data ends

code segment
    assume cs:code, ds:data
    
start: mov ax, data
       mov ds, ax

       ;mov ah, 0h
       xor ah, ah
       mov al, n1
       div n2 ;al->quotient, ah->reminder, al = ax // n2, ah = ax % n2

       mov n3, al ;store 16bit result

       mov ah, 4ch
       int 21h
code ends
end start


