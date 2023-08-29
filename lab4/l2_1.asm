%use masm
%include "../stud_io.inc"

global _start

section .text
_start:
	l2_1 proc
	push ebp
	mov ebp, esp
	mov ecx, [ebp + 8]  ;?
	mov ebx, 10

BeginBigLoop:
	cmp ecx, 0
	je EndBigLoop

	mov eax, ecx
	mov edx, 0
	div ebx
	mov [check], edx
	mov ecx, eax

	BeginSmallLoop:
		cmp eax, 0
		je EndSmallLoop

		mov edx, 0
		div ebx
		cmp [check], edx
		je Break
		jmp BeginSmallLoop

	EndSmallLoop:
	jmp BeginBigLoop

Break:
	mov ebx, 0
	mov [res], ebx

EndBigLoop:
	mov al, [res]
	pop ebp
	ret
	l2_1 endp

	FINISH


section .data
	check	dd	0
	res		dw	1
