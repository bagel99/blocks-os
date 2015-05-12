ESLC=   eslc
ARCH=	-mcortex-m3
INC=	-I.. -I../.. -I../../.. -I../../.. -I../../../.. \
	-I../../../../net -I../../../../net/phy \
	-I../../../../net/ipv4  -I../../../../net/ipv6 \
	-I../../../../net/wpan -I../../../../net/ppp \
	-I../../../../sensors \
	-I../../../../display -I../../../../display/fonts \
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
.PRECIOUS: %.elf %.s %.ll

%.dis: %.elf
	$(OBJDUMP) -d $< >$@

%.map: %.elf
	$(NM) -n $< >$@

%.bin: %.elf
	$(OBJCOPY) -I elf32-littlearm -O binary $< $@

%.elf: %.o startup.o mem.o $(LIB)
	$(LD) -T ../lpc17xx.ld startup.o $<  mem.o $(LIB) -o $@

%.o: %.s
	$(AS) -o $@ $<

%.s: %.esl
	$(ESLC) $(ARCH) $(DBG) $(INC) $(OPT) $< >$@

%.ll: %.esl
	$(ESLC) -c $(ARCH) $(DBG) $(INC) $(OPT) $<

%.dep: %.esl
	$(ESLC) -M $(ARCH) $(DBG) $(INC) $(OPT) $<

all:	test-timer.bin test-inet.bin \
	test-udp.bin test-tcp.bin \
	test-lcd.bin test-inet-lcd.bin \
	test-colorled.bin test-adc.bin test-speaker.bin \
	test-accel.bin test-usbhost.bin
#	test-hid.elf test-sdcard.elf test-msc.elf

startup.o: ../startup.S
	$(AS) -o startup.o ../startup.S

mem.o:	../../../mem_ff.esl
	$(ESLC) $(ARCH) $(DBG) $(OPT) $<
	$(AS) -o $@ mem_ff.s

clean:
	rm -f *.bin *.elf *.o *.s *.ll *.map *.dis

