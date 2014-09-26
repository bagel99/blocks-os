	.syntax	unified
	.cpu	cortex-m3
	.eabi_attribute	6, 10
	.code	16
	.thumb_func
	.globl	memlen1
	.globl	memlen2
	.globl	memlen4
	.globl	memlen8
memlen1:
memlen2:
memlen4:
memlen8:
	mov	r1,r0
	mov	r0,#-1
0:	adds	r0,#1
	ldrb	r2,[r1],1
	cmp	r2,#0
	bne	0b
	bx	lr

