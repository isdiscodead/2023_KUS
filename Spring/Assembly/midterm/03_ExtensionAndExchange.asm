; Data Transfer Examples (Moves.asm)

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD


.data
	val1 WORD 1000h
	val2 WORD 2000h

	arrayB BYTE 10h, 20h, 30h, 40h, 50h
	arrayW WORD 100h, 200h, 300h
	arrayD DWORD 10000h, 20000h


.code
main PROC
	; zero extension -> 빈 자리를 모두 0으로 
	mov bx, 0A69Bh      ; 00 ?? A6 9B
	movzx eax, bx       ; 00 00 A6 9B
	movzx edx, bl       ; 00 00 00 9B
	movzx cx, bl        ; 00 37 00 9B


	; signed extension -> 빈 자리를 sign 값으로 ( 음수면 1, 양수면 0 )
	mov bx, 0A69Bh      ; 00 ?? A6 9B
	movsx eax, bx       ; EAX = FFFFA69Bh
	movsx edx, bl       ; EDX = FFFFFF9Bh

	mov bl, 7Bh         ; 00 ?? A6 7B
	movsx cx, bl        ; 00 37 00 7B


	; mem-mem exchange
	mov ax, val1        ; ffff 1000
	xchg ax, val2       ; ffff 2000
	mov val1, ax        ; 00 20 / 00 10 ( val1, val 2 )


	; direct offset
	mov al, arrayB                  ; 10
	mov al, [arrayB+1]              ; 20
	mov al, [arrayB+2]              ; 30

	mov ax, arrayW                  ; 100
	mov ax, [arrayW+2]              ; 200

	mov eax, arrayD                 ; 00010000
	mov eax, [arrayD+4]             ; 00020000
	mov eax, [arrayD+TYPE arrayD]   ; 00020000

	INVOKE ExitProcess, 0
main ENDP

END main