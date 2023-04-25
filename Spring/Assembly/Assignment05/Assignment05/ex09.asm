; ex09.asm
; [PROC] Reverse String

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
source BYTE "This is the source string",0
target BYTE SIZEOF source DUP('#')

.code
main PROC
	mov esi,0
	mov edi,LENGTHOF source - 1
	mov ecx,SIZEOF source
	
	call RevStr
	INVOKE ExitProcess,0
main ENDP

RevStr PROC
	L1:
    mov eax, 0
    mov al,source[esi]
    mov target[edi],al
    inc esi
    dec edi
    loop L1
	ret
RevStr ENDP

END main