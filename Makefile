NAME = GBCTV
PADVAL = 0

RGBASM = rgbasm
RGBLINK = rgblink
RGBFIX = rgbfix

RM_F = rm -f

ASFLAGS =
LDFLAGS = -t -w -n gbctv.sym
FIXFLAGS = -v -p $(PADVAL) -t $(NAME) -C -m 0x1b -r 0x04

gbctv.gb: gbctv.o
	$(RGBLINK) $(LDFLAGS) -o $@ $^
	$(RGBFIX) $(FIXFLAGS) $@

gbctv.o: src/main.asm
	$(RGBASM) $(ASFLAGS) -o $@ $<

.PHONY: clean
clean:
	$(RM_F) gbctv.o gbctv.gb