; ex01.asm
; Copying a Word Array to a DoubleWord array

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
array WORD 0,2,5,9,10
newArray DWORD LENGTHOF array DUP(?)
.code
main PROC

  mov ecx, LENGTHOF array
  mov ESI, OFFSET array
  mov EDI, OFFSET newArray

  L1:
	MOV EAX,0
	MOV AX,[ESI]
	MOV [EDI], EAX
	ADD ESI, TYPE array
	ADD EDI, TYPE newArray
  Loop L1

INVOKE ExitProcess,0
main ENDP
END main