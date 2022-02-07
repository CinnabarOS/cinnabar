#include "uart.h"
#include "core.h"

struct uart_regs {
	union {
		uint8_t thr;
		const uint8_t rbr;
		uint8_t dll;
	};
	union {
		uint8_t ier;
		uint8_t dlh;
	};
	union {
		const uint8_t iir;
		uint8_t fcr;
	};
	uint8_t lcr;
	uint8_t mcr;
	const uint8_t lsr;
	const uint8_t msr;
	uint8_t sr;
};

volatile struct uart_regs*const uart0 = (struct uart_regs*)MEM_UART;

int init_uart(void) {
    // uart0->ier = 0b0000;
	// uart0->lcr = 0b10000000;
	// uart0->dll = 0x01;
	// uart0->dlh = 0x00;
	// uart0->lcr = 0b00000011;
	// uart0->fcr = 0b11000111;
	// uart0->mcr = 0b00001011;
	// uart0->mcr = 0b00011110;
	// uart0->thr = 0xae;
	// if (uart0->rbr != 0xae) return 1;
	// uart0->mcr = 0b00001111;
	return 0;
}

int uart_tx_empty(void) {
	return uart0->lsr & 0x20;
}

int uart_rx_state(void) {
	return uart0->lsr & 0x1;
}

void tx_uart(char msg) {
	// while (uart_tx_empty() == 0);
	uart0->thr = msg;
}

char rx_uart(void) {
	// while (uart_rx_state() == 0);
	return uart0->rbr;
}
