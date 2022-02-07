.POSIX:

TRIPLE=riscv64-unknown-none-elf

MAKEENV= \
		TRIPLE="$(TRIPLE)" \
		CC="clang -std=c99 -ffreestanding -Wall -O2 -target $(TRIPLE)" \
		LD="ld.lld -nostdlib" \
		AR="llvm-ar" \
		OBJCOPY="llvm-objcopy" \
		OBJDUMP="llvm-objdump" \
		RANLIB="llvm-ranlib" \
		SIZE="llvm-size" \
		STRIP="llvm-strip" 

COMPONENTS= \
		sys/boot

FILES= \
		sys/boot/boot.elf

all: components copy

components:
	cd sys/boot; $(MAKE) $(MAKEENV)

copy:

clean:
	cd sys/boot; $(MAKE) $(MAKEENV) clean

