ESLC=   eslc
ARCH=	-mcortex-m3
INC=	-I.. -I../.. -I../../.. -I../../.. -I../../../.. \
	-I../../../../net -I../../../../net/phy \
	-I../../../../net/ipv4  -I../../../../net/ipv6 \
	-I../../../../net/wpan \
	-I../../../../display -I../../../../display/fonts \
	-I../../../../sensors \
	-I../../../../usb \
	-I../../../../usb/device/hid \
	-I../../../../usb/host \
	-I../../../../fs -I../../../../crc
DBG=
OPT=	-i	# disable inlining
AS=	arm-as -mcpu=cortex-m3
LD=	arm-ld
OBJCOPY=arm-objcopy
OBJDUMP=arm-objdump
NM=	arm-nm
LIB= 	../../lib/lib.a

# keep intermediate files, for now
.PRECIOUS: %.out %.s %.ll

%.dis: %.out
	$(OBJDUMP) -d $< >$@

%.map: %.out
	$(NM) -n $< >$@

%.bin: %.out
	$(OBJCOPY) -I elf32-littlearm -O binary $< $@

%.out: %.o startup.o mem.o $(LIB)
	$(LD) -T ../cc2538.ld startup.o $<  mem.o $(LIB) -o $@

%.o: %.s
	$(AS) -o $@ $<

%.s: %.esl
	$(ESLC) $(ARCH) $(DBG) $(INC) $(OPT) $< >$@

%.ll: %.esl
	$(ESLC) -c $(ARCH) $(DBG) $(INC) $(OPT) $<

%.dep: %.esl
	$(ESLC) -M $(ARCH) $(DBG) $(INC) $(OPT) $<

all:	test-uart.out test-lcd.out

startup.o: ../startup.S
	$(AS) -o startup.o ../startup.S

mem.o:	../../../mem_ff.esl
	$(ESLC) $(ARCH) $(DBG) $(OPT) $<
	$(AS) -o $@ mem_ff.s

clean:
	rm -f *.bin *.out *.o *.s *.ll *.map *.dis

