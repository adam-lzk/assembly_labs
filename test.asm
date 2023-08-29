global _start

section .text
_start:
    mov ebx, 1  ; exit code
    mov eax, 1  ; 1 = sys_exit
    int 0x80
