;	Sort the array by insertion method

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
	dec ecx
	mov ebx, 0

BigLoop:
	add edi, 4	; TYPE array
	push ecx
	mov esi, edi
	inc ebx
	push ebx

	SmallLoop:
		mov edx, [esi]
		sub esi, 4	; TYPE array
		cmp [esi], edx
		jng EndSmallLoop
		xchg [esi], edx
		mov [esi+4], edx
		dec ebx
		cmp ebx, 0
		jg SmallLoop

	EndSmallLoop:
	pop ebx
	pop ecx

	loop BigLoop

	mov eax, [array]
	mov eax, [array+4]
	mov eax, [array+8]
	mov eax, [array+12]
	mov eax, [array+16]
;	mov eax, [array+20]
;	mov eax, [array+24]
;	mov eax, [array+28]
;	mov eax, [array+32]

	FINISH


section .data
	array			dd	2, 1, 5, 4, 3
	lenghtOfArray	dd	0
