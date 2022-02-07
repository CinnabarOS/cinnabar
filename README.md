# Cinnabar OS
## Ver. `0.0.0-pre0`

A secure unix-like operating system with a microkernel for embedded applications. Designed for RISC-V.

Refer to `LICENSE` for copyright information. A free software license is planned.

## Roadmap
### **Pre-alpha `0.0.0-pre`**
All research and development until the software is usable according to it's project description.
### Alpha `1.0.0-a`
Development of major features for release according to community feedback.
### Beta `1.0.0-b`
Testing and major bug fixes before release.
### Release Candidates `1.0.0-rc`
Final beta versions with minor bug fixes to prepare for release. No new features are added.
### Release `1.0.0`
The final stable release.

## Contributing
This project is not currently open to contributions.

## Building
1. Use a unix-like environment and make sure the following are installed:
* LLVM >=13 and Clang
* BSD Make
* OpenSSL or LibreSSL
* Python >=3.6.8
2. Clone this repository.
3. Run `make` (or `bmake`) in the root of the project folder.

## Testing
Only the bootloader can be tested as of now. Install QEMU and run the following:\
```qemu-system-riscv64 -M virt -m 512M -smp 2 -bios sys/boot/boot.elf -monitor stdio -device virtio-scsi-pci```
