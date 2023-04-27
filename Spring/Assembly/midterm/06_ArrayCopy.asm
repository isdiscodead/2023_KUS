; Testing the ArrayCopy procedure 
; (TestArrayCopy.asm)

;-------------------------------------------------------------------
; ArrayCopy
;
; Copy values of an array of 32-bit integers.
; Receives: 	ESI = the source array offset
;				EDI = the destination array offset
;	  			ECX = number of elements in the array
; Returns:		EAX = number of the copied array elements
;-------------------------------------------------------------------

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

.data
	array DWORD 10000h, 20000h, 30000h, 40000h, 50000h, 60000h
	cpArr DWORD 6 DUP(?)
	cnt DWORD 0

.code
	ArrayCopy PROC
		push esi			; save ESI, EDI, ECX
		push edi
		push ecx
		mov	eax, 0			; set the cnt to zero

	L1:	
		mov ebx, [esi]			
		xchg ebx, [edi]

		add	esi, TYPE DWORD		; point to next integer
		add	edi, TYPE DWORD		; point to next integer
		inc eax

		loop L1			; repeat for array size
		
		pop	ecx			; restore ECX, EDI, ESI
		pop edi
		pop	esi

		ret				; sum is in EAX
	ArrayCopy ENDP


	main PROC
		mov	esi, OFFSET array	; ESI points to array
		mov edi, OFFSET cpArr
		mov	ecx, LENGTHOF array	; ECX = array count
		call ArrayCopy			; calculate the sum
		mov cnt, eax ; returned value
		INVOKE ExitProcess, 0
	main ENDP
END main