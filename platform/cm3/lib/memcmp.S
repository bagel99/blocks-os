	.syntax	unified
	.cpu	cortex-m3
	.eabi_attribute	6, 10
	.code	16
	.thumb_func
	.globl	memcmp1
memcmp1:
	cbz	r2,.L1_i8
.LOOP_i8:
	ldrb	r3,[r1],1
	ldrb	r12,[r0],1
	cmp	r3,r12
	bne	.L0_i8	
	subs	r2,#1
	bgt	.LOOP_i8
.L1_i8:	mov	r0,1
	bx	lr
.L0_i8:	mov	r0,0
	bx	lr

	.thumb_func
	.globl	memcmp2
memcmp2:
	cbz	r2,.L1_i16
.LOOP_i16:
	ldrh	r3,[r1],2
	ldrh	r12,[r0],2
	cmp	r3,r12
	bne	.L0_i16	
	subs	r2,#1
	bgt	.LOOP_i16
.L1_i16:mov	r0,1
	bx	lr
.L0_i16:mov	r0,0
	bx	lr

	.thumb_func
	.globl	memcmp4
memcmp4:
	cbz	r2,.L1_i32
.LOOP_i32:
	ldr	r3,[r1],4
	ldr	r12,[r0],4
	cmp	r3,r12
	bne	.L0_i32	
	subs	r2,#1
	bgt	.LOOP_i32
.L1_i32:mov	r0,1
	bx	lr
.L0_i32:mov	r0,0
	bx	lr

	.thumb_func
	.globl	memcmp8
memcmp8:
	cbz	r2,.L1_i64
.LOOP_i64:
	ldr	r3,[r1],4
	ldr	r12,[r0],4
	cmp	r3,r12
	bne	.L0_i64	
	ldr	r3,[r1],4
	ldr	r12,[r0],4
	cmp	r3,r12
	bne	.L0_i64	
	subs	r2,#1
	bgt	.LOOP_i64
.L1_i64:mov	r0,1
	bx	lr
.L0_i64:mov	r0,0
	bx	lr
	
