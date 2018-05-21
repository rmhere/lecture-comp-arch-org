	.file	"1.cpp"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 8 "1.cpp" 1
	movl $10, %eax;movl $20, %ebx;addl %ebx, %eax;
# 0 "" 2
# 14 "1.cpp" 1
	movl $10, %eax;movl $20, %ebx;subl %ebx, %eax;
# 0 "" 2
# 20 "1.cpp" 1
	movl $10, %eax;movl $20, %ebx;imull %ebx, %eax;
# 0 "" 2
#NO_APP
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
