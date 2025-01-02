# Compiler and Tools
CC = gcc
AS = nasm
LD = ld

# Directories
KERNEL_DIR = kernel
BOOTLOADER_DIR = bootloader
BUILD_DIR = build
BIN_DIR = bin

# Files
KERNEL_SRC = $(wildcard $(KERNEL_DIR)/*.c)
KERNEL_OBJ = $(KERNEL_SRC:$(KERNEL_DIR)/%.c=$(BUILD_DIR)/%.o)
BOOTLOADER_SRC = $(BOOTLOADER_DIR)/bootloader.asm
BOOTLOADER_OBJ = $(BUILD_DIR)/bootloader.o
OS_NAME = DanhOS

# Flags
CFLAGS = -Wall -Wextra -O2 -ffreestanding -fno-pic -I$(KERNEL_DIR)
LDFLAGS = -T linker.ld -nostdlib -ffreestanding -O2

# Default target
all: $(BIN_DIR)/$(OS_NAME).bin

# Compile C source files into object files
$(BUILD_DIR)/%.o: $(KERNEL_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@
	@echo "Compiled $<"

$(BUILD_DIR)/bootloader.o: $(BOOTLOADER_SRC)
	@mkdir -p $(BUILD_DIR)
	$(AS) -f elf32 $< -o $@
	@echo "Assembled bootloader"

# Link everything into a final OS binary
$(BIN_DIR)/$(OS_NAME).bin: $(KERNEL_OBJ) $(BOOTLOADER_OBJ)
	@mkdir -p $(BIN_DIR)
	$(LD) $(LDFLAGS) $(KERNEL_OBJ) $(BOOTLOADER_OBJ) -o $(BIN_DIR)/$(OS_NAME).bin
	@echo "Linking complete"

# Clean up build and bin directories
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)
	@echo "Cleaned up"

# Run the OS using QEMU (you can replace this with any emulator)
run: $(BIN_DIR)/$(OS_NAME).bin
	qemu-system-x86_64 -drive format=raw,file=$(BIN_DIR)/$(OS_NAME).bin
