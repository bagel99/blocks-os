	.syntax	unified
	.eabi_attribute	67, "2.09"
	.cpu	cortex-m4
	.fpu	fpv4-sp-d16
	.eabi_attribute	6, 10
	.eabi_attribute 27, 1
	.section ".vectors"
	.globl  __vectors
	.type   __vectors,%object

__vectors:
	.long   0x2000A000		/*  0: Top of Stack		*/
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
	.long   UNKNOWN_IRQ		/* 17/ 1: PVD			*/
	.long   UNKNOWN_IRQ		/* 18/ 2: Tamper		*/
	.long   RTC_IRQ			/* 19/ 3: Real Time Clock	*/
	.long   UNKNOWN_IRQ		/* 20/ 4: Flash			*/
	.long   RCC_IRQ			/* 21/ 5: Reset/Clock Control	*/
	.long   EINT0_IRQ		/* 22/ 6: External Interrupt 0	*/
	.long   EINT1_IRQ		/* 23/ 7: External Interrupt 1	*/
	.long   EINT2_IRQ		/* 24/ 8: External Interrupt 2	*/
	.long   EINT3_IRQ		/* 25/ 9: External Interrupt 3	*/
	.long   EINT4_IRQ		/* 26/10: External Interrupt 4	*/
	.long   UNKNOWN_IRQ		/* 27/11: DMA1 Stream0		*/
	.long   UNKNOWN_IRQ		/* 28/12: DMA1 Stream1		*/
	.long   UNKNOWN_IRQ		/* 29/13: DMA1 Stream2		*/
	.long   UNKNOWN_IRQ		/* 30/14: DMA1 Stream3		*/
	.long   UNKNOWN_IRQ		/* 31/15: DMA1 Stream4		*/
	.long   UNKNOWN_IRQ		/* 32/16: DMA1 Stream5		*/
	.long   UNKNOWN_IRQ		/* 33/17: DMA1 Stream6		*/
	.long   ADC_IRQ			/* 34/18: ADC1/2/3		*/
	.long   UNKNOWN_IRQ		/* 35/19: CAN1_TX		*/
	.long   UNKNOWN_IRQ		/* 36/20: CAN1_RX0		*/
	.long   UNKNOWN_IRQ		/* 37/21: CAN1_RX1		*/
	.long   UNKNOWN_IRQ		/* 38/22: CAN1_SCE		*/
	.long   EINT5_9_IRQ		/* 39/23: EXT INTR 5-9		*/
	.long   TIMER1_IRQ		/* 40/24: TIM1_BRK		*/
	.long   TIMER1_IRQ		/* 41/25: TIM1_UP		*/
	.long   TIMER1_IRQ		/* 42/26: TIM1_TRG_COM		*/
	.long   TIMER1_IRQ		/* 43/27: TIM1_CC		*/
	.long   TIMER2_IRQ		/* 44/28: TIM2			*/
	.long   TIMER3_IRQ		/* 45/29: TIM3			*/
	.long   TIMER4_IRQ		/* 46/30: TIM4			*/
	.long   UNKNOWN_IRQ		/* 47/31: I2C1_EV		*/
	.long   UNKNOWN_IRQ		/* 48/32: I2C1_ER		*/
	.long   UNKNOWN_IRQ		/* 49/33: I2C2_EV		*/
	.long   UNKNOWN_IRQ		/* 50/34: I2C2_ER		*/
	.long   SPI1_IRQ		/* 51/35: SPI1			*/
	.long   SPI2_IRQ		/* 52/36: SPI2			*/
	.long   UART1_IRQ		/* 53/37: USART1/EXTI		*/
	.long   UART2_IRQ		/* 54/38: USART2/EXTI		*/
	.long   UART3_IRQ		/* 55/39: USART3/EXTI		*/
	.long   EINT10_15_IRQ		/* 56/40: EXT INTR 10-15	*/
	.long   UNKNOWN_IRQ		/* 57/41: RTC Alarm		*/
	.long   UNKNOWN_IRQ		/* 58/42: USB_WKUP		*/
	.long   UNKNOWN_IRQ		/* 59/43: TIM8_BRK		*/
	.long   UNKNOWN_IRQ		/* 60/44: TIM8_UP		*/
	.long   UNKNOWN_IRQ		/* 61/45: TIM8_TRG_COM		*/
	.long   UNKNOWN_IRQ		/* 62/46: TIM8_CC		*/
	.long   UNKNOWN_IRQ		/* 63/47: DMA1 Stream7		*/
	.long   UNKNOWN_IRQ		/* 64/48: FSMC			*/
	.long   SDIO_IRQ		/* 65/49: SDIO			*/
	.long   UNKNOWN_IRQ		/* 66/50: TIM5			*/
	.long   SPI3_IRQ		/* 67/51: SPI3			*/
	.long   UART4_IRQ		/* 68/52: UART4			*/
	.long   UART5_IRQ		/* 69/53: UART5			*/
	.long   TIMER6_IRQ		/* 70/54: TIM6/DAC		*/
	.long   TIMER7_IRQ		/* 71/55: TIM7			*/
	.long   UNKNOWN_IRQ		/* 72/56: DMA2 Stream0		*/
	.long   UNKNOWN_IRQ		/* 73/57: DMA2 Stream1		*/
	.long   UNKNOWN_IRQ		/* 74/58: DMA2 Stream2		*/
	.long   UNKNOWN_IRQ		/* 75/59: DMA2 Stream3		*/
	.long   UNKNOWN_IRQ		/* 76/60: DMA2 Stream4		*/
	.long   ETH_IRQ			/* 77/61: ETH			*/
	.long   UNKNOWN_IRQ		/* 78/62: ETH_WKUP		*/
	.long   UNKNOWN_IRQ		/* 79/63: CAN2_TX		*/
	.long   UNKNOWN_IRQ		/* 80/64: CAN2_RX0		*/
	.long   UNKNOWN_IRQ		/* 81/65: CAN2_RX1		*/
	.long   UNKNOWN_IRQ		/* 82/66: CAN2_SCI		*/
	.long   OTGFS_IRQ		/* 83/67: OTG_FS		*/
	.long   UNKNOWN_IRQ		/* 84/68: DMA2 Stream5		*/
	.long   UNKNOWN_IRQ		/* 85/69: DMA2 Stream6		*/
	.long   UNKNOWN_IRQ		/* 86/70: DMA2 Stream7		*/
	.long   UNKNOWN_IRQ		/* 87/71: USART6		*/
	.long   UNKNOWN_IRQ		/* 88/72: I2C3_EV		*/
	.long   UNKNOWN_IRQ		/* 89/73: I2C3_ER		*/
	.long   UNKNOWN_IRQ		/* 90/74: USB_HS_EP1_OUT	*/
	.long   UNKNOWN_IRQ		/* 91/75: USB_HS_EP1_IN		*/
	.long   UNKNOWN_IRQ		/* 92/76: USB_HS_WKUP		*/
	.long   UNKNOWN_IRQ		/* 93/77: USB_HS		*/
	.long   UNKNOWN_IRQ		/* 94/78: DCMI			*/
	.long   UNKNOWN_IRQ		/* 95/79: CRYP			*/
	.long   UNKNOWN_IRQ		/* 96/80: HASH_RNG		*/
	.long   UNKNOWN_IRQ		/* 97/81: FPU			*/

	.size   __vectors,.-__vectors

	.thumb


	/* Reset Handler */
	.section ".text"
	.thumb_func
	.globl  _start
	.type   _start,%function
