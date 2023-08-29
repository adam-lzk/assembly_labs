;	Rook and bishop on the chessboard. Who beats whom?

%use masm
%include "../stud_io.inc"

global _start

section .text
_start:
	mov al, [xRook]
	mov bl, [yRook]
	mov cl, [xBishop]
	mov dl, [yBishop]
	cmp al, cl
	sete al	; == mov al, 1 if true
	cmp bl, dl
	sete bl
	or al, bl
	cmp al, 1
	je RookWin

	mov al, [xRook]
	mov bl, [yRook]
	sub al, cl
	sub bl, dl
	cmp al, 0
	jge Step1
	neg al

Step1:
	cmp bl, 0
	jge Step2
	neg bl

Step2:
	cmp al, bl
	je BishopWin
	mov ax, 1
	mov [isDraw], ax
	PRINT "Draw"
	PUTCHAR 10
	jmp EndProg

BishopWin:
	mov ax, 1
	mov [isBishopWin], ax
	PRINT "The bishop won"
	PUTCHAR 10
	jmp EndProg

RookWin:
	mov ax, 1
	mov [isRookWin], ax
	PRINT "The rook won"
	PUTCHAR 10

EndProg:
	FINISH


section .data
	xRook		db	1
	yRook		db	7
	xBishop		db	2
	yBishop		db	5
	isRookWin	db	0
	isBishopWin	db	0
	isDraw		db	0

; to print data:
; p (char)isRookWin
; p (char)isBishopWin
; p (char)isDraw
