;program to add two 8bit numbers
data segment
    n1 db 01h
    n2 db 07h
    org 1000h
    n3 dw ?
data ends

code segment
    assume cs:code, ds:data
    
start:
    mov ax, data
    mov ds, ax

    mov al, n1
    mov bl, n2
    add al, bl ;result store in al itself

    mov dl, al
    mov dh, 00h
    adc dh, 00h ;dh = dh + carry_from_addition + 00h
    ;carry is at most of size 1 bit because the every next bit value is the double of previous value, and the result of sum is at most double the max 8bit values
    
    mov n3, dx ;store 16bit result

    mov ah, 4ch
    int 21h
code ends
end start


