; Mov2.asm
; Chapter 4 example

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
    ; eax는 32bit ( 8byte )
    ; ax는 16bit ( 4byte ), al과 ah는 8bit( 2byte )
	oneByte BYTE 78h
	oneWord WORD 1234h
	oneDword DWORD 12345678h

.code
main PROC
	mov eax, 0          ; 00 00 00 00
	mov al, oneByte     ; 00 00 00 78
	mov ax, oneWord     ; 00 00 12 34
	mov eax, oneDword   ; 12 34 56 78
	mov ax, 0           ; 12 34 00 00

	INVOKE ExitProcess, 0
main ENDP

END main