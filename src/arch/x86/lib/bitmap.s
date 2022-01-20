	.file	"bitmap.c"
	.text
	.globl	bitmap_init
	.type	bitmap_init, @function
bitmap_init:
.LFB0:
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	subl	$12, %esp
.LCFI2:
	movl	8(%ebp), %eax
	pushl	(%eax)
.LCFI3:
	pushl	$0
.LCFI4:
	pushl	4(%eax)
.LCFI5:
	call	memset
	addl	$16, %esp
.LCFI6:
	leave
.LCFI7:
	ret
.LFE0:
	.size	bitmap_init, .-bitmap_init
	.globl	bitmap_scan_test
	.type	bitmap_scan_test, @function
bitmap_scan_test:
.LFB1:
	pushl	%ebp
.LCFI8:
	movl	%esp, %ebp
.LCFI9:
	movl	8(%ebp), %edx
	movl	12(%ebp), %ecx
	popl	%ebp
.LCFI10:
	movl	4(%edx), %edx
	movl	%ecx, %eax
	andl	$7, %ecx
	shrl	$3, %eax
	movzbl	(%edx,%eax), %eax
	movl	$1, %edx
	sall	%cl, %edx
	andl	%edx, %eax
	ret
.LFE1:
	.size	bitmap_scan_test, .-bitmap_scan_test
	.section	.rodata
.LC0:
	.string	"byte_index < (btmp->btmp_bytes_len)"
.LC1:
	.string	"lib/bitmap.c"
	.text
	.globl	bitmap_alloc
	.type	bitmap_alloc, @function
bitmap_alloc:
.LFB2:
	pushl	%ebp
.LCFI11:
	movl	%esp, %ebp
.LCFI12:
	pushl	%edi
.LCFI13:
	pushl	%esi
.LCFI14:
	xorl	%esi, %esi
	pushl	%ebx
.LCFI15:
	subl	$28, %esp
.LCFI16:
	movl	8(%ebp), %ebx
	movl	4(%ebx), %eax
	jmp	.L4
.L6:
	incl	%esi
.L4:
	cmpb	$-1, (%eax,%esi)
	jne	.L5
	cmpl	(%ebx), %esi
	jb	.L6
.L5:
	cmpl	(%ebx), %esi
	jb	.L7
	pushl	$.LC0
.LCFI17:
	pushl	$__func__.843
.LCFI18:
	pushl	$46
.LCFI19:
	pushl	$.LC1
.LCFI20:
	call	panic_spin
	addl	$16, %esp
.LCFI21:
.L7:
	movl	(%ebx), %edx
	orl	$-1, %eax
	cmpl	%edx, %esi
	je	.L8
	movl	4(%ebx), %eax
	xorl	%ecx, %ecx
	movl	$1, %edi
	movl	%esi, -28(%ebp)
	movl	%edx, -36(%ebp)
	movb	(%eax,%esi), %al
	jmp	.L9
.L10:
	incl	%ecx
.L9:
	movl	%edi, %esi
	sall	%cl, %esi
	movl	%esi, %edx
	testb	%dl, %al
	jne	.L10
	movl	-28(%ebp), %esi
	cmpl	$1, 12(%ebp)
	movl	-36(%ebp), %edx
	leal	(%ecx,%esi,8), %ecx
	movl	%ecx, %eax
	je	.L8
	leal	0(,%edx,8), %edi
	movl	$1, %esi
	subl	%ecx, %edi
	leal	1(%ecx), %edx
	jmp	.L11
.L14:
	pushl	%eax
.LCFI22:
	incl	%esi
	pushl	%eax
.LCFI23:
	pushl	%edx
.LCFI24:
	pushl	%ebx
.LCFI25:
	movl	%edx, -32(%ebp)
	call	bitmap_scan_test
	addl	$16, %esp
.LCFI26:
	movl	-32(%ebp), %edx
	testl	%eax, %eax
	je	.L12
	xorl	%esi, %esi
.L12:
	cmpl	12(%ebp), %esi
	jne	.L13
	subl	%esi, %edx
	leal	1(%edx), %eax
	jmp	.L8
.L13:
	decl	%edi
	incl	%edx
.L11:
	testl	%edi, %edi
	jne	.L14
	orl	$-1, %eax
.L8:
	leal	-12(%ebp), %esp
	popl	%ebx
.LCFI27:
	popl	%esi
.LCFI28:
	popl	%edi
.LCFI29:
	popl	%ebp
.LCFI30:
	ret
.LFE2:
	.size	bitmap_alloc, .-bitmap_alloc
	.section	.rodata
.LC2:
	.string	"value == 0 || value == 1"
	.text
	.globl	bitmap_set
	.type	bitmap_set, @function
bitmap_set:
.LFB3:
	pushl	%ebp
.LCFI31:
	movl	%esp, %ebp
.LCFI32:
	pushl	%edi
.LCFI33:
	pushl	%esi
.LCFI34:
	pushl	%ebx
.LCFI35:
	subl	$12, %esp
.LCFI36:
	movb	16(%ebp), %bl
	movl	8(%ebp), %esi
	movl	12(%ebp), %edi
	cmpb	$1, %bl
	jbe	.L18
	pushl	$.LC2
.LCFI37:
	pushl	$__func__.860
.LCFI38:
	pushl	$101
.LCFI39:
	pushl	$.LC1
.LCFI40:
	call	panic_spin
	addl	$16, %esp
.LCFI41:
.L18:
	movl	%edi, %edx
	movl	%edi, %ecx
	shrl	$3, %edx
	andl	$7, %ecx
	testb	%bl, %bl
	je	.L20
	decb	%bl
	jne	.L17
	jmp	.L22
