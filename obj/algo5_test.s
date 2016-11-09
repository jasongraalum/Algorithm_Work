	.file	"algo5_test.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"Matrix A"
.LC1:
	.string	"Matrix B"
.LC2:
	.string	"Multiplication of:"
.LC3:
	.string	"and"
.LC4:
	.string	"is:"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.file 1 "/media/NB_Fall_2016/Theory/Algorithms/src/algo5_test.c"
	.loc 1 4 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	.loc 1 11 0
	movl	$6, -36(%rbp)
	.loc 1 12 0
	movl	$8, -32(%rbp)
	.loc 1 13 0
	movl	$4, -28(%rbp)
	.loc 1 14 0
	movl	$0, %eax
	call	initRandGen
	.loc 1 16 0
	movl	-36(%rbp), %eax
	imull	-32(%rbp), %eax
	movl	$10, %esi
	movl	%eax, %edi
	call	genRandomArray
	movq	%rax, -24(%rbp)
	.loc 1 17 0
	movl	$.LC0, %edi
	call	puts
	.loc 1 18 0
	movl	-32(%rbp), %edx
	movl	-36(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	printDataMatrix
	.loc 1 19 0
	movl	$10, %edi
	call	putchar
	.loc 1 21 0
	movl	-28(%rbp), %eax
	imull	-36(%rbp), %eax
	movl	$10, %esi
	movl	%eax, %edi
	call	genRandomArray
	movq	%rax, -16(%rbp)
	.loc 1 22 0
	movl	$.LC1, %edi
	call	puts
	.loc 1 23 0
	movl	-36(%rbp), %edx
	movl	-28(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	printDataMatrix
	.loc 1 24 0
	movl	$10, %edi
	call	putchar
	.loc 1 26 0
	movl	-28(%rbp), %edi
	movl	-32(%rbp), %ecx
	movl	-36(%rbp), %edx
	movq	-16(%rbp), %rsi
	movq	-24(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	matrixMultiply
	movq	%rax, -8(%rbp)
	.loc 1 27 0
	movl	$.LC2, %edi
	call	puts
	.loc 1 28 0
	movl	-32(%rbp), %edx
	movl	-36(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	printDataMatrix
	.loc 1 29 0
	movl	$10, %edi
	call	putchar
	.loc 1 30 0
	movl	$.LC3, %edi
	call	puts
	.loc 1 31 0
	movl	-36(%rbp), %edx
	movl	-28(%rbp), %ecx
	movq	-16(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	printDataMatrix
	.loc 1 32 0
	movl	$10, %edi
	call	putchar
	.loc 1 33 0
	movl	$.LC4, %edi
	call	puts
	.loc 1 34 0
	movl	-32(%rbp), %edx
	movl	-28(%rbp), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	printDataMatrix
	.loc 1 35 0
	movl	$10, %edi
	call	putchar
	movl	$0, %eax
	.loc 1 37 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
.Letext0:
	.file 2 "/media/NB_Fall_2016/Theory/Algorithms/include/data_struct.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x171
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF19
	.byte	0xc
	.long	.LASF20
	.long	.LASF21
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x4
	.byte	0x8
	.long	0x72
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.long	.LASF12
	.byte	0x8
	.byte	0x2
	.byte	0x7
	.long	0xac
	.uleb128 0x6
	.string	"key"
	.byte	0x2
	.byte	0xa
	.long	0x57
	.byte	0
	.uleb128 0x7
	.long	.LASF11
	.byte	0x2
	.byte	0x16
	.long	0x57
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.long	.LASF13
	.value	0x200
	.byte	0x2
	.byte	0x2f
	.long	0xc4
	.uleb128 0x6
	.string	"d"
	.byte	0x2
	.byte	0x31
	.long	0xc4
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0xd4
	.long	0xd4
	.uleb128 0xa
	.long	0x65
	.byte	0x3f
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x87
	.uleb128 0xb
	.long	.LASF22
	.byte	0x1
	.byte	0x3
	.long	0x57
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x168
	.uleb128 0xc
	.long	.LASF14
	.byte	0x1
	.byte	0x3
	.long	0x57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xc
	.long	.LASF15
	.byte	0x1
	.byte	0x3
	.long	0x168
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xd
	.long	.LASF16
	.byte	0x1
	.byte	0x5
	.long	0x16e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xd
	.long	.LASF17
	.byte	0x1
	.byte	0x6
	.long	0x16e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xd
	.long	.LASF18
	.byte	0x1
	.byte	0x7
	.long	0x16e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.string	"m"
	.byte	0x1
	.byte	0x9
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xe
	.string	"n"
	.byte	0x1
	.byte	0x9
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xe
	.string	"p"
	.byte	0x1
	.byte	0x9
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.uleb128 0x4
	.byte	0x8
	.long	0x6c
	.uleb128 0x4
	.byte	0x8
	.long	0xac
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
.LASF9:
	.string	"long long int"
.LASF3:
	.string	"unsigned int"
.LASF11:
	.string	"payload"
.LASF22:
	.string	"main"
.LASF20:
	.string	"/media/NB_Fall_2016/Theory/Algorithms/src/algo5_test.c"
.LASF21:
	.string	"/media/NB_Fall_2016/Theory/Algorithms/obj"
.LASF12:
	.string	"element"
.LASF0:
	.string	"long unsigned int"
.LASF16:
	.string	"matrix1"
.LASF10:
	.string	"long long unsigned int"
.LASF1:
	.string	"unsigned char"
.LASF8:
	.string	"char"
.LASF6:
	.string	"long int"
.LASF13:
	.string	"dataArray"
.LASF15:
	.string	"argv"
.LASF14:
	.string	"argc"
.LASF19:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF2:
	.string	"short unsigned int"
.LASF4:
	.string	"signed char"
.LASF18:
	.string	"product"
.LASF17:
	.string	"matrix2"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"sizetype"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
