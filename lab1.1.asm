;	y=(a^3 –1)/(b–4)–5

%use masm
%include "../stud_io.inc"

global _start

section .text
_start:
	mov eax, [varA]
	mov ebx, [varA]
	mul ebx
	mul ebx
	sub eax, 1

	mov ebx, [varB]
	sub ebx, 4

	div ebx

	sub eax, 5

	mov [varY], eax

	FINISH


section .data
	varA	dd	5
	varB	dd	6
	varY	dd	0
