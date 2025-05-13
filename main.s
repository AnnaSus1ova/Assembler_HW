	.file	"main.c"
	.text
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	32(%rbp), %rax
	movq	%rbx, %r8
	movq	%rax, %rdx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\202\320\265\320\272\321\201\321\202 (\320\274\320\260\320\272\321\201\320\270\320\274\321\203\320\274 100 \321\201\320\270\320\274\320\262\320\276\320\273\320\276\320\262): \0"
.LC1:
	.ascii "\320\236\321\210\320\270\320\261\320\272\320\260 \320\262\320\262\320\276\320\264\320\260.\12\0"
.LC2:
	.ascii "\12\0"
	.align 8
.LC3:
	.ascii "\12\320\230\321\201\321\205\320\276\320\264\320\275\321\213\320\271 \321\202\320\265\320\272\321\201\321\202: \"%s\"\12\0"
	.align 8
.LC4:
	.ascii "\320\242\320\265\320\272\321\201\321\202 \321\217\320\262\320\273\321\217\320\265\321\202\321\201\321\217 \320\264\320\262\320\276\320\270\321\207\320\275\321\213\320\274 \321\207\320\270\321\201\320\273\320\276\320\274. \320\237\321\200\320\270\320\274\320\265\320\275\321\217\320\265\321\202\321\201\321\217 \320\277\321\200\320\260\320\262\320\270\320\273\320\276 1.\12\0"
	.align 8
.LC5:
	.ascii "\320\242\320\265\320\272\321\201\321\202 \320\275\320\265 \321\217\320\262\320\273\321\217\320\265\321\202\321\201\321\217 \320\264\320\262\320\276\320\270\321\207\320\275\321\213\320\274 \321\207\320\270\321\201\320\273\320\276\320\274. \320\237\321\200\320\270\320\274\320\265\320\275\321\217\320\265\321\202\321\201\321\217 \320\277\321\200\320\260\320\262\320\270\320\273\320\276 2.\12\0"
	.align 8
.LC6:
	.ascii "\320\237\321\200\320\265\320\276\320\261\321\200\320\260\320\267\320\276\320\262\320\260\320\275\320\275\321\213\320\271 \321\202\320\265\320\272\321\201\321\202: \"%s\"\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$144, %rsp
	.seh_stackalloc	144
	.seh_endprologue
	call	__main
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rdx
	leaq	-112(%rbp), %rax
	movq	%rdx, %r8
	movl	$101, %edx
	movq	%rax, %rcx
	call	fgets
	testq	%rax, %rax
	jne	.L4
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, %eax
	jmp	.L8
.L4:
	leaq	-112(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	strcspn
	movb	$0, -112(%rbp,%rax)
	leaq	-112(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	check_binary_property
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L6
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	apply_rule1
	jmp	.L7
.L6:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-112(%rbp), %rax
	movq	%rax, %rcx
	call	apply_rule2
.L7:
	leaq	-112(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
.L8:
	addq	$144, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "\12=== \320\242\320\265\321\201\321\202\320\270\321\200\320\276\320\262\320\260\320\275\320\270\320\265 ===\12\0"
.LC8:
	.ascii "00001111\0"
.LC9:
	.ascii "10101010\0"
.LC10:
	.ascii "aBc123!@\0"
.LC11:
	.ascii "00000000\0"
.LC12:
	.ascii "11111111\0"
.LC13:
	.ascii "abc123\0"
.LC14:
	.ascii "\12\320\242\320\265\321\201\321\202 %d: \"%s\"\12\0"
	.align 8
.LC15:
	.ascii "\320\237\321\200\320\270\320\274\320\265\320\275\321\217\320\265\321\202\321\201\321\217 \320\277\321\200\320\260\320\262\320\270\320\273\320\276 1: \0"
	.align 8
.LC16:
	.ascii "\320\237\321\200\320\270\320\274\320\265\320\275\321\217\320\265\321\202\321\201\321\217 \320\277\321\200\320\260\320\262\320\270\320\273\320\276 2: \0"
.LC17:
	.ascii "\320\240\320\265\320\267\321\203\320\273\321\214\321\202\320\260\321\202: \"%s\"\12\0"
	.text
	.globl	run_tests
	.def	run_tests;	.scl	2;	.type	32;	.endef
	.seh_proc	run_tests
run_tests:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$208, %rsp
	.seh_stackalloc	208
	.seh_endprologue
	leaq	.LC7(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	.LC8(%rip), %rax
	movq	%rax, -64(%rbp)
	leaq	.LC9(%rip), %rax
	movq	%rax, -56(%rbp)
	leaq	.LC10(%rip), %rax
	movq	%rax, -48(%rbp)
	leaq	.LC11(%rip), %rax
	movq	%rax, -40(%rbp)
	leaq	.LC12(%rip), %rax
	movq	%rax, -32(%rbp)
	leaq	.LC13(%rip), %rax
	movq	%rax, -24(%rbp)
	movq	$0, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L10
.L13:
	movl	-4(%rbp), %eax
	cltq
	movq	-64(%rbp,%rax,8), %rdx
	leaq	-176(%rbp), %rax
	movq	%rax, %rcx
	call	strcpy
	movl	-4(%rbp), %eax
	addl	$1, %eax
	leaq	-176(%rbp), %rdx
	movq	%rdx, %r8
	movl	%eax, %edx
	leaq	.LC14(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-176(%rbp), %rax
	movq	%rax, %rcx
	call	check_binary_property
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	je	.L11
	leaq	.LC15(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-176(%rbp), %rax
	movq	%rax, %rcx
	call	apply_rule1
	jmp	.L12
.L11:
	leaq	.LC16(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-176(%rbp), %rax
	movq	%rax, %rcx
	call	apply_rule2
.L12:
	leaq	-176(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC17(%rip), %rax
	movq	%rax, %rcx
	call	printf
	addl	$1, -4(%rbp)
.L10:
	movl	-4(%rbp), %eax
	cltq
	movq	-64(%rbp,%rax,8), %rax
	testq	%rax, %rax
	jne	.L13
	nop
	nop
	addq	$208, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (x86_64-win32-seh-rev0, Built by MinGW-Builds project) 14.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	strcspn;	.scl	2;	.type	32;	.endef
	.def	check_binary_property;	.scl	2;	.type	32;	.endef
	.def	apply_rule1;	.scl	2;	.type	32;	.endef
	.def	apply_rule2;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
