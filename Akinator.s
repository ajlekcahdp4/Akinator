	.file	"Akinator.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	StdioInputStr
	.type	StdioInputStr, @function
StdioInputStr:
.LFB29:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	mov	edi, 8
	mov	esi, 1
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 8
	.cfi_def_cfa_offset 64
	call	calloc@PLT
	mov	rdi, QWORD PTR stdin[rip]
	mov	rbp, rax
	call	getc@PLT
	cmp	al, 10
	jne	.L13
	.p2align 4,,10
	.p2align 3
.L3:
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	mov	ebx, eax
	cmp	al, 10
	je	.L3
.L2:
	call	__ctype_b_loc@PLT
	xor	r14d, r14d
	mov	r12d, 8
	mov	r13, rax
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L5:
	mov	BYTE PTR 0[rbp+r14], bl
	mov	rdi, QWORD PTR stdin[rip]
	add	r14, 1
	call	getc@PLT
	mov	ebx, eax
.L4:
	mov	rdx, QWORD PTR 0[r13]
	movsx	rax, bl
	movzx	eax, WORD PTR [rdx+rax*2]
	test	ah, 12
	jne	.L6
	test	ah, 32
	je	.L1
	cmp	bl, 10
	je	.L1
.L6:
	cmp	r12, r14
	jne	.L5
	lea	r15, [r12+r12]
	mov	rdi, rbp
	lea	rsi, 1[r15]
	call	realloc@PLT
	mov	rbp, rax
	cmp	r12, r15
	jnb	.L8
	mov	rdx, r15
	lea	rdi, [rax+r12]
	xor	esi, esi
	sub	rdx, r12
	mov	r12, r15
	call	memset@PLT
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L1:
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	mov	rax, rbp
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.L8:
	.cfi_restore_state
	mov	r12, r15
	jmp	.L5
.L13:
	mov	ebx, eax
	jmp	.L2
	.cfi_endproc
.LFE29:
	.size	StdioInputStr, .-StdioInputStr
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Oh, no! Seems like I don't know who is it!"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Who was it?\nA: "
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"How does %s differ from %s?\n A: "
	.text
	.p2align 4
	.globl	InsertNewNode
	.type	InsertNewNode, @function
InsertNewNode:
.LFB25:
	.cfi_startproc
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	mov	esi, 32
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	mov	r12, rdi
	mov	edi, 1
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 8
	.cfi_def_cfa_offset 48
	call	calloc@PLT
	mov	esi, 32
	mov	edi, 1
	mov	rbp, rax
	call	calloc@PLT
	lea	rdi, .LC0[rip]
	mov	DWORD PTR 0[rbp], 1
	mov	DWORD PTR [rax], 1
	mov	rbx, rax
	mov	rax, QWORD PTR 8[r12]
	mov	QWORD PTR 8[rbx], rax
	call	puts@PLT
	lea	rdi, .LC1[rip]
	xor	eax, eax
	call	printf@PLT
	call	StdioInputStr
	mov	rdx, QWORD PTR 8[r12]
	lea	rdi, .LC2[rip]
	mov	rsi, rax
	mov	QWORD PTR 8[rbp], rax
	xor	eax, eax
	call	printf@PLT
	call	StdioInputStr
	mov	rdi, rax
	mov	r13, rax
	call	strlen@PLT
	mov	edx, 63
	mov	WORD PTR 0[r13+rax], dx
	mov	rax, r12
	mov	QWORD PTR 8[r12], r13
	mov	QWORD PTR 16[r12], rbp
	mov	QWORD PTR 24[r12], rbx
	add	rsp, 8
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	InsertNewNode, .-InsertNewNode
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Incorrect input. Please, answer \"y\" (yes) or \"n\" (no)"
	.section	.rodata.str1.1
.LC4:
	.string	"A: "
	.text
	.p2align 4
	.globl	InputAnswer
	.type	InputAnswer, @function
InputAnswer:
.LFB28:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	lea	r12, .LC3[rip]
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	lea	rbx, .LC4[rip]
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L25:
	mov	edx, eax
	sub	edx, 110
	jne	.L20
	movzx	edx, BYTE PTR 1[rbp]
.L20:
	mov	ecx, eax
	sub	ecx, 113
	jne	.L21
	movzx	ecx, BYTE PTR 1[rbp]
.L21:
	test	edx, edx
	je	.L22
	test	ecx, ecx
	je	.L23
	mov	rdi, r12
	call	puts@PLT
	mov	rdi, rbp
	call	free@PLT
.L19:
	mov	rdi, rbx
	xor	eax, eax
	call	printf@PLT
	call	StdioInputStr
	mov	rbp, rax
	movzx	eax, BYTE PTR [rax]
	cmp	eax, 121
	jne	.L25
	cmp	BYTE PTR 1[rbp], 0
	jne	.L25
.L22:
	cmp	eax, 113
	je	.L35
