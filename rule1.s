	.file	"rule1.c"
	.text
	.globl	apply_rule1
	.def	apply_rule1;	.scl	2;	.type	32;	.endef
	.seh_proc	apply_rule1
apply_rule1:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L5:
	movl	-4(%rbp), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L3
	movl	$49, %edx
	jmp	.L4
.L3:
	movl	$48, %edx
.L4:
	movl	-4(%rbp), %eax
	cltq
	movq	16(%rbp), %rcx
	addq	%rcx, %rax
	movb	%dl, (%rax)
	addl	$1, -4(%rbp)
.L2:
	cmpl	$7, -4(%rbp)
	jle	.L5
	movl	$1, -8(%rbp)
	movl	$7, -12(%rbp)
	jmp	.L6
.L10:
	movl	-12(%rbp), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$48, %al
	jne	.L7
	movl	-12(%rbp), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$49, (%rax)
	movl	$0, -8(%rbp)
	jmp	.L8
.L7:
	movl	-12(%rbp), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$48, (%rax)
.L8:
	subl	$1, -12(%rbp)
.L6:
	cmpl	$0, -12(%rbp)
	js	.L11
	cmpl	$0, -8(%rbp)
	jg	.L10
.L11:
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-win32-seh-rev0, Built by MinGW-Builds project) 14.2.0"
