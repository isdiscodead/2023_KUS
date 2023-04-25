.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD


.data
    bigEndian BYTE 12h, 34h, 56h, 78h
    littleEndian DWORD ?


.code
main PROC
    movzx eax, [bigEndian + 3]
    xchg littleEndian, eax
    movzx eax, [bigEndian + 2]
    xchg [littleEndian + 1], eax
    movzx eax, [bigEndian + 1]
    xchg [littleEndian + 2], eax
    movzx ea

	INVOKE ExitProcess, 0
main ENDP

END main