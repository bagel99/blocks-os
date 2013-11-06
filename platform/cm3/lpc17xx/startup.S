	.syntax	unified
	.cpu	cortex-m3
	.section ".vectors"
	.globl  __vectors
	.type   __vectors,%object

	.set	_stacktop,0x10008000
__vectors:
	.long   _stacktop		/*  0: Top of Stack		*/
	.long   _start			/*  1: Reset Handler		*/
	.long   _nmi			/*  2: NMI Handler		*/
	.long   _hardFault		/*  3: Hard Fault Handler	*/
	.long   _memManage		/*  4: MPU Fault Handler	*/
	.long   _busFault		/*  5: Bus Fault Handler	*/
	.long   _usageFault		/*  6: Usage Fault Handler	*/
	.long   0			/*  7: Reserved			*/
	.long   0			/*  8: Reserved			*/
	.long   0			/*  9: Reserved			*/
	.long   0			/* 10: Reserved			*/
	.long   _svc			/* 11: SVCall Handler		*/
	.long   _debug			/* 12: Debug Monitor Handler	*/
	.long   0			/* 13: Reserved			*/
	.long   _pendSV			/* 14: PendSV Handler		*/
	.long   SYSTICK_IRQ		/* 15: SysTick Handler		*/

	/* External Interrupts */
	.long   WDT_IRQ			/* 16/ 0: Watchdog Timer	*/
	.long   TIMER0_IRQ		/* 17/ 1: Timer0		*/
	.long   TIMER1_IRQ		/* 18/ 2: Timer1		*/
	.long   TIMER2_IRQ		/* 19/ 3: Timer2		*/
	.long   TIMER3_IRQ		/* 20/ 4: Timer3		*/
	.long   UART0_IRQ		/* 21/ 5: UART0			*/
	.long   UART1_IRQ		/* 22/ 6: UART1			*/
	.long   UART2_IRQ		/* 23/ 7: UART2			*/
	.long   UART3_IRQ		/* 24/ 8: UART3			*/
	.long   PWM1_IRQ		/* 25/ 9: PWM1			*/
	.long   I2C0_IRQ		/* 26/10: I2C0			*/
	.long   I2C1_IRQ		/* 27/11: I2C1			*/
	.long   I2C2_IRQ		/* 28/12: I2C2			*/
	.long   SPI_IRQ			/* 29/13: SPI			*/
	.long   SSP0_IRQ		/* 30/14: SSP0			*/
	.long   SSP1_IRQ		/* 31/15: SSP1			*/
	.long   PLL0_IRQ		/* 32/16: PLL0 Lock		*/
	.long   RTC_IRQ			/* 33/17: Real Time Clock	*/
	.long   EINT0_IRQ		/* 34/18: External Interrupt 0	*/
	.long   EINT1_IRQ		/* 35/19: External Interrupt 1	*/
	.long   EINT2_IRQ		/* 36/20: External Interrupt 2	*/
	.long   EINT3_IRQ		/* 37/21: External Interrupt 3	*/
	.long   ADC_IRQ			/* 38/22: A/D Converter		*/
	.long   BOD_IRQ			/* 39/23: Brown-Out Detect	*/
	.long   USB_IRQ			/* 40/24: USB			*/
	.long   CAN_IRQ			/* 41/25: CAN			*/
	.long   DMA_IRQ			/* 42/26: General Purpose DMA	*/
	.long   I2S_IRQ			/* 43/27: I2S			*/
	.long   ENET_IRQ		/* 44/28: Ethernet		*/
	.long   RIT_IRQ			/* 45/29: Repetitive Inter Tmr	*/
	.long   MCPWM_IRQ		/* 46/30: Motor Control PWM	*/
	.long   QEI_IRQ			/* 47/31: Quadrature Enc Intf	*/
	.long   PLL1_IRQ		/* 48/32: PLL1 Lock (USB PLL)	*/

	.size   __vectors,.-__vectors

	.thumb


	/* Reset Handler */
	.section ".text"
	.thumb_func
	.globl  _start
	.type   _start,%function
_start:
	.fnstart
	/* copy up data segment */
	ldr	r0,=_etext
	ldr	r1,=_data
	ldr	r2,=_edata
	b	ctest
cdata:	ldr	r3,[r0],#4
	str	r3,[r1],#4
ctest:	cmp	r1,r2
	blt	cdata
	/* zero bss segment r1=r2=_edata */
	ldr	r2,=_end
	movs	r0,#0
	b	ztest
zbss:	str	r0,[r1],#4
ztest:	cmp	r1,r2
	blt	zbss
	/* call main */
	ldr     r0,=main
	blx     r0
	b	.
	.cantunwind
	.fnend
	.size   _start,.-_start

	.thumb_func
	.globl	wait
	.type   wait,%function
wait:
	.fnstart
	wfi
	blx	lr
	.cantunwind
	.fnend
	.size	wait,.-wait

	.thumb_func
	.globl	getsp
	.type   getsp,%function
getsp:
	.fnstart
	mov	r0,sp
	blx	lr
	.cantunwind
	.fnend
	.size	wait,.-wait

	/* Exception and Interrupt Handlers */
	.weak   ExceptionHandler
	.set	ExceptionHandler,DefaultHandler
ExceptionCommon:
	mrs	r1,msp
	mrs	r2,primask
	bl	ExceptionHandler
	/* if return, fall thru */
	.thumb_func
	.type   DefaultHandler,%function
DefaultHandler:
	b       .
	.size   DefaultHandler,.-DefaultHandler

	.macro  Exception,name,irq
	.thumb_func
\name:	movs	r0,#\irq
	b	ExceptionCommon
	.endm

	.macro	Interrupt,name
	.weak	\name
	.set	\name,DefaultHandler
	.endm

	Exception _nmi,2
	Exception _hardFault,3
	Exception _memManage,4
	Exception _busFault,5
	Exception _usageFault,6

	Interrupt _svc
	Interrupt _debug
	Interrupt _pendSV
	Interrupt SYSTICK_IRQ

	Interrupt WDT_IRQ
	Interrupt TIMER0_IRQ
	Interrupt TIMER1_IRQ
	Interrupt TIMER2_IRQ
	Interrupt TIMER3_IRQ
	Interrupt UART0_IRQ
	Interrupt UART1_IRQ
	Interrupt UART2_IRQ
	Interrupt UART3_IRQ
	Interrupt PWM1_IRQ
	Interrupt I2C0_IRQ
	Interrupt I2C1_IRQ
	Interrupt I2C2_IRQ
	Interrupt SPI_IRQ
	Interrupt SSP0_IRQ
	Interrupt SSP1_IRQ
	Interrupt PLL0_IRQ
	Interrupt RTC_IRQ
	Interrupt EINT0_IRQ
	Interrupt EINT1_IRQ
	Interrupt EINT2_IRQ
	Interrupt EINT3_IRQ
	Interrupt ADC_IRQ
	Interrupt BOD_IRQ
	Interrupt USB_IRQ
	Interrupt CAN_IRQ
	Interrupt DMA_IRQ
	Interrupt I2S_IRQ
	Interrupt ENET_IRQ
	Interrupt RIT_IRQ
	Interrupt MCPWM_IRQ
	Interrupt QEI_IRQ
	Interrupt PLL1_IRQ

