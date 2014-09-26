	.syntax	unified
	.cpu	cortex-m3
	.eabi_attribute	6, 10
	.code	16
	.thumb_func
	.globl	memcpy
memcpy:
	ldrb	r3,[r1],1
	strb	r3,[r0],1
	subs	r2,#1
	bgt	memcpy
	bx	lr

