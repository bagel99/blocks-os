ESLC=   eslc
ARCH=	-mcortex-m3
INC=	-I.. -I../.. -I../../.. -I../../.. -I../../../.. \
	-I../../../../net -I../../../../net/phy \
	-I../../../../net/ipv4  -I../../../../net/ipv6 \
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
NM=	arm-nm
LIBDIR= ../../../../../esl-code/lib/arch/cm3
LIBOBJ= memset.o memcpy.o memcmp.o mem.o

# keep intermediate files, for now
.PRECIOUS: %.elf %.s %.ll

%.map: %.elf
	$(NM) -n $< >$@

%.bin: %.elf
	$(OBJCOPY) -I elf32-littlearm -O binary $< $@

%.elf: %.o startup.o $(LIBOBJ)
	$(LD) -T ../lpc17xx.ld startup.o $<  $(LIBOBJ) -o $@

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
	test-lcd.bin test-colorled.bin test-adc.bin test-speaker.bin \
	test-accel.bin test-usbhost.bin
#	test-hid.elf test-sdcard.elf test-msc.elf

startup.o: ../startup.S
	$(AS) -o startup.o ../startup.S

mem.o:	../../../mem_ff.esl
	$(ESLC) $(ARCH) $(DBG) $(OPT) $<
	$(AS) -o $@ mem_ff.s

memset.o: $(LIBDIR)/memset.S
	$(AS) -o memset.o $(LIBDIR)/memset.S

memcpy.o: $(LIBDIR)/memcpy.S
	$(AS) -o memcpy.o $(LIBDIR)/memcpy.S

memcmp.o: $(LIBDIR)/memcmp.S
	$(AS) -o memcmp.o $(LIBDIR)/memcmp.S

clean:
	rm -f *.bin *.elf *.o *.s *.ll

