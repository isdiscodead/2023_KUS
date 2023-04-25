; AddSubTest.asm ; Addition and Subtraction
; Chapter 4 example

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	Rval SDWORD ?
	Xval SDWORD 26
	Yval SDWORD 30
	Zval SDWORD 40

.code
main PROC
	mov ax, 1000h
	inc ax
	dec ax

; Expression : Rval = -Xval + ( Yval - Zval )
	mov eax, Xval
	neg eax 		; -26
	mov ebx, Yval
	sub ebx, Zval 	; -10
	add eax, ebx
	mov Rval, eax

; Zero flag example
	mov cx, 1
	sub cx, 1 		; ZF = 1
	mov ax, 0ffffh
	inc cx		 	; ZF = 1

; Sign flag example
	mov cx, 0
	sub cx, 1 		; SF = 1
	mov ax, 07fffh
	inc ax 			; SF = 1

; Carry flag example
	mov al, 0ffh
	add al, 1       ; CF = 1, AL = 0

; Overflow flag example
	mov al, +127
	add al, 1       ; OF = 1
	mov al, -128
	sub al, 1       ; OF = 1

	INVOKE ExitProcess, 0
main ENDP

END main