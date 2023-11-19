; Name: Caroline Kirkconnell
; Auburn UserID: Cek0037
; Filename: Caroline_Kirkconnell.asm
; Compile: VisualStudio, MASM
; I used StackOverflow to learn about arrays and loops.
; Description: Creates a program that will read a value
; from an array, and then place this value in another
; array with the location shifted by a certain amount.
; The array may be of any length from 2 to 100.
; The program is flexible enough to produce the correct
; solution regardless of the array size.

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data

		; Create a BYTE array with the label 'input.' 'input'
		; should have eight elements. You should place values
		; 1,2,3,4,5,6,7,8 in each of the elements of this array.
		input byte 1,2,3,4,5,6,7,8

		; Create a BYTE array with the label 'output.' This
		; array should be the same length as 'input.'
		output byte LENGTHOF input DUP(?)

		; Create a DWORD variable with the label 'shift.' 'shift'
		; should hold a single value. The value 'shift' must be
		; less than the length of 'input.'
		shift dword ?

.code
		; The program should then read each of the values from the
		; array 'input' and place the values into the 'output' array,
		; but the location should be shifted by the amount in the 
		; 'shift' variable. If the shift would cause a value to be
		; outside of the bounds of 'output,' then the values should
		; "wrap around" to the front of 'output.'

		xor eax, eax		; wipe EAX
		xor ebx, ebx		; wipe EBX
		mov ecx, shift		; mov the shift variable to ECX

		M1:
				neg ecx
				mov al, input[LENGTHOF input + ecx]
				mov output[ebx], al
				neg ecx
				inc ebx
		loop M1

		mov ecx, LENGTHOF input
		sub ecx, shift
		xor edx, edx

		M2:
				mov al, input[edx]
				mov output[ebx], al
				inc ebx
				inc edx
		loop M2

		INVOKE ExitProcess, 0
end MAINP
end main


