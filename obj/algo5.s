	.file	"algo5.c"
	.text
.Ltext0:
	.globl	matrixMultiply
	.type	matrixMultiply, @function
matrixMultiply:
.LFB2:
	.file 1 "/media/NB_Fall_2016/Theory/Algorithms/src/algo5.c"
	.loc 1 9 0
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movl	%ecx, -56(%rbp)
	movl	%r8d, -60(%rbp)
	.loc 1 13 0
	movl	$512, %edi
	call	malloc
	movq	%rax, -8(%rbp)
	.loc 1 15 0
	movl	$0, -20(%rbp)
.LBB2:
	.loc 1 16 0
	movl	$0, -32(%rbp)
	jmp	.L2
.L7:
	.loc 1 18 0
	movl	-32(%rbp), %eax
	movl	%eax, -16(%rbp)
.LBB3:
	.loc 1 19 0
	movl	$0, -28(%rbp)
	jmp	.L3
.L6:
	.loc 1 21 0
	movl	-28(%rbp), %eax
	movl	%eax, -12(%rbp)
	.loc 1 22 0
	movl	-16(%rbp), %eax
	imull	-60(%rbp), %eax
	movl	%eax, %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -20(%rbp)
	.loc 1 23 0
	movl	$8, %edi
	call	malloc
	movq	%rax, %rcx
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	movq	%rcx, (%rax,%rdx,8)
	.loc 1 24 0
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movl	$0, 4(%rax)
.LBB4:
	.loc 1 25 0
	movl	$0, -24(%rbp)
	jmp	.L4
.L5:
	.loc 1 26 0 discriminator 3
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	-8(%rbp), %rdx
	movl	-20(%rbp), %ecx
	movslq	%ecx, %rcx
	movq	(%rdx,%rcx,8), %rdx
	movl	4(%rdx), %esi
	movl	-16(%rbp), %edx
	movl	%edx, %ecx
	imull	-52(%rbp), %ecx
	movl	-24(%rbp), %edx
	addl	%edx, %ecx
	movq	-40(%rbp), %rdx
	movslq	%ecx, %rcx
	movq	(%rdx,%rcx,8), %rdx
	movl	4(%rdx), %edi
	movl	-24(%rbp), %edx
	movl	%edx, %ecx
	imull	-60(%rbp), %ecx
	movl	-12(%rbp), %edx
	addl	%edx, %ecx
	movq	-48(%rbp), %rdx
	movslq	%ecx, %rcx
	movq	(%rdx,%rcx,8), %rdx
	movl	4(%rdx), %edx
	imull	%edi, %edx
	addl	%esi, %edx
	movl	%edx, 4(%rax)
	.loc 1 25 0 discriminator 3
	addl	$1, -24(%rbp)
.L4:
	.loc 1 25 0 is_stmt 0 discriminator 1
	movl	-24(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L5
.LBE4:
	.loc 1 19 0 is_stmt 1 discriminator 2
	addl	$1, -28(%rbp)
.L3:
	.loc 1 19 0 is_stmt 0 discriminator 1
	movl	-28(%rbp), %eax
	cmpl	-60(%rbp), %eax
	jl	.L6
.LBE3:
	.loc 1 16 0 is_stmt 1 discriminator 2
	addl	$1, -32(%rbp)
.L2:
	.loc 1 16 0 is_stmt 0 discriminator 1
	movl	-32(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jl	.L7
.LBE2:
	.loc 1 30 0 is_stmt 1
	movq	-8(%rbp), %rax
	.loc 1 32 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	matrixMultiply, .-matrixMultiply
.Letext0:
	.file 2 "/media/NB_Fall_2016/Theory/Algorithms/include/data_struct.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1ca
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF18
	.byte	0xc
	.long	.LASF19
	.long	.LASF20
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
	.uleb128 0x4
	.long	.LASF12
	.byte	0x8
	.byte	0x2
	.byte	0x7
	.long	0xa6
	.uleb128 0x5
	.string	"key"
	.byte	0x2
	.byte	0xa
	.long	0x57
	.byte	0
	.uleb128 0x6
	.long	.LASF11
	.byte	0x2
	.byte	0x16
	.long	0x57
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	.LASF13
	.value	0x200
	.byte	0x2
	.byte	0x2f
	.long	0xbe
	.uleb128 0x5
	.string	"d"
	.byte	0x2
	.byte	0x31
	.long	0xbe
	.byte	0
	.byte	0
	.uleb128 0x8
	.long	0xce
	.long	0xce
	.uleb128 0x9
	.long	0x65
	.byte	0x3f
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0x81
	.uleb128 0xb
	.long	.LASF21
	.byte	0x1
	.byte	0x8
	.long	0x1c7
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c7
	.uleb128 0xc
	.string	"A"
	.byte	0x1
	.byte	0x8
	.long	0x1c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0xc
	.string	"B"
	.byte	0x1
	.byte	0x8
	.long	0x1c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xc
	.string	"m"
	.byte	0x1
	.byte	0x8
	.long	0x57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0xc
	.string	"n"
	.byte	0x1
	.byte	0x8
	.long	0x57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xc
	.string	"p"
	.byte	0x1
	.byte	0x8
	.long	0x57
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0xd
	.long	.LASF14
	.byte	0x1
	.byte	0xa
	.long	0x1c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.long	.LASF15
	.byte	0x1
	.byte	0xb
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xd
	.long	.LASF16
	.byte	0x1
	.byte	0xb
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xd
	.long	.LASF17
	.byte	0x1
	.byte	0xb
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0xe
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0xf
	.string	"i"
	.byte	0x1
	.byte	0x10
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xe
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0xf
	.string	"j"
	.byte	0x1
	.byte	0x13
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xe
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0xf
	.string	"k"
	.byte	0x1
	.byte	0x19
	.long	0x57
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x8
	.long	0xa6
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0xf
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
.LASF14:
	.string	"prodArray"
.LASF1:
	.string	"unsigned char"
.LASF0:
	.string	"long unsigned int"
.LASF2:
	.string	"short unsigned int"
.LASF20:
	.string	"/media/NB_Fall_2016/Theory/Algorithms/obj"
.LASF19:
	.string	"/media/NB_Fall_2016/Theory/Algorithms/src/algo5.c"
.LASF18:
	.string	"GNU C11 5.4.0 20160609 -mtune=generic -march=x86-64 -g -fstack-protector-strong"
.LASF3:
	.string	"unsigned int"
.LASF21:
	.string	"matrixMultiply"
.LASF10:
	.string	"long long unsigned int"
.LASF11:
	.string	"payload"
.LASF7:
	.string	"sizetype"
.LASF9:
	.string	"long long int"
.LASF8:
	.string	"char"
.LASF17:
	.string	"prod_index"
.LASF5:
	.string	"short int"
.LASF13:
	.string	"dataArray"
.LASF6:
	.string	"long int"
.LASF16:
	.string	"B_col"
.LASF4:
	.string	"signed char"
.LASF15:
	.string	"A_row"
.LASF12:
	.string	"element"
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
