;	Find the sum of the first n natural numbers that are divisible by 5

%use masm
%include "../stud_io.inc"

global _start

section .text
_start:
	mov eax, 0
	mov ebx, eax
	mov ecx, 0
BeginLoop:
	cmp eax, [n]
	jnl EndLoop
	inc eax
	add ecx, 5
	add ebx, ecx
	jmp BeginLoop
EndLoop:
	mov [sum], ebx
	mov eax, 1
	int 0x80


section .data
	n	dd	3
	sum	dd	0

;	echo $? to see result
