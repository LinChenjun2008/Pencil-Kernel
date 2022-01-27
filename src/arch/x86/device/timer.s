	.file	"timer.c"
	.text
	.globl	init_pit
	.type	init_pit, @function
init_pit:
.LFB0:
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	subl	$16, %esp
.LCFI2:
	pushl	$52
.LCFI3:
	pushl	$67
.LCFI4:
	call	io_out8
	popl	%eax
.LCFI5:
	popl	%edx
.LCFI6:
	pushl	$156
.LCFI7:
	pushl	$64
.LCFI8:
	call	io_out8
	popl	%ecx
.LCFI9:
	popl	%eax
.LCFI10:
	pushl	$46
.LCFI11:
	pushl	$64
.LCFI12:
	call	io_out8
	addl	$16, %esp
.LCFI13:
	leave
.LCFI14:
	ret
.LFE0:
	.size	init_pit, .-init_pit
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
	.byte	0x8
	.byte	0x4
	.long	.LCFI3-.LCFI2
	.byte	0x2e
	.byte	0xc
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0x2e
	.byte	0x10
	.byte	0x4
	.long	.LCFI5-.LCFI4
	.byte	0x2e
	.byte	0xc
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
	.byte	0xc
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0x2e
	.byte	0x8
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0x2e
	.byte	0xc
	.byte	0x4
	.long	.LCFI12-.LCFI11
	.byte	0x2e
	.byte	0x10
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0x2e
	.byte	0
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xc5
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.align 4
.LEFDE1:
	.ident	"GCC: (GNU) 4.6.1"
