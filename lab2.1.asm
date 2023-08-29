;	sort to x1 < x2 > x3 < x4

%use masm
%include "../stud_io.inc"

global _start

section .text
_start:
	mov edx, [x4]
	mov ecx, [x3]
	CMP edx, ecx
	JG NextPart
		mov [x4], ecx
		mov [x3], edx

NextPart:
	mov ecx, [x3]
	mov ebx, [x2]
	CMP ebx, ecx
	JG LastPart
		mov [x3], ebx
		mov [x2], ecx

LastPart:
	mov ebx, [x2]
	mov eax, [x1]
	CMP ebx, eax
	JG ProgEnd
		mov [x1], ebx
		mov [x2], eax

ProgEnd:
	FINISH


section .data
	x1	dd	7
	x2	dd	6
	x3	dd	8
	x4	dd	3
