AS=	arm-as -mcpu=cortex-m3
LD=	arm-ld

OBJS=	memset.o memcpy.o memcmp.o memlen.o

%.o: %.S
	$(AS) -o $@ $<

lib.a:	$(OBJS)
	$(AR) r lib.a $(OBJS)

clean:
	rm -f lib.a $(OBJS)

memset.o: memset.S
	$(AS) -o $@ $<

memcpy.o: memcpy.S
	$(AS) -o $@ $<

memcmp.o: memcmp.S
	$(AS) -o $@ $<

memlen.o: memlen.S
	$(AS) -o $@ $<

