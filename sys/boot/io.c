#include "io.h"
#include "uart.h"

void print(const char *const msg) {
	for (int i = 0; msg[i] != 0; i++) {
		tx_uart(msg[i]);
	}
}