	.file	"data_utilities.c"
	.text
.Ltext0:
	.local	randReady
	.comm	randReady,4,4
	.globl	initRandGen
	.type	initRandGen, @function
initRandGen:
.LFB2:
	.file 1 "/media/NB_Fall_2016/Theory/Algorithms/src/data_utilities.c"
	.loc 1 5 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 7 0
	movl	randReady(%rip), %eax
	testl	%eax, %eax
	jne	.L2
	.loc 1 8 0
	movl	$0, %edi
	call	time
	movl	%eax, %edi
	call	srand
.L2:
	.loc 1 10 0
	movl	$1, randReady(%rip)
	.loc 1 11 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	initRandGen, .-initRandGen
	.globl	getRandonInt
	.type	getRandonInt, @function
getRandonInt:
.LFB3:
	.loc 1 14 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	.loc 1 16 0
	movl	randReady(%rip), %eax
	testl	%eax, %eax
	jne	.L4
	.loc 1 17 0
	movl	$0, %eax
	call	initRandGen
.L4:
	.loc 1 19 0
	call	rand
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	subl	-4(%rbp), %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	.loc 1 20 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	getRandonInt, .-getRandonInt
	.globl	getRandonChar
	.type	getRandonChar, @function
getRandonChar:
.LFB4:
	.loc 1 23 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 24 0
	movl	$31, -8(%rbp)
	.loc 1 25 0
	movl	$126, -4(%rbp)
	.loc 1 27 0
	movl	randReady(%rip), %eax
	testl	%eax, %eax
	jne	.L7
	.loc 1 28 0
	movl	$0, %eax
	call	initRandGen
.L7:
	.loc 1 30 0
	call	rand
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	subl	-8(%rbp), %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	cltd
	idivl	%ecx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	.loc 1 31 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	getRandonChar, .-getRandonChar
	.globl	writeDataArray
	.type	writeDataArray, @function
writeDataArray:
.LFB5:
	.loc 1 35 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 37 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	writeDataArray, .-writeDataArray
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"%d %d\n"
.LC2:
	.string	"%d"
	.text
	.globl	readMatrix
	.type	readMatrix, @function
