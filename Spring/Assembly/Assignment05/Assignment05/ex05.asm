; ex05.asm
; Shifting the Elements in an Array

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
array DWORD 10,20,30,40
arrayType DWORD TYPE array
newArray DWORD LENGTHOF array DUP(?)
lastElement DWORD ?

.code
main PROC
  
    ; first element address
    MOV ESI, OFFSET array

    ; address of next element
    MOV EDI, OFFSET newArray
    ADD EDI, TYPE newArray

    ; loop count
    mov ECX, LENGTHOF array

L2:
    MOV EAX, [ESI]
    MOV [EDI], EAX

    ADD ESI, TYPE array
    ADD EDI, TYPE array

    LOOP L2

    MOV EDI,OFFSET newArray
    MOV EAX, [ESI]
    MOV [EDI], EAX

INVOKE ExitProcess,0
main ENDP
END main