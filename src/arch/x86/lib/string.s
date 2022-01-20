	.file	"string.c"
	.section	.rodata
.LC0:
	.string	"dst__ != NULL"
.LC1:
	.string	"lib/string.c"
	.text
	.globl	memset
	.type	memset, @function
memset:
.LFB0:
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	pushl	%esi
.LCFI2:
	pushl	%ebx
.LCFI3:
	subl	$16, %esp
.LCFI4:
	movl	8(%ebp), %ebx
	movl	16(%ebp), %esi
	movb	12(%ebp), %dl
	testl	%ebx, %ebx
	jne	.L2
	pushl	$.LC0
.LCFI5:
	pushl	$__func__.816
.LCFI6:
	pushl	$15
.LCFI7:
	pushl	$.LC1
.LCFI8:
	movb	%dl, -12(%ebp)
	call	panic_spin
	movb	-12(%ebp), %dl
	addl	$16, %esp
.LCFI9:
.L2:
	xorl	%eax, %eax
	jmp	.L3
.L4:
	movb	%dl, (%ebx,%eax)
	incl	%eax
.L3:
	cmpl	%esi, %eax
	jne	.L4
	leal	-8(%ebp), %esp
	popl	%ebx
.LCFI10:
	popl	%esi
.LCFI11:
	popl	%ebp
.LCFI12:
	ret
.LFE0:
	.size	memset, .-memset
	.section	.rodata
.LC2:
	.string	"dst__ != NULL && src__ != NULL"
	.text
	.globl	memcpy
	.type	memcpy, @function
memcpy:
.LFB1:
	pushl	%ebp
.LCFI13:
	movl	%esp, %ebp
.LCFI14:
	pushl	%edi
.LCFI15:
	pushl	%esi
.LCFI16:
	pushl	%ebx
.LCFI17:
	subl	$12, %esp
.LCFI18:
	movl	12(%ebp), %esi
	movl	8(%ebp), %ebx
	movl	16(%ebp), %edi
	testl	%esi, %esi
	je	.L11
	testl	%ebx, %ebx
	jne	.L7
.L11:
	pushl	$.LC2
.LCFI19:
	pushl	$__func__.827
.LCFI20:
	pushl	$34
.LCFI21:
	pushl	$.LC1
.LCFI22:
	call	panic_spin
	addl	$16, %esp
.LCFI23:
.L7:
	xorl	%eax, %eax
	jmp	.L9
.L10:
	movb	(%esi,%eax), %dl
	movb	%dl, (%ebx,%eax)
	incl	%eax
.L9:
	cmpl	%edi, %eax
	jne	.L10
	leal	-12(%ebp), %esp
	popl	%ebx
.LCFI24:
	popl	%esi
.LCFI25:
	popl	%edi
.LCFI26:
	popl	%ebp
.LCFI27:
	ret
.LFE1:
	.size	memcpy, .-memcpy
	.section	.rodata
.LC3:
	.string	"p1__ != NULL && p2__ != NULL"
	.text
	.globl	memcmp
	.type	memcmp, @function
memcmp:
.LFB2:
	pushl	%ebp
.LCFI28:
	movl	%esp, %ebp
.LCFI29:
	pushl	%esi
.LCFI30:
	movl	8(%ebp), %esi
	pushl	%ebx
.LCFI31:
	movl	12(%ebp), %ebx
	testl	%ebx, %ebx
	je	.L17
	testl	%esi, %esi
	jne	.L13
.L17:
	pushl	$.LC3
.LCFI32:
	pushl	$__func__.839
.LCFI33:
	pushl	$59
.LCFI34:
	pushl	$.LC1
.LCFI35:
	call	panic_spin
	addl	$16, %esp
.LCFI36:
.L13:
	movb	(%ebx), %dl
	orl	$-1, %eax
	cmpb	%dl, (%esi)
	jb	.L15
	seta	%al
	movzbl	%al, %eax
