.POSIX:

CFLAGS=-Iplatform/$(TRIPLE)/
LDFLAGS=

include platform/$(TRIPLE)/opts.mk

OBJS= platform/$(TRIPLE)/boot.o main.o uart.o io.o

.PRECIOUS:
.SUFFIXES: .c .h .S .s .o

all: Makefile boot.elf
clean:
	$(RM) boot.bin boot.elf $(OBJS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@
.S.o:
	$(CC) $(CFLAGS) -c $< -o $@

boot.bin: boot.elf
	$(OBJCOPY) -Obinary -R .stack -R .heap -R .bss -R .data $< $@

boot.elf: platform/$(TRIPLE)/boot.ld $(OBJS)
	$(LD) $(LDFLAGS) -T$< $(OBJS) -o $@

platform/$(TRIPLE)/boot.o: platform/$(TRIPLE)/boot.S
main.o: main.c io.h uart.h
uart.o: uart.c uart.h core.h
io.o: io.c io.h uart.h