.L18:
	mov	rax, rbp
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L35:
	.cfi_restore_state
	cmp	BYTE PTR 1[rbp], 0
	jne	.L18
	.p2align 4,,10
	.p2align 3
.L23:
	mov	rdi, rbp
	xor	ebp, ebp
	call	free@PLT
	jmp	.L18
	.cfi_endproc
.LFE28:
	.size	InputAnswer, .-InputAnswer
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Hi there! My name is Akinator!\nLet's play the game\n"
	.align 8
.LC6:
	.string	"\033[01;38;05;196mI\033[01;38;05;214mm\033[01;38;05;226ma\033[01;38;05;46mg\033[01;38;05;51mi\033[01;38;05;21mn\033[01;38;05;201me\033[0m someone or something and I'll try to guess\n"
	.align 8
.LC7:
	.string	"I will ask you a questions and you must give me an answers like \"y\" (Yes) or \"n\" (No)"
	.section	.rodata.str1.1
.LC8:
	.string	"Want to start?"
.LC9:
	.string	"Let's go!\n"
	.text
	.p2align 4
	.globl	Greeting
	.type	Greeting, @function
Greeting:
.LFB26:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	lea	rdi, .LC5[rip]
	call	puts@PLT
	lea	rdi, .LC6[rip]
	call	puts@PLT
	lea	rdi, .LC7[rip]
	call	puts@PLT
	lea	rdi, .LC8[rip]
	call	puts@PLT
	call	InputAnswer
	mov	r12, rax
	test	rax, rax
	je	.L36
	cmp	BYTE PTR [rax], 121
	jne	.L36
	cmp	BYTE PTR 1[rax], 0
	jne	.L36
	lea	rdi, .LC9[rip]
	call	puts@PLT
.L36:
	mov	rax, r12
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE26:
	.size	Greeting, .-Greeting
	.section	.rodata.str1.1
.LC10:
	.string	"Q: %s\n"
.LC11:
	.string	"I guess, it's %s am I right?\n"
.LC12:
	.string	"\nCool!"
	.text
	.p2align 4
	.globl	AskQuestion
	.type	AskQuestion, @function
AskQuestion:
.LFB27:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xor	eax, eax
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	mov	rbp, rdi
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	mov	rsi, QWORD PTR 8[rdi]
	lea	rdi, .LC10[rip]
	call	printf@PLT
	call	InputAnswer
	test	rax, rax
	je	.L56
	cmp	BYTE PTR [rax], 121
	mov	rdi, rax
	jne	.L46
	cmp	BYTE PTR 1[rax], 0
	jne	.L46
	call	free@PLT
	mov	rbp, QWORD PTR 16[rbp]
	cmp	QWORD PTR 16[rbp], 0
	jne	.L58
.L52:
	mov	rsi, QWORD PTR 8[rbp]
	lea	rdi, .LC11[rip]
	xor	eax, eax
	call	printf@PLT
	call	InputAnswer
	cmp	BYTE PTR [rax], 121
	mov	r12, rax
	jne	.L54
	cmp	BYTE PTR 1[rax], 0
	jne	.L54
	lea	rdi, .LC12[rip]
	call	puts@PLT
.L55:
	mov	rdi, r12
	call	free@PLT
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	mov	eax, 1
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L46:
	.cfi_restore_state
	cmp	QWORD PTR 24[rbp], 0
	je	.L51
	call	free@PLT
	mov	rbp, QWORD PTR 24[rbp]
	cmp	QWORD PTR 24[rbp], 0
	je	.L52
.L58:
	mov	rdi, rbp
	call	AskQuestion
	test	eax, eax
	setne	al
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movzx	eax, al
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L51:
	.cfi_restore_state
	call	free@PLT
	mov	rdi, rbp
	call	InsertNewNode
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	mov	eax, 1
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L56:
	.cfi_restore_state
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xor	eax, eax
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L54:
	.cfi_restore_state
	mov	rdi, rbp
	call	InsertNewNode
	jmp	.L55
	.cfi_endproc
.LFE27:
	.size	AskQuestion, .-AskQuestion
	.p2align 4
	.globl	ClearBuffer
	.type	ClearBuffer, @function
ClearBuffer:
.LFB30:
	.cfi_startproc
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	.p2align 4,,10
	.p2align 3
.L63:
	mov	rdi, QWORD PTR stdin[rip]
	call	getc@PLT
	cmp	eax, 10
	jne	.L63
	add	rsp, 8
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE30:
	.size	ClearBuffer, .-ClearBuffer
	.section	.rodata.str1.1
.LC13:
	.string	"Akinator/Akinator.c"
.LC14:
	.string	"f"
.LC15:
	.string	"%s{ %s\n"
.LC16:
	.string	"%s}\n"
.LC17:
	.string	"%s{ %s}\n"
	.text
	.p2align 4
	.globl	PrintNode
	.type	PrintNode, @function