.L20:
	addl	4(%esi), %edx
	movl	$1, %eax
	sall	%cl, %eax
	notl	%eax
	andb	%al, (%edx)
	jmp	.L17
.L22:
	addl	4(%esi), %edx
	movl	$1, %eax
	sall	%cl, %eax
	orb	%al, (%edx)
.L17:
	leal	-12(%ebp), %esp
	popl	%ebx
.LCFI42:
	popl	%esi
.LCFI43:
	popl	%edi
.LCFI44:
	popl	%ebp
.LCFI45:
	ret
.LFE3:
	.size	bitmap_set, .-bitmap_set
	.section	.rodata
	.align 4
	.type	__func__.843, @object
	.size	__func__.843, 13
__func__.843:
	.string	"bitmap_alloc"
	.align 4
	.type	__func__.860, @object
	.size	__func__.860, 11
__func__.860:
	.string	"bitmap_set"
	.section	.eh_frame,"aw",@progbits
.Lframe1:
	.long	.LECIE1-.LSCIE1
.LSCIE1:
	.long	0
	.byte	0x1
	.string	""
	.byte	0x1
	.byte	0x7c
	.byte	0x8
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0x88
	.byte	0x1
	.align 4
.LECIE1:
.LSFDE1:
	.long	.LEFDE1-.LASFDE1
.LASFDE1:
	.long	.LASFDE1-.Lframe1
	.long	.LFB0
	.long	.LFE0-.LFB0
	.byte	0x4
	.long	.LCFI0-.LFB0
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI1-.LCFI0
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI2-.LCFI1
	.byte	0x2e
	.byte	0x4
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0x2e
	.byte	0x8
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0x2e
	.byte	0xc
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0x2e
	.byte	0x10
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0x2e
	.byte	0
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xc5
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.align 4
.LEFDE1:
.LSFDE3:
	.long	.LEFDE3-.LASFDE3
.LASFDE3:
	.long	.LASFDE3-.Lframe1
	.long	.LFB1
	.long	.LFE1-.LFB1
	.byte	0x4
	.long	.LCFI8-.LFB1
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI9-.LCFI8
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0xc5
	.align 4
.LEFDE3:
.LSFDE5:
	.long	.LEFDE5-.LASFDE5
.LASFDE5:
	.long	.LASFDE5-.Lframe1
	.long	.LFB2
	.long	.LFE2-.LFB2
	.byte	0x4
	.long	.LCFI11-.LFB2
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI14-.LCFI12
	.byte	0x86
	.byte	0x4
	.byte	0x87
	.byte	0x3
	.byte	0x4
	.long	.LCFI16-.LCFI14
	.byte	0x83
	.byte	0x5
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0x2e
	.byte	0x4
	.byte	0x4
	.long	.LCFI18-.LCFI17
	.byte	0x2e
	.byte	0x8
	.byte	0x4
	.long	.LCFI19-.LCFI18
	.byte	0x2e
	.byte	0xc
	.byte	0x4
	.long	.LCFI20-.LCFI19
	.byte	0x2e
	.byte	0x10
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0x2e
	.byte	0
	.byte	0x4
	.long	.LCFI22-.LCFI21
	.byte	0x2e
	.byte	0x4
	.byte	0x4
	.long	.LCFI23-.LCFI22
	.byte	0x2e
	.byte	0x8
	.byte	0x4
	.long	.LCFI24-.LCFI23
	.byte	0x2e
	.byte	0xc
	.byte	0x4
	.long	.LCFI25-.LCFI24
	.byte	0x2e
	.byte	0x10
	.byte	0x4
	.long	.LCFI26-.LCFI25
	.byte	0x2e
	.byte	0
	.byte	0x4
	.long	.LCFI27-.LCFI26
	.byte	0xc3
	.byte	0x4
	.long	.LCFI28-.LCFI27
	.byte	0xc6
	.byte	0x4
	.long	.LCFI29-.LCFI28
	.byte	0xc7
	.byte	0x4
	.long	.LCFI30-.LCFI29
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0xc5
	.align 4
.LEFDE5:
.LSFDE7:
	.long	.LEFDE7-.LASFDE7
.LASFDE7:
	.long	.LASFDE7-.Lframe1
	.long	.LFB3
	.long	.LFE3-.LFB3
	.byte	0x4
	.long	.LCFI31-.LFB3
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI32-.LCFI31
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI36-.LCFI32
	.byte	0x83
	.byte	0x5
	.byte	0x86
	.byte	0x4
	.byte	0x87
	.byte	0x3
	.byte	0x4
	.long	.LCFI37-.LCFI36
	.byte	0x2e
	.byte	0x4
	.byte	0x4
	.long	.LCFI38-.LCFI37
	.byte	0x2e
	.byte	0x8
	.byte	0x4
	.long	.LCFI39-.LCFI38
	.byte	0x2e
	.byte	0xc
	.byte	0x4
	.long	.LCFI40-.LCFI39
	.byte	0x2e
	.byte	0x10
	.byte	0x4
	.long	.LCFI41-.LCFI40
	.byte	0x2e
	.byte	0
	.byte	0x4
	.long	.LCFI42-.LCFI41
	.byte	0xc3
	.byte	0x4
	.long	.LCFI43-.LCFI42
	.byte	0xc6
	.byte	0x4
	.long	.LCFI44-.LCFI43
	.byte	0xc7
	.byte	0x4
	.long	.LCFI45-.LCFI44
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0xc5
	.align 4
.LEFDE7:
	.ident	"GCC: (GNU) 4.6.1"
