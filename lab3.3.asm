;	Calculate the sum of the products of the columns elements of a given matrix

%use masm
%include "../stud_io.inc"

global _start

section .text
_start:
	mov edi, array	; put the address of array in edi
	mov eax, 4	; TYPE array
	mov ebx, [col]
	mul ebx
	mov ebx, eax
	mov ecx, [col]
BigLoop:

	mov eax, 1
	push ecx
	push edi
	mov ecx, [row]
	SmallLoop:
		push ebx
		mov ebx, [edi]
		mul ebx
		pop ebx
		add edi, ebx
		loop SmallLoop
	pop edi
	pop ecx
	add edi, 4	; TYPE array
	add [res], eax
	loop BigLoop	; 1) dec ecx  2) cmp ecx, 0  3) jg BigLoop

	mov eax, 1
	mov ebx, [res]
	int 0x80


section .data
	array	dd 1,2,3,4
			dd 2,4,1,3
			dd 3,4,4,2
	row	dd	3
	col	dd	4
	res	dd	0
