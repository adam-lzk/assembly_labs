;	Find the sum of those array elements whose indexes are divisible by 2 or 3

%use masm
%include "../stud_io.inc"

global _start

section .text
_start:
	mov eax, lenghtOfArray	; put the address of lenght variable in eax
	mov ebx, array	; put the address of array in ebx
	sub eax, ebx	; difference

	mov ebx, 4	; size of dd - 4 bytes
	div ebx	; division. now in ebx - lenght of array

	mov edi, array	; put the address of array in edi
	mov ecx, ebx	; put the lenght of array in ecx
	mov ebx, 0

MyLoop:
	push ecx
	mov eax, ebx
	mov edx, 0
	mov ecx, 2
	div ecx
	cmp edx, 0
	je SumPart
	mov eax, ebx
	mov edx, 0
	mov ecx, 3
	div ecx
	cmp edx, 0
	jne EndPart

SumPart:
	mov eax, 0
	add eax, [edi]	;
	add [sum], eax

EndPart:
	inc ebx
	add edi, 4	;TYPE array
	pop ecx
	loop MyLoop

	mov ebx, [sum]
	mov eax, 1
	int 0x80


section .data
	array			dd	0, 1, 2, 3
	lenghtOfArray	dd	0
	sum				dd	0
