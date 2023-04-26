; ex02.asm - Simple String Encryption

INCLUDE irvine32.inc

KEY = 239
BUFMAX = 128

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD


.data
sPrompt BYTE "Enter the plain text: ", 0
sEncrypt BYTE "Cipher text: ", 0
sDecrypt BYTE "Decrypted: ", 0

buffer BYTE BUFMAX+1 DUP(0)
bufSize DWORD ?


.code 
main PROC
	call InputTheString			; input the plain text

	call TranslateBuffer		; encrypt the buffer
	
	mov edx, OFFSET sEncrypt	; display encrypted message
	call DisplayMessage

	call TranslateBuffer		; decrypt the buffer
	
	mov edx, OFFSET sEncrypt	; display decrypted message
	call DisplayMessage

	exit
main ENDP


;-----------------------------------------------------------------------------------------------
InputTheString PROC
;
; Prompts user for a plain text string.
; Saves the string and its length
; Recieves: nothing
; Returns: nothing
;-----------------------------------------------------------------------------------------------

	pushad						; save 32-bit registers

	mov edx, OFFSET sPrompt		; display a prompt
	call WriteString

	mov ecx, BUFMAX				; maximum character count
	mov edx, OFFSET buffer		; point to the buffer
	call ReadString				; input the string

	mov bufSize, eax			; save the length

	call Crlf					; 한 줄 띄우기
	popad						; restore register
	ret

InputTheString ENDP


;-----------------------------------------------------------------------------------------------
DisplayMessage PROC
;
; Displays the encrypted or decrypted message.
; Recieves: EDX points to the message
; Returns: nothing
;-----------------------------------------------------------------------------------------------

	pushad						; save 32-bit registers

	call WriteString

	mov edx, OFFSET buffer		; point to the buffer
	call WriteString			; display the buffer

	call Crlf	
	call Crlf	
	
	popad						; restore register
	ret

DisplayMessage ENDP


;-----------------------------------------------------------------------------------------------
TranslateBuffer PROC
;
; Translates the string by exclusive-ORing each byte with the encryption key byte
; Recieves: nothing
; Returns: nothing
;-----------------------------------------------------------------------------------------------

	pushad						; save 32-bit registers

	mov ecx, bufSize			; loop counter
	mov esi, 0					; idx

L1:
	xor buffer[esi], KEY		; translate a byte
	inc esi						; point to next idx
	loop L1

	popad
	
	ret
TranslateBuffer ENDP

END main