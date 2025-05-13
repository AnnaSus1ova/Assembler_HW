	.file	"check_property.c"
	.text
	.globl	check_binary_property
	.def	check_binary_property;	.scl	2;	.type	32;	.endef
	.seh_proc	check_binary_property
check_binary_property:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, %rcx
	call	strlen
	cmpq	$8, %rax
	je	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movl	$0, -4(%rbp)
	jmp	.L4
.L6:
	movl	-4(%rbp), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	je	.L5
	movl	-4(%rbp), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$49, %al
	je	.L5
	movl	$0, %eax
	jmp	.L3
.L5:
	addl	$1, -4(%rbp)
.L4:
	cmpl	$7, -4(%rbp)
	jle	.L6
	movl	$1, %eax
.L3:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-win32-seh-rev0, Built by MinGW-Builds project) 14.2.0"
	.def	strlen;	.scl	2;	.type	32;	.endef
