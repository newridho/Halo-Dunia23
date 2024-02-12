section .data
    hello db 'Hello, World!',0  ; Null-terminated string to print

section .text
    global _start

_start:
    ; Write "Hello, World!" to stdout (file descriptor 1)
    mov eax, 4        ; sys_write syscall number
    mov ebx, 1        ; file descriptor (stdout)
    mov ecx, hello    ; pointer to the string
    mov edx, 13       ; length of the string
    int 0x80          ; call the kernel

    ; Exit the program (sys_exit)
    mov eax, 1        ; sys_exit syscall number
    xor ebx, ebx      ; exit status (0)
    int 0x80          ; call the kernel
