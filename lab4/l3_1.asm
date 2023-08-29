%use masm
%include "../stud_io.inc"

global _start

section .text
_start:
	l3_1 proc
	push ebp
	mov ebp, esp
	mov edi, [ebp + 12]  ; ?
	mov ecx, [ebp + 8]  ; ?
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
	add eax, [edi]  ; ?
	add [sum], eax

EndPart:
	inc ebx
	add edi, 4
	pop ecx
loop MyLoop
	mov eax, [sum]
	pop ebp
	ret
	l3_1 endp

	FINISH


section .data
	sum	dd	0
