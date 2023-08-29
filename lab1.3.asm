;	reset bits 7 and 15

%use masm
%include "../stud_io.inc"

global _start

section .text
_start:
	mov ax, [numb]
	mov bx, [numb1]
	and ax, bx

	mov bx, [numb2]
	and ax, bx

	mov [res], ax

	FINISH


section .data
	numb	dw	10010011b
	numb1	dw	1111111101111111b	; to reset bit 7
	numb2	dw	0111111111111111b	; to reset bit 15
	res		dw	0b
