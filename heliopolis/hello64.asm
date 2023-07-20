; Code from
; https://p403n1x87.github.io/getting-started-with-x86-64-assembly-on-linux.html

global _start

;
; CONSTANTS
;
SYS_WRITE	equ	1
SYS_EXIT	equ	60
STDOUT		equ	1

;
; Initialized data goes here
;
section		.data
hello		db		"Hello World!", 10	; char *	// 10 is the newline
hello_len	equ		$ - hello		; size_t	// $ is the current address

;
; Code goes here
;
section		.text

_start:
	; syscall(SYS_WRITE, STDOUT, hello, hello_len);
	; The order of the argument registers is: rdi, rsi, rdx, r10 (rcx for C functions), r8, r9.
	mov	rax, SYS_WRITE
	mov	rdi, STDOUT
	mov	rsi, hello
	mov	rdx, hello_len
	syscall
	push	rax			; the syscall returns the number of printed bytes

	; syscall(SYS_EXIT, <sys_write return value - hello_len);
	mov	rax, SYS_EXIT
	pop	rdi
	sub	rdi, hello_len
	syscall
