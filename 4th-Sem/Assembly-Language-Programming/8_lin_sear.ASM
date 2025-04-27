;program for linear search

print macro msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm

data segment
    array dw 111h, 222h, 333h, 444h, 555h
    len equ($ - array) ;diff bw last to the first address is the length of array
    key dw 333h
    msg1 db "key found$"
    msg2 db "key not found$"
data ends

code segment
    assume cs:code, ds:data

start:
    mov ax, data
    mov ds, ax

    lea si, array
    mov cx, len
    mov bx, key

next:
    mov ax, [si]
    cmp ax, bx
    je found
    add si, 02h
    dec cx
    jnz next

not_found:
    print msg2
    jmp exit

found:
    print msg1

exit:
    mov ah, 4ch
    int 21h
code ends 
end start


