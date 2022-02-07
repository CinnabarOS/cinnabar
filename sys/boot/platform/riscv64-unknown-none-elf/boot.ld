ENTRY(_start)
_STACK_SIZE = 0x8000;
_HEAP_SIZE = 0x8000;
MEMORY
{
    rom : ORIGIN = 0x1000, LENGTH = 0xF000
    flash : ORIGIN = 0x20000000, LENGTH = 0x4000000
    ram : ORIGIN = 0x80000000, LENGTH = 512M
}
SECTIONS
{
    .text.bios : ALIGN(0) {
        *(.text.bios)
        . = ALIGN(0x10000);
    } > ram

    .text : ALIGN(16) {
        _TEXT_START = .;
        *(.text.boot)
        *(.text)
        *(.text*)
        _TEXT_END = .;
    } > flash
    .rodata : ALIGN(16) {
        _RODATA_START = .;
        *(.rodata)
        *(.rodata*)
        _RODATA_END = .;
    } > flash

    .data : ALIGN(16) {
        _DATA_START = .;
        *(.sdata*)
        *(.data*)
        _DATA_END = .;
    } > ram
    .bss : ALIGN(16) {
        _BSS_START = .;
        *(.bss*)
        _BSS_END = .;
    } > ram
    .heap : ALIGN(16) {
        _HEAP_BASE = .;
        _HEAP_TOP = .;
        . += _HEAP_SIZE;
    } > ram
    .stack : ALIGN(16) {
        . += _STACK_SIZE;
        _STACK_TOP = .;
        _STACK_BASE = .;
    } > ram
}
