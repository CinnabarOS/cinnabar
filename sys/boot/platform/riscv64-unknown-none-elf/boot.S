.extern bmain

.section .text.bios
    la x1, _TEXT_START
    jr x1

.section .text.boot
.globl _start
_start:

    csrs mie, zero
    csrs sie, zero

    csrr t0, mhartid
    bne t0, zero, halt

    la sp, _STACK_TOP
    call bmain

halt:
    wfi
    j halt
