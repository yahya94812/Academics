data segment
    array db 00h, 11h, 22h, 33h, 44h, 55h, 66h, 77h, 88h, 99h
    org 1000h
    even_array  db 10 dup(?)
    org 2000h
    odd_array   db 10 dup(?)
data ends

code segment
    assume cs:code, ds:data

start:
    mov ax, data
    mov ds, ax

    mov cl, 0Ah

    lea si, array
    lea di, even_array
    lea bx, odd_array

compare:
    mov ah, 00h
    mov al, [si]
    mov dl, 02h
    div dl
    cmp ah, 00h ; ah = remainder
    je store_even

store_odd:
    mov al, [si]
    mov [bx], al
    inc si
    inc bx
    jmp continue

store_even:
    mov al, [si]
    mov [di], al
    inc di
    inc si

continue:
    dec cl
    jnz compare

exit:
    mov ah, 4ch
    int 21h
code ends
end start
