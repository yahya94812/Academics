;program to find ncr

data segment
    n dw 06h
    r dw 04h
    n_fact dw ?
    r_fact dw ?
    n_min_r_fact dw ?
    org 1000h
    ncr dw ?
data ends

code segment
    assume cs:code, ds:data
start:
    mov ax, data
    mov ds, ax

    mov cx, [n]
    call fact ;ax = n!
    mov [n_fact], ax

    mov cx, [r]
    call fact
    mov [r_fact], ax

    mov ax, [n]
    mov bx, [r]
    sub ax, bx ;n-r
    mov cx, ax ;
    call fact ;fact function take I/P from cx and give output at ax
    mov [n_min_r_fact], ax

    mov ax, [r_fact]
    mul [n_min_r_fact]
    mov bx, ax
    mov ax, [n_fact]
    div bx

    mov [ncr], ax


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