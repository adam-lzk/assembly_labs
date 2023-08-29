;	T = not(B or C)		S = notB and notC and D		T = S

%use masm
%include "../stud_io.inc"

global _start

section .text
_start:
	mov ax, [B]
	mov bx, [C]
	or ax, bx
	not ax
	mov dx, ax

	mov ax, [B]
	mov bx, [C]
	mov cx, [D]
	not ax
	not bx
	and ax, bx
	and ax, cx

	xor ax, dx
	not ax

	mov [res], ax

	FINISH


section .data
	A	dw	1111111111111111b
	B	dw	0b
	C	dw	0b
	D	dw	1111111111111111b
	res	dw	0