PrintNode:
.LFB32:
	.cfi_startproc
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 8
	.cfi_def_cfa_offset 48
	test	rdi, rdi
	je	.L71
	mov	rbx, rsi
	mov	rbp, rdi
	mov	esi, 1
	mov	edi, 256
	mov	r12, rdx
	call	calloc@PLT
	mov	rsi, r12
	mov	rdi, rax
	mov	r13, rax
	call	stpcpy@PLT
	mov	edx, 9
	cmp	QWORD PTR 16[rbx], 0
	mov	rcx, QWORD PTR 8[rbx]
	mov	WORD PTR [rax], dx
	mov	rdx, r12
	je	.L68
	lea	rsi, .LC15[rip]
	mov	rdi, rbp
	xor	eax, eax
	call	fprintf@PLT
	mov	rsi, QWORD PTR 16[rbx]
	mov	rdx, r13
	mov	rdi, rbp
	call	PrintNode
	mov	rsi, QWORD PTR 24[rbx]
	mov	rdx, r13
	mov	rdi, rbp
	call	PrintNode
	mov	rdx, r12
	mov	rdi, rbp
	xor	eax, eax
	lea	rsi, .LC16[rip]
	call	fprintf@PLT
.L69:
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	mov	rdi, r13
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L68:
	.cfi_restore_state
	lea	rsi, .LC17[rip]
	mov	rdi, rbp
	xor	eax, eax
	call	fprintf@PLT
	jmp	.L69
.L71:
	lea	rcx, __PRETTY_FUNCTION__.0[rip]
	mov	edx, 227
	lea	rsi, .LC13[rip]
	lea	rdi, .LC14[rip]
	call	__assert_fail@PLT
	.cfi_endproc
.LFE32:
	.size	PrintNode, .-PrintNode
	.section	.rodata.str1.1
.LC18:
	.string	"w"
.LC19:
	.string	"logs/tree.dat"
.LC20:
	.string	""
	.text
	.p2align 4
	.globl	SaveTree
	.type	SaveTree, @function
SaveTree:
.LFB31:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	lea	rsi, .LC18[rip]
	mov	r12, rdi
	lea	rdi, .LC19[rip]
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	call	fopen@PLT
	test	rax, rax
	je	.L75
	mov	rsi, r12
	mov	rdi, rax
	lea	rdx, .LC20[rip]
	mov	rbp, rax
	call	PrintNode
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	mov	rdi, rbp
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	jmp	fclose@PLT
.L75:
	.cfi_restore_state
	lea	rcx, __PRETTY_FUNCTION__.1[rip]
	mov	edx, 220
	lea	rsi, .LC13[rip]
	lea	rdi, .LC14[rip]
	call	__assert_fail@PLT
	.cfi_endproc
.LFE31:
	.size	SaveTree, .-SaveTree
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"\nDo you want to play one more time?"
	.section	.rodata.str1.1
.LC22:
	.string	"Okey, see you later"
	.text
	.p2align 4
	.globl	RunAkinator
	.type	RunAkinator, @function
RunAkinator:
.LFB24:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	lea	r15, .LC20[rip]
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	lea	r14, .LC21[rip]
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	lea	r13, .LC18[rip]
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	lea	r12, .LC19[rip]
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	mov	rbx, rdi
	sub	rsp, 8
	.cfi_def_cfa_offset 64
	call	Greeting
	mov	rbp, rax
	test	rax, rax
	je	.L78
	.p2align 4,,10
	.p2align 3
.L77:
	cmp	BYTE PTR 0[rbp], 121
	je	.L93
.L81:
	lea	rdi, .LC22[rip]
	call	puts@PLT
	mov	rdi, rbp
	call	free@PLT
.L78:
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L93:
	.cfi_restore_state
	cmp	BYTE PTR 1[rbp], 0
	jne	.L81
	mov	rdi, rbp
	call	free@PLT
	mov	rdi, rbx
	call	AskQuestion
	test	eax, eax
	je	.L78
	mov	rsi, r13
	mov	rdi, r12
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	je	.L94
	mov	rdx, r15
	mov	rsi, rbx
	mov	rdi, rax
	call	PrintNode
	mov	rdi, rbp
	call	fclose@PLT
	mov	rdi, r14
	call	puts@PLT
	call	InputAnswer
	mov	rbp, rax
	test	rax, rax
	jne	.L77
	jmp	.L81
.L94:
	lea	rcx, __PRETTY_FUNCTION__.1[rip]
	mov	edx, 220
	lea	rsi, .LC13[rip]
	lea	rdi, .LC14[rip]
	call	__assert_fail@PLT
	.cfi_endproc
.LFE24:
	.size	RunAkinator, .-RunAkinator
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 10
__PRETTY_FUNCTION__.0:
	.string	"PrintNode"
	.align 8
	.type	__PRETTY_FUNCTION__.1, @object
	.size	__PRETTY_FUNCTION__.1, 9
__PRETTY_FUNCTION__.1:
	.string	"SaveTree"
	.ident	"GCC: (GNU) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
