	.syntax	unified
	.cpu	cortex-m3
	.eabi_attribute	6, 10
	.code	16
	.thumb_func
	.globl	__aeabi_memcpy8
	@ FIXME - optimize for 8-byte alignment
__aeabi_memcpy8:
	cbz	r1,9f
0:	ldrb	r3,[r1],1
	strb	r3,[r0],1
	subs	r2,#1
	bgt	0b
9:	bx	lr

