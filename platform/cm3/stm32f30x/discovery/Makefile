ESLC=   eslc
ARCH=	-mcortex-m4
INC=	-I.. -I../.. -I../../.. -I../../../.. \
	-I../../../../net -I../../../../net/inet -I../../../../net/phy \
	-I../../../../net/inet/ipv4  -I../../../../net/inet/ipv6 \
	-I../../../../usb -I../../../../fs -I../../../../crc \
	-I../../../../sensors \
	-I../../../../usb/device/hid

DBG=
OPT=	-i	# disable inlining
AS=	arm-as -mcpu=cortex-m4
LD=	arm-ld
OBJCOPY=arm-objcopy
OBJDUMP=arm-objdump -Mforce-thumb
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

%.out: %.o startup.o $(LIBOBJ) mem.o
	$(LD) -T ../stm32f303.ld startup.o $<  mem.o $(LIB) -o $@

%.o: %.s
	$(AS) -o $@ $<

%.s: %.esl
	$(ESLC) $(ARCH) $(DBG) $(INC) $(OPT) $< >$@

%.ll: %.esl
	$(ESLC) -c $(ARCH) $(DBG) $(INC) $(OPT) $<

%.dep: %.esl
	$(ESLC) -M $(ARCH) $(DBG) $(INC) $(OPT) $<

all:	demo.out test-hid.out

startup.o: ../startup.S
	$(AS) -o startup.o ../startup.S

mem.o:	../../../mem_ff.esl
	$(ESLC) $(ARCH) $(DBG) $(OPT) $<
	$(AS) -o $@ mem_ff.s

clean:
	rm -f *.bin *.out *.o *.s *.ll *.map *.dis

