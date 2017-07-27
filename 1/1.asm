; Skompiluj przykładowe przykłady, zmodyfikuj je w ten sposób aby pytały o imię, wczytywały je z klawiatury a następnie wypisywały spersonalizowane przywitanie.

section .text

global _start
_start:

    ; write hello
    mov rax, 1
    mov rdi, 1
    mov rsi, ask
    mov rdx, asklen
    syscall
    
    ; read
    mov rax, 0
    mov rdi, 0
    mov rsi, message
    mov rdx, messagelen
    syscall

    ; write hello
    mov rax, 1
    mov rdi, 1
    mov rsi, hi
    mov rdx, hilen
    syscall
    
    ; write name
    mov rax, 1 ; system call 1 is write
    mov rdi, 1 ; file handle 1 is stdout
    mov rsi, message ; address of string to output
    mov rdx, messagelen ; number of bytes
    syscall ; invoke operating system to do the write

    ; exit(0)
    mov rax, 60 ; system call 60 is exit
    xor rdi, rdi ; exit code 0
    syscall ; invoke operating system to exit

section .bss
    message: 
    resb 100 
    messagelen equ $-message

section .data 
    hi db "Hello, "
    hilen equ $-hi
    
    ask db "What is your name?", 10 ;10 - new line
    asklen equ $-ask
