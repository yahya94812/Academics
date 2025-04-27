.model small

code segment
assume cs:code
start:
    mov cx, 26
    mov dx, 65
    ;mov ax, 97 ;for small letters

print_alphabet:
    mov ah, 02h
    int 21h
    inc dx
loop print_alphabet

exit:
    mov ah, 4ch
    int 21h
code ends
end start


