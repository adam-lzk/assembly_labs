;	Is it true that all the digits of the number n are different

%use masm
%include "../stud_io.inc"

global _start

section .text
_start:
	mov ecx, [n]
	mov ebx, 10

BeginBigLoop:
	cmp ecx, 0
	je EndBigLoop

	mov eax, ecx
	mov edx, 0
	div ebx
	mov [remainder], edx
	mov ecx, eax

	BeginSmallLoop:
		cmp eax, 0
		je EndSmallLoop

		mov edx, 0
		div ebx
		cmp [remainder], edx
		je Break
		jmp BeginSmallLoop

	EndSmallLoop:
		jmp BeginBigLoop

Break:
	mov eax, 0
	mov [isDifferent], eax

EndBigLoop:
	mov ebx, [isDifferent]
	mov eax, 1
	int 0x80


section .data
	n			dd	121
	remainder	dd	0
	isDifferent	dd	1