_start:
	.fnstart
	ldr	r0,=_etext
	ldr	r1,=_data
	ldr	r2,=_edata
	b.n	ctest
cdata:	ldr	r3,[r0],#4		/* copy up data segment */
	str	r3,[r1],#4
ctest:	cmp	r1,r2
	blt.n	cdata
	ldr	r2,=_end
	movs	r0,#0
	b.n	ztest
zbss:	str	r0,[r1],#4		/* zero bss segment r1=r2=_edata */
ztest:	cmp	r1,r2
	blt.n	zbss
	
	ldr     r0,=main
	blx     r0			/* call main */
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

	Interrupt UNKNOWN_IRQ
	Interrupt WDT_IRQ
	Interrupt TIMER1_IRQ
	Interrupt TIMER2_IRQ
	Interrupt TIMER3_IRQ
	Interrupt TIMER4_IRQ
	Interrupt TIMER6_IRQ
	Interrupt TIMER7_IRQ
	Interrupt UART0_IRQ
	Interrupt UART1_IRQ
	Interrupt UART2_IRQ
	Interrupt UART3_IRQ
	Interrupt UART4_IRQ
	Interrupt UART5_IRQ
	Interrupt PWM1_IRQ
	Interrupt I2C0_IRQ
	Interrupt I2C1_IRQ
	Interrupt I2C2_IRQ
	Interrupt SPI1_IRQ
	Interrupt SPI2_IRQ
	Interrupt SPI3_IRQ
	Interrupt RCC_IRQ
	Interrupt RTC_IRQ
	Interrupt EINT0_IRQ
	Interrupt EINT1_IRQ
	Interrupt EINT2_IRQ
	Interrupt EINT3_IRQ
	Interrupt EINT4_IRQ
	Interrupt EINT5_9_IRQ
	Interrupt EINT10_15_IRQ
	Interrupt ADC_IRQ
	Interrupt CAN_IRQ
	Interrupt DMA_IRQ
	Interrupt I2S_IRQ
	Interrupt SDIO_IRQ
	Interrupt ETH_IRQ
	Interrupt OTGFS_IRQ


