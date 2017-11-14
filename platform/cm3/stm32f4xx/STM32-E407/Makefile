ESLC=   eslc
ARCH=	-mcortex-m4
INC=	-I.. -I../.. -I../../.. -I../../../.. \
	-I../../../../net -I../../../../net/phy \
	-I../../../../net/ipv4  -I../../../../net/ipv6 \
	-I../../../../usb -I../../../../fs -I../../../../crc \
	-I../../../../usb/device/hid \
	-I../../../../usb/device/msc \
	-I../../../../usb/host
#	-I../../../../fs

DBG=
OPT=	-i	# disable inlining
AS=	arm-none-eabi-as -mcpu=cortex-m4
LD=	arm-none-eabi-ld
OBJCOPY=arm-none-eabi-objcopy
OBJDUMP=arm-none-eabi-objdump
NM=	arm-none-eabi-nm
LIB= 	../../libm4/lib.a

# keep intermediate files, for now
.PRECIOUS: %.out %.s %.ll

%.dis: %.out
	$(OBJDUMP) -d $< >$@

%.map: %.out
	$(NM) -n $< >$@

%.bin: %.out
	$(OBJCOPY) -I elf32-littlearm -O binary $< $@

%.out: %.o startup.o mem.o $(LIB)
	$(LD) -T ../stm32f407.ld startup.o $<  mem.o $(LIB) -o $@

%.o: %.s
	$(AS) -o $@ $<

%.s: %.esl
	$(ESLC) $(ARCH) $(DBG) $(INC) $(OPT) $< >$@

%.ll: %.esl
	$(ESLC) -c $(ARCH) $(DBG) $(INC) $(OPT) $<

%.dep: %.esl
	$(ESLC) -M $(ARCH) $(DBG) $(INC) $(OPT) $<

all:	test-uart.out test-blink42.out test-inet.out \
	test-hid.out

startup.o: ../startup.S
	$(AS) -o startup.o ../startup.S

mem.o:	../../../mem_ff.esl
	$(ESLC) $(ARCH) $(DBG) $(OPT) $<
	$(AS) -o $@ mem_ff.s

clean:
	rm -f *.bin *.out *.o *.s *.ll *.map *.dis