readMatrix:
.LFB6:
	.loc 1 40 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	.loc 1 40 0
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 45 0
	movq	-56(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -24(%rbp)
	.loc 1 48 0
	leaq	-36(%rbp), %rcx
	leaq	-40(%rbp), %rdx
	movq	-24(%rbp), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf
	.loc 1 50 0
	movl	$24, %edi
	call	malloc
	movq	%rax, -16(%rbp)
	.loc 1 51 0
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movl	-36(%rbp), %eax
	cltq
	imulq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 52 0
	movl	-40(%rbp), %edx
	movl	-36(%rbp), %eax
	imull	%edx, %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movl	%edx, 8(%rax)
	.loc 1 54 0
	movl	-40(%rbp), %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movl	%edx, 16(%rax)
	.loc 1 55 0
	movl	-36(%rbp), %eax
	movl	%eax, %edx
	movq	-16(%rbp), %rax
	movl	%edx, 20(%rax)
	.loc 1 56 0
	movl	$0, -32(%rbp)
	.loc 1 57 0
	movl	$0, -28(%rbp)
	.loc 1 58 0
	jmp	.L11
.L13:
	.loc 1 61 0
	movq	-16(%rbp), %rax
	movq	(%rax), %rdx
	movl	-40(%rbp), %eax
	imull	-32(%rbp), %eax
	movl	%eax, %ecx
	movl	-28(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$2, %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf
	.loc 1 62 0
	movl	-28(%rbp), %eax
	addl	$1, %eax
	movl	-36(%rbp), %ecx
	cltd
	idivl	%ecx
	movl	%edx, -28(%rbp)
	.loc 1 63 0
	cmpl	$0, -28(%rbp)
	jne	.L11
	.loc 1 64 0
	addl	$1, -32(%rbp)
.L11:
	.loc 1 58 0
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	feof
	testl	%eax, %eax
	jne	.L12
	.loc 1 58 0 is_stmt 0 discriminator 1
	movl	-40(%rbp), %eax
	cmpl	%eax, -32(%rbp)
	jge	.L12
	.loc 1 58 0 discriminator 2
	movl	-36(%rbp), %eax
	cmpl	%eax, -28(%rbp)
	jl	.L13
.L12:
	.loc 1 66 0 is_stmt 1
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	.loc 1 67 0
	movq	-16(%rbp), %rax
	.loc 1 68 0
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L15
	call	__stack_chk_fail
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	readMatrix, .-readMatrix
	.globl	genRandomArray
	.type	genRandomArray, @function
genRandomArray:
.LFB7:
	.loc 1 73 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	.loc 1 76 0
	movl	$24, %edi
	call	malloc
	movq	%rax, -24(%rbp)
	.loc 1 77 0
	movl	-36(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 78 0
	movl	-36(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
.LBB2:
	.loc 1 80 0
	movl	$0, -28(%rbp)
	jmp	.L17
.L18:
	.loc 1 82 0 discriminator 3
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-28(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	leaq	(%rax,%rdx), %rbx
	call	rand
	cltd
	idivl	-40(%rbp)
	movl	%edx, %eax
	movl	%eax, (%rbx)
	.loc 1 80 0 discriminator 3
	addl	$1, -28(%rbp)
.L17:
	.loc 1 80 0 is_stmt 0 discriminator 1
	movl	-28(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L18
.LBE2:
	.loc 1 85 0 is_stmt 1
	movq	-24(%rbp), %rax
	.loc 1 86 0
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	genRandomArray, .-genRandomArray
	.globl	printBinaryTree
	.type	printBinaryTree, @function
printBinaryTree:
.LFB8:
	.loc 1 89 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	.loc 1 90 0
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	printBinaryTree, .-printBinaryTree
	.section	.rodata
.LC3:
	.string	" %3d "
	.text
	.globl	printDataMatrix
	.type	printDataMatrix, @function
printDataMatrix:
.LFB9:
	.loc 1 93 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 94 0
	movq	-24(%rbp), %rax
	movl	20(%rax), %eax
	movl	%eax, -8(%rbp)
	.loc 1 95 0
	movq	-24(%rbp), %rax
	movl	16(%rax), %eax
	movl	%eax, -4(%rbp)
	.loc 1 98 0
	movl	$0, -16(%rbp)
	jmp	.L22
.L25:
	.loc 1 100 0
	movl	$0, -12(%rbp)
	jmp	.L23
.L24:
	.loc 1 102 0 discriminator 3
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	movl	-16(%rbp), %eax
	imull	-4(%rbp), %eax
	movl	%eax, %ecx
	movl	-12(%rbp), %eax
	addl	%ecx, %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	.loc 1 100 0 discriminator 3
	addl	$1, -12(%rbp)
.L23:
	.loc 1 100 0 is_stmt 0 discriminator 1
	movl	-12(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L24
	.loc 1 104 0 is_stmt 1 discriminator 2
	movl	$10, %edi
	call	putchar
	.loc 1 98 0 discriminator 2
	addl	$1, -16(%rbp)
.L22:
	.loc 1 98 0 is_stmt 0 discriminator 1
	movl	-16(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L25
	.loc 1 106 0 is_stmt 1
	movl	-16(%rbp), %eax
	imull	-12(%rbp), %eax
	.loc 1 107 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	printDataMatrix, .-printDataMatrix
	.section	.rodata
.LC4:
	.string	"%d\t"
	.text
	.globl	printDataArray
	.type	printDataArray, @function
printDataArray:
.LFB10:
	.loc 1 111 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 113 0
	movl	$0, -4(%rbp)
	jmp	.L28
.L30:
	.loc 1 115 0
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	.loc 1 116 0
	movl	-4(%rbp), %eax
	leal	1(%rax), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	testl	%edx, %edx
	jne	.L29
	.loc 1 117 0
	movl	$10, %edi
	call	putchar
.L29:
	.loc 1 113 0 discriminator 2
	addl	$1, -4(%rbp)
.L28:
	.loc 1 113 0 is_stmt 0 discriminator 1
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movl	-4(%rbp), %eax
	cmpl	%eax, %edx
	ja	.L30
	.loc 1 119 0 is_stmt 1
	movl	-4(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$2, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %edx
	testl	%edx, %edx
	je	.L32
	.loc 1 120 0
	movl	$10, %edi
	call	putchar
.L32:
	.loc 1 121 0
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	printDataArray, .-printDataArray
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/media/NB_Fall_2016/Theory/Algorithms/include/data_struct.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x5a8
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF68
	.byte	0xc
	.long	.LASF69
	.long	.LASF70
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd8
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x83
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x84
	.long	0x69
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x95
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x4
	.byte	0x30
	.long	0xa7
	.uleb128 0x7
	.long	.LASF42
	.byte	0xd8
	.byte	0x5
	.byte	0xf1
	.long	0x224
	.uleb128 0x8
	.long	.LASF13
	.byte	0x5
	.byte	0xf2
	.long	0x62
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x5
	.byte	0xf7
	.long	0x8f
	.byte	0x8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x5
	.byte	0xf8
	.long	0x8f
	.byte	0x10
	.uleb128 0x8
	.long	.LASF16
	.byte	0x5
	.byte	0xf9
	.long	0x8f
	.byte	0x18
	.uleb128 0x8
	.long	.LASF17
	.byte	0x5
	.byte	0xfa
	.long	0x8f
	.byte	0x20
	.uleb128 0x8
	.long	.LASF18
	.byte	0x5
	.byte	0xfb
	.long	0x8f
	.byte	0x28
	.uleb128 0x8
	.long	.LASF19
	.byte	0x5
	.byte	0xfc
	.long	0x8f
	.byte	0x30
	.uleb128 0x8
	.long	.LASF20
	.byte	0x5
	.byte	0xfd
	.long	0x8f
	.byte	0x38
	.uleb128 0x8
	.long	.LASF21
	.byte	0x5
	.byte	0xfe
	.long	0x8f
	.byte	0x40
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.value	0x100
	.long	0x8f
	.byte	0x48
	.uleb128 0x9
	.long	.LASF23
	.byte	0x5
	.value	0x101
	.long	0x8f
	.byte	0x50
	.uleb128 0x9
	.long	.LASF24
	.byte	0x5
	.value	0x102
	.long	0x8f
	.byte	0x58
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.value	0x104
	.long	0x25c
	.byte	0x60
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.value	0x106
	.long	0x262
	.byte	0x68
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.value	0x108
	.long	0x62
	.byte	0x70
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.value	0x10c
	.long	0x62
	.byte	0x74
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.value	0x10e
	.long	0x70
	.byte	0x78
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.value	0x112
	.long	0x46
	.byte	0x80
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.value	0x113
	.long	0x54
	.byte	0x82
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.value	0x114
	.long	0x268
	.byte	0x83
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.value	0x118
	.long	0x278
	.byte	0x88
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.value	0x121
	.long	0x7b
	.byte	0x90
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.value	0x129
	.long	0x8d
	.byte	0x98
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.value	0x12a
	.long	0x8d
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.value	0x12b
	.long	0x8d
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.value	0x12c
	.long	0x8d
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.value	0x12e
	.long	0x2d
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.value	0x12f
	.long	0x62
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF41
	.byte	0x5
	.value	0x131
	.long	0x27e
	.byte	0xc4
	.byte	0
	.uleb128 0xa
	.long	.LASF71
	.byte	0x5
	.byte	0x96
	.uleb128 0x7
	.long	.LASF43
	.byte	0x18
	.byte	0x5
	.byte	0x9c
	.long	0x25c
	.uleb128 0x8
	.long	.LASF44
	.byte	0x5
	.byte	0x9d
	.long	0x25c
	.byte	0
	.uleb128 0x8
	.long	.LASF45
	.byte	0x5
	.byte	0x9e
	.long	0x262
	.byte	0x8
	.uleb128 0x8
	.long	.LASF46
	.byte	0x5
	.byte	0xa2
	.long	0x62
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22b
	.uleb128 0x6
	.byte	0x8
	.long	0xa7
	.uleb128 0xb
	.long	0x95
	.long	0x278
	.uleb128 0xc
	.long	0x86
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x224
	.uleb128 0xb
	.long	0x95
	.long	0x28e
	.uleb128 0xc
	.long	0x86
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x62
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF47
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF48
	.uleb128 0x7
	.long	.LASF49
	.byte	0x18
	.byte	0x6
	.byte	0x2f
	.long	0x2eb
	.uleb128 0x8
	.long	.LASF50
	.byte	0x6
	.byte	0x31
	.long	0x28e
	.byte	0
	.uleb128 0x8
	.long	.LASF51
	.byte	0x6
	.byte	0x32
	.long	0x4d
	.byte	0x8
	.uleb128 0x8
	.long	.LASF52
	.byte	0x6
	.byte	0x33
	.long	0x3f
	.byte	0xc
	.uleb128 0xd
	.string	"row"
	.byte	0x6
	.byte	0x34
	.long	0x4d
	.byte	0x10
	.uleb128 0xd
	.string	"col"
	.byte	0x6
	.byte	0x34
	.long	0x4d
	.byte	0x14
	.byte	0
	.uleb128 0xe
	.long	.LASF72
	.byte	0x1
	.byte	0x4
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.long	.LASF56
	.byte	0x1
	.byte	0xd
	.long	0x62
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x347
	.uleb128 0x10
	.string	"l"
	.byte	0x1
	.byte	0xd
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.string	"u"
	.byte	0x1
	.byte	0xd
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x11
	.string	"c"
	.byte	0x1
	.byte	0xf
	.long	0x95
	.byte	0
	.uleb128 0x12
	.long	.LASF53
	.byte	0x1
	.byte	0x16
	.long	0x62
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x381
	.uleb128 0x13
	.string	"l"
	.byte	0x1
	.byte	0x18
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.string	"u"
	.byte	0x1
	.byte	0x19
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x14
	.long	.LASF54
	.byte	0x1
	.byte	0x22
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x3bb
	.uleb128 0x15
	.long	.LASF55
	.byte	0x1
	.byte	0x22
	.long	0x3bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.string	"ofn"
	.byte	0x1
	.byte	0x22
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2a2
	.uleb128 0xf
	.long	.LASF57
	.byte	0x1
	.byte	0x27
	.long	0x3bb
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x446
	.uleb128 0x10
	.string	"ifn"
	.byte	0x1
	.byte	0x27
	.long	0x8f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x13
	.string	"ifp"
	.byte	0x1
	.byte	0x29
	.long	0x446
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.string	"row"
	.byte	0x1
	.byte	0x2a
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x13
	.string	"col"
	.byte	0x1
	.byte	0x2a
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x16
	.long	.LASF58
	.byte	0x1
	.byte	0x2b
	.long	0x3bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.long	.LASF59
	.byte	0x1
	.byte	0x38
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.long	.LASF60
	.byte	0x1
	.byte	0x39
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9c
	.uleb128 0xf
	.long	.LASF61
	.byte	0x1
	.byte	0x48
	.long	0x3bb
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x4b4
	.uleb128 0x10
	.string	"n"
	.byte	0x1
	.byte	0x48
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x15
	.long	.LASF62
	.byte	0x1
	.byte	0x48
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x16
	.long	.LASF55
	.byte	0x1
	.byte	0x4a
	.long	0x3bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x13
	.string	"i"
	.byte	0x1
	.byte	0x50
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.LASF63
	.byte	0x1
	.byte	0x58
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x4f8
	.uleb128 0x15
	.long	.LASF55
	.byte	0x1
	.byte	0x58
	.long	0x3bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x10
	.string	"n"
	.byte	0x1
	.byte	0x58
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.string	"m"
	.byte	0x1
	.byte	0x58
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xf
	.long	.LASF64
	.byte	0x1
	.byte	0x5c
	.long	0x62
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x55c
	.uleb128 0x15
	.long	.LASF55
	.byte	0x1
	.byte	0x5c
	.long	0x3bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x13
	.string	"col"
	.byte	0x1
	.byte	0x5e
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.string	"row"
	.byte	0x1
	.byte	0x5f
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x13
	.string	"i"
	.byte	0x1
	.byte	0x60
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.string	"j"
	.byte	0x1
	.byte	0x60
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x18
	.long	.LASF65
	.byte	0x1
	.byte	0x6e
	.quad	.LFB10
	.quad	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.long	0x596
	.uleb128 0x15
	.long	.LASF55
	.byte	0x1
	.byte	0x6e
	.long	0x3bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.long	.LASF66
	.byte	0x1
	.byte	0x70
	.long	0x62
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x16
	.long	.LASF67
	.byte	0x1
	.byte	0x3
	.long	0x62
	.uleb128 0x9
	.byte	0x3
	.quad	randReady
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF8:
	.string	"__off_t"
.LASF14:
	.string	"_IO_read_ptr"
.LASF26:
	.string	"_chain"
.LASF7:
	.string	"size_t"
.LASF32:
	.string	"_shortbuf"
.LASF69:
	.string	"/media/NB_Fall_2016/Theory/Algorithms/src/data_utilities.c"
.LASF20:
	.string	"_IO_buf_base"
.LASF48:
	.string	"long long unsigned int"
.LASF47:
	.string	"long long int"
.LASF4:
	.string	"signed char"
.LASF27:
	.string	"_fileno"
.LASF15:
	.string	"_IO_read_end"
.LASF6:
	.string	"long int"
.LASF13:
	.string	"_flags"
.LASF21:
	.string	"_IO_buf_end"
.LASF30:
	.string	"_cur_column"
.LASF72:
	.string	"initRandGen"
.LASF29:
	.string	"_old_offset"
.LASF34:
	.string	"_offset"
.LASF56:
	.string	"getRandonInt"
.LASF68:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF58:
	.string	"matrix"
.LASF55:
	.string	"array"
.LASF43:
	.string	"_IO_marker"
.LASF3:
	.string	"unsigned int"
.LASF62:
	.string	"bound"
.LASF54:
	.string	"writeDataArray"
.LASF0:
	.string	"long unsigned int"
.LASF18:
	.string	"_IO_write_ptr"
.LASF45:
	.string	"_sbuf"
.LASF51:
	.string	"size"
.LASF2:
	.string	"short unsigned int"
.LASF52:
	.string	"type"
.LASF22:
	.string	"_IO_save_base"
.LASF70:
	.string	"/media/NB_Fall_2016/Theory/Algorithms/obj"
.LASF33:
	.string	"_lock"
.LASF28:
	.string	"_flags2"
.LASF40:
	.string	"_mode"
.LASF65:
	.string	"printDataArray"
.LASF10:
	.string	"sizetype"
.LASF50:
	.string	"payload"
.LASF19:
	.string	"_IO_write_end"
.LASF71:
	.string	"_IO_lock_t"
.LASF42:
	.string	"_IO_FILE"
.LASF64:
	.string	"printDataMatrix"
.LASF46:
	.string	"_pos"
.LASF25:
	.string	"_markers"
.LASF53:
	.string	"getRandonChar"
.LASF1:
	.string	"unsigned char"
.LASF5:
	.string	"short int"
.LASF61:
	.string	"genRandomArray"
.LASF31:
	.string	"_vtable_offset"
.LASF12:
	.string	"FILE"
.LASF60:
	.string	"col_index"
.LASF11:
	.string	"char"
.LASF63:
	.string	"printBinaryTree"
.LASF67:
	.string	"randReady"
.LASF66:
	.string	"index"
.LASF44:
	.string	"_next"
.LASF9:
	.string	"__off64_t"
.LASF16:
	.string	"_IO_read_base"
.LASF49:
	.string	"dataArray"
.LASF24:
	.string	"_IO_save_end"
.LASF57:
	.string	"readMatrix"
.LASF35:
	.string	"__pad1"
.LASF36:
	.string	"__pad2"
.LASF37:
	.string	"__pad3"
.LASF38:
	.string	"__pad4"
.LASF39:
	.string	"__pad5"
.LASF41:
	.string	"_unused2"
.LASF23:
	.string	"_IO_backup_base"
.LASF59:
	.string	"row_index"
.LASF17:
	.string	"_IO_write_base"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
