;program to calculate factorial using recursion

data segment 
    num dw 04h
    org 1000h
    factorial dw ?
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax

    mov cx, num

    call fact

    mov [factorial] , ax

exit:
    mov ah, 4ch
    int 21h

fact proc near
    cmp cx, 01h
    jz base_case
    push cx
    dec cx
    call fact
    pop cx
    mul cx
    ret

base_case:
    mov ax, 01h
    ret
fact endp

code ends
end start
 
