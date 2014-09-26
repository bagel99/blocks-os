ESLC=   eslc
ARCH=	-mcortex-m3
INC=	-I.. -I../.. -I../../.. -I../../.. -I../../../.. \
	-I../../../../net -I../../../../net/phy \
	-I../../../../net/ipv4  -I../../../../net/ipv6 \
	-I../../../../usb -I../../../../fs -I../../../../crc \
	-I../../../../usb/device/hid \
	-I../../../../usb/device/msc
#	-I../../../../fs

DBG=
OPT=	-i	# disable inlining
AS=	arm-as -mcpu=cortex-m3
LD=	arm-ld
OBJCOPY=arm-objcopy
OBJDUMP=arm-objdump
NM=	arm-nm
LIBDIR= ../../../../../esl-code/lib/arch/cm3
LIBOBJ= memset.o memcpy.o memcmp.o mem.o

# keep intermediate files, for now
.PRECIOUS: %.elf %.s %.ll

%.dis: %.elf
	$(OBJDUMP) -d $< >$@

%.map: %.elf
	$(NM) -n $< >$@

%.bin: %.elf
	$(OBJCOPY) -I elf32-littlearm -O binary $< $@

%.elf: %.o startup.o $(LIBOBJ)
	$(LD) -T ../stm32f107.ld startup.o $<  $(LIBOBJ) -o $@

%.o: %.s
	$(AS) -o $@ $<

%.s: %.esl
	$(ESLC) $(ARCH) $(DBG) $(INC) $(OPT) $< >$@

%.ll: %.esl
	$(ESLC) -c $(ARCH) $(DBG) $(INC) $(OPT) $<

%.dep: %.esl
	$(ESLC) -M $(ARCH) $(DBG) $(INC) $(OPT) $<

all:	test-blink42.elf test-inet.elf \
	test-udp.elf test-tcp.elf test-http.elf \
	test-hid.elf test-mouse.elf test-joystick.elf \
	test-sdcard.elf test-msc.elf

startup.o: ../startup.S
	$(AS) -o startup.o ../startup.S

memset.o: $(LIBDIR)/memset.S
	$(AS) -o memset.o $(LIBDIR)/memset.S

memcpy.o: $(LIBDIR)/memcpy.S
	$(AS) -o memcpy.o $(LIBDIR)/memcpy.S

memcmp.o: $(LIBDIR)/memcmp.S
	$(AS) -o memcmp.o $(LIBDIR)/memcmp.S

mem.o:	../../../mem_ff.esl
	$(ESLC) $(ARCH) $(DBG) $(OPT) $<
	$(AS) -o $@ mem_ff.s

clean:
	rm -f *.bin *.elf *.o *.s *.ll *.map *.dis

