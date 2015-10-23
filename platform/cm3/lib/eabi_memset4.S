	.syntax	unified
	.cpu	cortex-m3
	.eabi_attribute	6, 10
	.code	16
	.thumb_func
	.globl	__aeabi_memset4
	.globl	__aeabi_memclr4
	@ order of args differs from traditional memset
	@ r0 - dest, r1 - n, r2 - c
	@ FIXME - optimize for 4-byte alignment
__aeabi_memclr4:
	mov	r2,#0
__aeabi_memset4:
	cbz	r1,9f
0:	strb	r2,[r0],1
	subs	r1,#1
	bgt	0b
9:	bx	lr

