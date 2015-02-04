	.syntax	unified
	.cpu	cortex-m3
	.eabi_attribute 5, "Cortex-M3"
	.eabi_attribute 6, 10	/* CPU_arch = v7 */
	.eabi_attribute 7, 77	/* CPU_arch_profile = M */
	.eabi_attribute	9, 2	/* THUMB_ISA_use = thumb32 */
	.eabi_attribute 18, 4	/* ABI_PCS_wchar_t = 4 bytes */
	.eabi_attribute	24, 1	/* ABI_align_needed = 8-byte */
	.eabi_attribute	25, 1	/* ABI_align_preserved = 8-byte */
	.eabi_attribute 26, 1	/* ABI_enum_size = smallest */

	.section ".vectors"
	.globl  __vectors
	.type   __vectors,%object

__vectors:
	.long   0x20008000		/*  0: Top of Stack		*/
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
	.long	GPIOA_IRQ		/* 16 GPIO Port A		*/
	.long	GPIOB_IRQ		/* 17 GPIO Port B		*/
	.long	GPIOC_IRQ		/* 18 GPIO Port C		*/
	.long	GPIOD_IRQ		/* 19 GPIO Port D		*/
	.long   UNKNOWN_IRQ		/* 20 Reserved			*/
	.long	UART0_IRQ		/* 21 UART0 Rx and Tx		*/
	.long	UART1_IRQ		/* 22 UART1 Rx and Tx		*/
	.long	SSIO_IRQ		/* 23 SSI0 Rx and Tx		*/
	.long	I2C_IRQ			/* 24 I2C Master and Slave	*/
	.long   UNKNOWN_IRQ		/* 25 Reserved			*/
	.long   UNKNOWN_IRQ		/* 26 Reserved			*/
	.long   UNKNOWN_IRQ		/* 27 Reserved			*/
	.long   UNKNOWN_IRQ		/* 28 Reserved			*/
	.long   UNKNOWN_IRQ		/* 29 Reserved */
	.long   ADC_IRQ			/* 30 ADC Sequence 0 */
	.long   UNKNOWN_IRQ		/* 31 Reserved */
	.long   UNKNOWN_IRQ		/* 32 Reserved */
	.long   UNKNOWN_IRQ		/* 33 Reserved */
	.long   WDT_IRQ			/* 34 Watchdog timer, timer 0 */
	.long   TMR0A_IRQ		/* 35 Timer 0 subtimer A */
	.long   TMR0B_IRQ		/* 36 Timer 0 subtimer B */
	.long   TMR1A_IRQ		/* 37 Timer 1 subtimer A */
	.long   TMR1B_IRQ		/* 38 Timer 1 subtimer B */
	.long   TMR2A_IRQ		/* 39 Timer 2 subtimer A */
	.long   TMR2B_IRQ		/* 40 Timer 2 subtimer B */
	.long   ANAC_IRQ		/* 41 Analog Comparator 0 */
	.long   RF_IRQ			/* 42 RFCore Rx/Tx (Alternate) */
	.long   RFERR_IRQ		/* 43 RFCore Error (Alternate) */
	.long   SCTL_IRQ		/* 44 System Control */
	.long   FLASH_IRQ		/* 45 FLASH Control */
	.long   AES_IRQ			/* 46 AES (Alternate) */
	.long   PKA_IRQ			/* 47 PKA (Alternate) */
	.long   SMTMR_IRQ		/* 48 SM Timer (Alternate) */
	.long   MACTMR_IRQ		/* 49 MacTimer (Alternate) */
	.long   SSI1_IRQ		/* 50 SSI1 Rx and Tx */
	.long   TMR3A_IRQ		/* 51 Timer 3 subtimer A */
	.long   TMR3B_IRQ		/* 52 Timer 3 subtimer B */
	.long   UNKNOWN_IRQ		/* 53 Reserved */
	.long   UNKNOWN_IRQ		/* 54 Reserved */
	.long   UNKNOWN_IRQ		/* 55 Reserved */
	.long   UNKNOWN_IRQ		/* 56 Reserved */
	.long   UNKNOWN_IRQ		/* 57 Reserved */
	.long   UNKNOWN_IRQ		/* 58 Reserved */
	.long   UNKNOWN_IRQ		/* 59 Reserved */
	.long   UNKNOWN_IRQ		/* 60 Reserved */
	.long   UNKNOWN_IRQ		/* 61 Reserved */
	.long	UDMA_IRQ		/* 62 uDMA */
	.long	UDMAERR_IRQ		/* 63 uDMA Error */
	.long   UNKNOWN_IRQ		/* 64 */
	.long   UNKNOWN_IRQ		/* 65 */
	.long   UNKNOWN_IRQ		/* 66 */
	.long   UNKNOWN_IRQ		/* 67 */
	.long   UNKNOWN_IRQ		/* 68 */
	.long   UNKNOWN_IRQ		/* 69 */
	.long   UNKNOWN_IRQ		/* 70 */
	.long   UNKNOWN_IRQ		/* 71 */
	.long   UNKNOWN_IRQ		/* 72 */
 	.long   UNKNOWN_IRQ		/* 73 */
	.long   UNKNOWN_IRQ		/* 74 */
	.long   UNKNOWN_IRQ		/* 75 */
	.long   UNKNOWN_IRQ		/* 76 */
	.long   UNKNOWN_IRQ		/* 77 */
	.long   UNKNOWN_IRQ		/* 78 */
	.long   UNKNOWN_IRQ		/* 79 */
	.long   UNKNOWN_IRQ		/* 80 */
	.long   UNKNOWN_IRQ		/* 81 */
	.long   UNKNOWN_IRQ		/* 82 */
	.long   UNKNOWN_IRQ		/* 83 */
	.long   UNKNOWN_IRQ		/* 84 */
	.long   UNKNOWN_IRQ		/* 85 */
	.long   UNKNOWN_IRQ		/* 86 */
	.long   UNKNOWN_IRQ		/* 87 */
	.long   UNKNOWN_IRQ		/* 88 */
	.long   UNKNOWN_IRQ		/* 89 */
	.long   UNKNOWN_IRQ		/* 90 */
	.long   UNKNOWN_IRQ		/* 91 */
	.long   UNKNOWN_IRQ		/* 92 */
	.long   UNKNOWN_IRQ		/* 93 */
	.long   UNKNOWN_IRQ		/* 94 */
	.long   UNKNOWN_IRQ		/* 95 */
	.long   UNKNOWN_IRQ		/* 96 */
	.long   UNKNOWN_IRQ		/* 97 */
	.long   UNKNOWN_IRQ		/* 98 */
	.long   UNKNOWN_IRQ		/* 99 */
	.long   UNKNOWN_IRQ		/* 100 */
	.long   UNKNOWN_IRQ		/* 101 */
	.long   UNKNOWN_IRQ		/* 102 */
	.long   UNKNOWN_IRQ		/* 103 */
	.long   UNKNOWN_IRQ		/* 104 */
	.long   UNKNOWN_IRQ		/* 105 */
	.long   UNKNOWN_IRQ		/* 106 */
	.long   UNKNOWN_IRQ		/* 107 */
	.long   UNKNOWN_IRQ		/* 108 */
	.long   UNKNOWN_IRQ		/* 109 */
	.long   UNKNOWN_IRQ		/* 110 */
	.long   UNKNOWN_IRQ		/* 111 */
	.long   UNKNOWN_IRQ		/* 112 */
	.long   UNKNOWN_IRQ		/* 113 */
	.long   UNKNOWN_IRQ		/* 114 */
	.long   UNKNOWN_IRQ		/* 115 */
	.long   UNKNOWN_IRQ		/* 116 */
	.long   UNKNOWN_IRQ		/* 117 */
	.long   UNKNOWN_IRQ		/* 118 */
	.long   UNKNOWN_IRQ		/* 119 */
	.long   UNKNOWN_IRQ		/* 120 */
	.long   UNKNOWN_IRQ		/* 121 */
	.long   UNKNOWN_IRQ		/* 122 */
	.long   UNKNOWN_IRQ		/* 123 */
	.long   UNKNOWN_IRQ		/* 124 */
	.long   UNKNOWN_IRQ		/* 125 */
	.long   UNKNOWN_IRQ		/* 126 */
	.long   UNKNOWN_IRQ		/* 127 */
	.long   UNKNOWN_IRQ		/* 128 */
	.long   UNKNOWN_IRQ		/* 129 */
	.long   UNKNOWN_IRQ		/* 130 */
	.long   UNKNOWN_IRQ		/* 131 */
	.long   UNKNOWN_IRQ		/* 132 */
	.long   UNKNOWN_IRQ		/* 133 */
	.long   UNKNOWN_IRQ		/* 134 */
	.long   UNKNOWN_IRQ		/* 135 */
	.long   UNKNOWN_IRQ		/* 136 */
	.long   UNKNOWN_IRQ		/* 137 */
	.long   UNKNOWN_IRQ		/* 138 */
	.long   UNKNOWN_IRQ		/* 139 */
	.long   UNKNOWN_IRQ		/* 140 */
	.long   UNKNOWN_IRQ		/* 141 */
	.long   UNKNOWN_IRQ		/* 142 */
	.long   UNKNOWN_IRQ		/* 143 */
	.long   UNKNOWN_IRQ		/* 144 */
	.long   UNKNOWN_IRQ		/* 145 */
	.long   UNKNOWN_IRQ		/* 146 */
	.long   UNKNOWN_IRQ		/* 147 */
	.long   UNKNOWN_IRQ		/* 148 */
	.long   UNKNOWN_IRQ		/* 149 */
	.long   UNKNOWN_IRQ		/* 150 */
	.long   UNKNOWN_IRQ		/* 151 */
	.long   UNKNOWN_IRQ		/* 152 */
	.long   UNKNOWN_IRQ		/* 153 */
	.long   UNKNOWN_IRQ		/* 154 */
	.long   UNKNOWN_IRQ		/* 155 */
	.long	USB_IRQ			/* 156 USB */
	.long	RF_IRQ			/* 157 RFCORE RX/TX */
	.long	RFERR_IRQ		/* 158 RFCORE Error */
	.long	AES_IRQ			/* 159 AES */
	.long	PKA_IRQ			/* 160 PKA */
	.long	SMTMR			/* 161 SM Timer */
	.long	MACTMR			/* 162 MACTimer */

	.size   __vectors,.-__vectors

	.thumb

	/* Reset Handler */
	.section ".text"
	.thumb_func
	.globl  _start
	.type   _start,%function
