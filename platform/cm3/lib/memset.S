	.syntax	unified
	.cpu	cortex-m3
	.eabi_attribute	6, 10
	.code	16
	.thumb_func
	.globl	memset
memset:
	cbz	r2,9f
0:	strb	r1,[r0],1
	subs	r2,#1
	bgt	0b
9:	bx	lr

