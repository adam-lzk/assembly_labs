global  _start

section .text
_start:
        mov     eax, 5
        mov     ebx, 6
        add     ebx, eax

        mov     eax, 1
        int 0x80
