ESLC=   eslc
ARCH=	x86_64
TOP=	../../..
LIBDIR=	$(TOP)/../esl-code/lib

INC=	-I.. -I../.. -I$(TOP) \
	-I$(TOP)/crc/ -I$(TOP)/crypto \
	-I$(LIBDIR)
DBG=
OPT=	-i	# disable inlining
GCC=	gcc
GCCARCH=

# keep intermediate files, for now
.SECONDARY: %.s %.ll

%.map: %.out
	nm -n $< >$@

%.dis: %.out
	objdump -d $< >$@

%.out: %.s
	$(GCC) $(GCCARCH) $< $(LIBDIR)/arch/$(ARCH)/linux/lib.a -o $@

%.s: %.esl
	$(ESLC) -m$(ARCH) $(DBG) $(INC) $(OPT) $< >$@

%.ll: %.esl
	$(ESLC) -m$(ARCH) $(DBG) $(INC) $(OPT) -c $<

all:	test-sha2.out test-sha3.out \
	test-aesccm.out test-aesgcm.out test-chacha.out \
	test-field.out test-ecdh.out test-ecdsa.out

clean:
	rm -f *.ll *.s *.o *.out *.dis *.map

