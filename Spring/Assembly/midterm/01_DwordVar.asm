; exam02.asm - add four DWORD variables
; Chapter 3 assignment

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	firstval DWORD 1234h
	secondval DWORD 2345h
	thirdval DWORD 3456h
	fourthval DWORD 4567h
	; 메모리 상에서의 배치 -> little endian 
	; 34 12 00 00 / 45 23 00 00 / 56 34 00 00 / 67 45 00 00 
.code
main PROC
	mov eax, 0

	; add 연산은 메모리 + 메모리 연산 불가능
	add eax, firstval
	add eax, secondval
	add eax, thirdval
	add eax, fourthval 	; eax = 000048D0

	INVOKE ExitProcess, 0
main ENDP

END main