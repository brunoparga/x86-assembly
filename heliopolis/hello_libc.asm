; Compiling this file did not work

global _start

%include "../syscalls.inc"

extern printf

;
; Initialised data goes here
;
SECTION .data
hello		db	"Hello World!", 10, 0	; const char *
hello_len	equ $ - hello - 1		; size_t

;
; Code goes here
;
SECTION .text

_start:
	; printf(hello) - hello_len;
	lea	rdi, [hello]
	xor	rax, rax
	call	printf
	sub	rax, hello_len

	; syscall(SYS_EXIT, rax - hello_len)
	push	rax
	mov	rax, SYS_EXIT
	pop	rdi
	syscall
