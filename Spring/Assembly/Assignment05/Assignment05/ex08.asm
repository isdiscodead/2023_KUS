; ex08.asm
; [PROC] Reverse Array

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
decimalArray DWORD 1,2,3,4,5,6,7,8

.code
main PROC
	MOV ESI, OFFSET decimalArray
	MOV EDI, OFFSET decimalArray
	ADD EDI, SIZEOF decimalArray
	SUB EDI, TYPE decimalArray 
	
	mov ecx, LENGTHOF decimalArray

	call RevArr

	INVOKE ExitProcess,0
main ENDP

RevArr PROC
	L2:
	MOV EAX, [ESI]
	MOV EBX, [EDI]
	XCHG EAX, EBX
	MOV [ESI], EAX
	MOV [EDI], EBX
	
	ADD ESI, TYPE decimalArray
	SUB EDI, TYPE decimalArray
	DEC ECX
	
	LOOP L2
	ret
RevArr ENDP

END main