_start:
	.fnstart
	movs	r0,#0xFF
	ldr	r1,sysctl
	str	r0,[r1]			/* not sure what this does */
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
sysctl:	.word	0x400d20b4
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
	.size	getsp,.-getsp


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
	Interrupt ADC_IRQ
	Interrupt AES_IRQ
	Interrupt ANAC_IRQ
	Interrupt FLASH_IRQ
	Interrupt GPIOA_IRQ
	Interrupt GPIOB_IRQ
	Interrupt GPIOC_IRQ
	Interrupt GPIOD_IRQ
	Interrupt I2C_IRQ
	Interrupt MACTMR
	Interrupt MACTMR_IRQ
	Interrupt PKA_IRQ
	Interrupt RFERR_IRQ
	Interrupt RF_IRQ
	Interrupt SCTL_IRQ
	Interrupt SMTMR
	Interrupt SMTMR_IRQ
	Interrupt SSI1_IRQ
	Interrupt SSIO_IRQ
	Interrupt STACK
	Interrupt TMR0A_IRQ
	Interrupt TMR0B_IRQ
	Interrupt TMR1A_IRQ
	Interrupt TMR1B_IRQ
	Interrupt TMR2A_IRQ
	Interrupt TMR2B_IRQ
	Interrupt TMR3A_IRQ
	Interrupt TMR3B_IRQ
	Interrupt UART0_IRQ
	Interrupt UART1_IRQ
	Interrupt UDMAERR_IRQ
	Interrupt UDMA_IRQ
	Interrupt USB_IRQ
	Interrupt WDT_IRQ

