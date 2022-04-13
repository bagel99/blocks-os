ESLC=   eslc -X
ARCH=	x86_64
TOP=	../../..
LIBDIR=	$(TOP)/../esl-code/lib

INC=	-I.. -I../.. -I$(TOP) \
	-I$(TOP)/crc/ -I$(TOP)/crypto -I$(TOP)/net \
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
	test-aesccm.out test-aesgcm.out test-aescmac.out \
	test-chacha.out \
	test-ecdh.out test-ecdsa.out \
	test-field.out \
	test-c25599.out test-ed25519.out test-ed25519dsa.out

dtls:	test-dtls-psk.out test-dtls-aesccm.out test-dtls-ecjpake.out

clean:
	rm -f *.ll *.s *.o *.out *.dis *.map

