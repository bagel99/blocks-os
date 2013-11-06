ESLC=   eslc
ARCH=	-mcortex-m4
INC=	-I.. -I../.. -I../../.. -I../../../.. \
	-I../../../../net -I../../../../net/inet -I../../../../net/phy \
	-I../../../../net/inet/ipv4  -I../../../../net/inet/ipv6 \
	-I../../../../usb -I../../../../fs -I../../../../crc \
	-I../../../../usb/device/hid
#	-I../../../../fs

DBG=
OPT=	-i	# disable inlining
AS=	arm-as -mcpu=cortex-m4
LD=	arm-ld
OBJCOPY=arm-objcopy
OBJDUMP=arm-objdump -Mforce-thumb
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

%.elf: %.o startup.o $(LIBOBJ) mem.o
	$(LD) -T ../stm32f303.ld startup.o $<  $(LIBOBJ) -o $@

%.o: %.s
	$(AS) -o $@ $<

%.s: %.esl
	$(ESLC) $(ARCH) $(DBG) $(INC) $(OPT) $< >$@

%.ll: %.esl
	$(ESLC) -c $(ARCH) $(DBG) $(INC) $(OPT) $<

%.dep: %.esl
	$(ESLC) -M $(ARCH) $(DBG) $(INC) $(OPT) $<

all:	demo.elf

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
	rm -f *.bin *.elf *.o *.s *.ll

