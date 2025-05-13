	.file	"rule2.c"
	.text
	.globl	apply_rule2
	.def	apply_rule2;	.scl	2;	.type	32;	.endef
	.seh_proc	apply_rule2
apply_rule2:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L4:
	movl	-4(%rbp), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %ecx
	movq	__imp_isalpha(%rip), %rax
	call	*%rax
	testl	%eax, %eax
	jne	.L3
	movl	-4(%rbp), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movb	$32, (%rax)
.L3:
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cltq
	movq	16(%rbp), %rdx
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L4
	nop
	nop
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (x86_64-win32-seh-rev0, Built by MinGW-Builds project) 14.2.0"