.L15:
	leal	-8(%ebp), %esp
	popl	%ebx
.LCFI37:
	popl	%esi
.LCFI38:
	popl	%ebp
.LCFI39:
	ret
.LFE2:
	.size	memcmp, .-memcmp
	.section	.rodata
	.align 4
	.type	__func__.816, @object
	.size	__func__.816, 7
__func__.816:
	.string	"memset"
	.align 4
	.type	__func__.827, @object
	.size	__func__.827, 7
__func__.827:
	.string	"memcpy"
	.align 4
	.type	__func__.839, @object
	.size	__func__.839, 7
__func__.839:
	.string	"memcmp"
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
	.long	.LCFI4-.LCFI1
	.byte	0x83
	.byte	0x4
	.byte	0x86
	.byte	0x3
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0x2e
	.byte	0x4
	.byte	0x4
	.long	.LCFI6-.LCFI5
	.byte	0x2e
	.byte	0x8
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0x2e
	.byte	0xc
	.byte	0x4
	.long	.LCFI8-.LCFI7
	.byte	0x2e
	.byte	0x10
	.byte	0x4
	.long	.LCFI9-.LCFI8
	.byte	0x2e
	.byte	0
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xc3
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xc6
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0xc5
	.align 4
.LEFDE1:
.LSFDE3:
	.long	.LEFDE3-.LASFDE3
.LASFDE3:
	.long	.LASFDE3-.Lframe1
	.long	.LFB1
	.long	.LFE1-.LFB1
	.byte	0x4
	.long	.LCFI13-.LFB1
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI18-.LCFI14
	.byte	0x83
	.byte	0x5
	.byte	0x86
	.byte	0x4
	.byte	0x87
	.byte	0x3
	.byte	0x4
	.long	.LCFI19-.LCFI18
	.byte	0x2e
	.byte	0x4
	.byte	0x4
	.long	.LCFI20-.LCFI19
	.byte	0x2e
	.byte	0x8
	.byte	0x4
	.long	.LCFI21-.LCFI20
	.byte	0x2e
	.byte	0xc
	.byte	0x4
	.long	.LCFI22-.LCFI21
	.byte	0x2e
	.byte	0x10
	.byte	0x4
	.long	.LCFI23-.LCFI22
	.byte	0x2e
	.byte	0
	.byte	0x4
	.long	.LCFI24-.LCFI23
	.byte	0xc3
	.byte	0x4
	.long	.LCFI25-.LCFI24
	.byte	0xc6
	.byte	0x4
	.long	.LCFI26-.LCFI25
	.byte	0xc7
	.byte	0x4
	.long	.LCFI27-.LCFI26
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
	.long	.LCFI28-.LFB2
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI29-.LCFI28
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI30-.LCFI29
	.byte	0x86
	.byte	0x3
	.byte	0x4
	.long	.LCFI31-.LCFI30
	.byte	0x83
	.byte	0x4
	.byte	0x4
	.long	.LCFI32-.LCFI31
	.byte	0x2e
	.byte	0x4
	.byte	0x4
	.long	.LCFI33-.LCFI32
	.byte	0x2e
	.byte	0x8
	.byte	0x4
	.long	.LCFI34-.LCFI33
	.byte	0x2e
	.byte	0xc
	.byte	0x4
	.long	.LCFI35-.LCFI34
	.byte	0x2e
	.byte	0x10
	.byte	0x4
	.long	.LCFI36-.LCFI35
	.byte	0x2e
	.byte	0
	.byte	0x4
	.long	.LCFI37-.LCFI36
	.byte	0xc3
	.byte	0x4
	.long	.LCFI38-.LCFI37
	.byte	0xc6
	.byte	0x4
	.long	.LCFI39-.LCFI38
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0xc5
	.align 4
.LEFDE5:
	.ident	"GCC: (GNU) 4.6.1"
