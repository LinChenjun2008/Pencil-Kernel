	.file	"list.c"
	.text
	.globl	list_init
	.type	list_init, @function
list_init:
.LFB0:
	pushl	%ebp
.LCFI0:
	movl	%esp, %ebp
.LCFI1:
	movl	8(%ebp), %eax
	leal	8(%eax), %edx
	movl	$0, (%eax)
	movl	%edx, 4(%eax)
	movl	%eax, 8(%eax)
	movl	$0, 12(%eax)
	popl	%ebp
.LCFI2:
	ret
.LFE0:
	.size	list_init, .-list_init
	.globl	list_in
	.type	list_in, @function
list_in:
.LFB1:
	pushl	%ebp
.LCFI3:
	movl	%esp, %ebp
.LCFI4:
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	(%eax), %ecx
	movl	%eax, 4(%edx)
	movl	%ecx, (%edx)
	movl	(%eax), %ecx
	movl	%edx, (%eax)
	movl	%edx, 4(%ecx)
	popl	%ebp
.LCFI5:
	ret
.LFE1:
	.size	list_in, .-list_in
	.globl	list_push
	.type	list_push, @function
list_push:
.LFB2:
	pushl	%ebp
.LCFI6:
	movl	%esp, %ebp
.LCFI7:
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	4(%eax), %eax
	movl	(%eax), %ecx
	movl	%eax, 4(%edx)
	movl	%ecx, (%edx)
	movl	(%eax), %ecx
	movl	%edx, (%eax)
	movl	%edx, 4(%ecx)
	popl	%ebp
.LCFI8:
	ret
.LFE2:
	.size	list_push, .-list_push
	.globl	list_append
	.type	list_append, @function
list_append:
.LFB3:
	pushl	%ebp
.LCFI9:
	movl	%esp, %ebp
.LCFI10:
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	8(%eax), %eax
	movl	(%eax), %ecx
	movl	%eax, 4(%edx)
	movl	%ecx, (%edx)
	movl	(%eax), %ecx
	movl	%edx, (%eax)
	movl	%edx, 4(%ecx)
	popl	%ebp
.LCFI11:
	ret
.LFE3:
	.size	list_append, .-list_append
	.globl	list_remove
	.type	list_remove, @function
list_remove:
.LFB4:
	pushl	%ebp
.LCFI12:
	movl	%esp, %ebp
.LCFI13:
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	testl	%edx, %edx
	je	.L6
	movl	4(%eax), %ecx
	testl	%ecx, %ecx
	je	.L6
	movl	%ecx, 4(%edx)
	movl	4(%eax), %ecx
	movl	$0, 4(%eax)
	movl	%edx, (%ecx)
	movl	$0, (%eax)
.L6:
	popl	%ebp
.LCFI14:
	ret
.LFE4:
	.size	list_remove, .-list_remove
	.globl	list_pop
	.type	list_pop, @function
list_pop:
.LFB5:
	pushl	%ebp
.LCFI15:
	movl	%esp, %ebp
.LCFI16:
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%ebp)
	popl	%ebp
.LCFI17:
	jmp	list_remove
.LFE5:
	.size	list_pop, .-list_pop
	.globl	list_find
	.type	list_find, @function
list_find:
.LFB6:
	pushl	%ebp
.LCFI18:
	movl	%esp, %ebp
.LCFI19:
	movl	8(%ebp), %edx
	movl	12(%ebp), %ecx
	movl	4(%edx), %eax
	addl	$8, %edx
	jmp	.L9
.L11:
	cmpl	%ecx, %eax
	je	.L12
	movl	4(%eax), %eax
.L9:
	cmpl	%edx, %eax
	jne	.L11
	xorl	%eax, %eax
	jmp	.L10
.L12:
	movl	$1, %eax
.L10:
	popl	%ebp
.LCFI20:
	ret
.LFE6:
	.size	list_find, .-list_find
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
	.long	.LCFI3-.LFB1
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI4-.LCFI3
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI5-.LCFI4
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
	.long	.LCFI6-.LFB2
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI7-.LCFI6
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI8-.LCFI7
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
	.long	.LCFI9-.LFB3
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI10-.LCFI9
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI11-.LCFI10
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0xc5
	.align 4
.LEFDE7:
.LSFDE9:
	.long	.LEFDE9-.LASFDE9
.LASFDE9:
	.long	.LASFDE9-.Lframe1
	.long	.LFB4
	.long	.LFE4-.LFB4
	.byte	0x4
	.long	.LCFI12-.LFB4
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI13-.LCFI12
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI14-.LCFI13
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0xc5
	.align 4
.LEFDE9:
.LSFDE11:
	.long	.LEFDE11-.LASFDE11
.LASFDE11:
	.long	.LASFDE11-.Lframe1
	.long	.LFB5
	.long	.LFE5-.LFB5
	.byte	0x4
	.long	.LCFI15-.LFB5
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI16-.LCFI15
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI17-.LCFI16
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0xc5
	.align 4
.LEFDE11:
.LSFDE13:
	.long	.LEFDE13-.LASFDE13
.LASFDE13:
	.long	.LASFDE13-.Lframe1
	.long	.LFB6
	.long	.LFE6-.LFB6
	.byte	0x4
	.long	.LCFI18-.LFB6
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.long	.LCFI19-.LCFI18
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.long	.LCFI20-.LCFI19
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0xc5
	.align 4
.LEFDE13:
	.ident	"GCC: (GNU) 4.6.1"
