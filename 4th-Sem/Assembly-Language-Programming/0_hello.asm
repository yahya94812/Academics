;program to display helloWorld
.model small ;assembler directive, data and code are in different segment but each segment is maximum of 64KB

data segment
org 1000h
str db "HelloWorld!$" ;"str" is a label(name), dos with ah, 09h; int 21h identify the string termination with $ sign
data ends

code segment
assume cs:code, ds:data ;Tells the assembler that: cs (code segment register) uses code segment. ds (data segment register) uses data segment.
start : mov ax, data ;"start" is a label marking the entry point of the program
        mov ds, ax

        lea dx, str
        mov ah, 09h ;dos function code for displaying string
        int 21h ;it is a dos function interrupt it perform action specified in ah with the parameters in other register (dx in this case) 

        mov ah, 4ch ;dos function code for program termination
        int 21h
code ends
end start