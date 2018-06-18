# Example authored by Krzysztof Wojciechowski

add:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%rbx

	movl $10, %eax
	movl $20, %ebx
	addl %ebx, %eax

	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	popq	%rbx
	popq	%rbp
	ret
sub:
	movl $10, %eax
	movl $20, %ebx
	subl %ebx, %eax
	nop
	ret

mul:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	%edi, -20(%rbp)

	movl $10, %eax
	imull -20(%rbp), %eax

	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	popq	%rbp
	ret

	.section	.rodata
.LC0:
	.string	"%d, %d, %d\n"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	$0, %eax
	call	add

	movl	%eax, -4(%rbp)
	movl	$0, %eax
	call	sub

	movl	%eax, -8(%rbp)
	movl	$50, %edi
	call	mul

	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %ecx
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf

	movl	$0, %eax
	leave
	ret
