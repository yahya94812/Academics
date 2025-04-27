;program for creating and deleting files

print macro msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm

data segment
    file1 db "exam1.txt", 0
    file2 db "exam2.txt", 0
    sc db "file created successfully$"
    sd db "file deleted successfully$"
    ec db "error occur in file creation$"
    ed db "error occur in file deletion$"
data ends

code segment
    assume cs:code, ds:data

start :
    mov ax, data
    mov ds, ax

    lea dx, file1
    mov cx, 0000h
    clc

    mov ah, 3Ch ;dos function to create new file
    int 21h
    jc error1 ;if error carry flag is set
    print sc
    jmp next

error1:
    print ec

next:
    mov cx, 0000h
    clc
    lea dx, file2
    mov ah, 3Ch
    int 21h
    mov ah, 41h ;dos function to delete file
    int 21h
    jc error2 ;if error carry flag is set
    print sd
    jmp exit

error2:
    print ed

exit:
    mov ah, 4ch
    int 21h
code ends
end start