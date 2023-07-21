; Compiling this file did not work

global	main
extern	printf

;
; Initialized data goes here
;
SECTION	 .data
hello		db		"Hello World!", 10	; char *	// 10 is the newline
hello_len	equ		$ - hello		; size_t	// $ is the current address

;
; Code goes here
;
SECTION	 .text

; int main ()
main:
	; return printf(hello) - hello_len;
	lea	rdi, [hello]		; load effective address; computes the effective address of
					; the second operand and stores it in the first operand.
	xor	rax, rax		; rax needs to be the number of parameters passed to printf
					; (in this case, 0 – why not 1?)
	call	printf			; does this also call functions written in assembly?
	sub	rax, hello_len		; return 0 iff call was successful
