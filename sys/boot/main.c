#include "io.h"
#include "uart.h"

void bmain(void) {
    init_uart();
    print("--- Bootloader ---\r\n");
    print("Hello, World!\r\n");
}