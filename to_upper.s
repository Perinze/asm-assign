	.file	"to_upper.c"
	.text
	.p2align 4
	.globl	To_Upper
	.type	To_Upper, @function
To_Upper:
.LFB0:
	.cfi_startproc
	movzbl	(%rdi), %eax
	testb	%al, %al
	je	.L14
	.p2align 4,,10
	.p2align 3
.L5:
	leal	-97(%rax), %edx
	cmpb	$25, %dl
	ja	.L3
	subl	$32, %eax
	addq	$1, %rdi
	movb	%al, -1(%rdi)
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L5
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	movzbl	1(%rdi), %eax
	addq	$1, %rdi
	testb	%al, %al
	jne	.L5
.L14:
	ret
	.cfi_endproc
.LFE0:
	.size	To_Upper, .-To_Upper
	.ident	"GCC: (GNU) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
