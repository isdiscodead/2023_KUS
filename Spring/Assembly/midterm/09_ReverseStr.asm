; ex04.asm
; Copy a String in Reverse Order

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

    L1:
        mov eax, 0
        mov al,source[esi]
        mov target[edi],al
        inc esi
        dec edi
        loop L1

INVOKE ExitProcess,0
main ENDP
END main