SRC_DIR=source
BUILD_DIR=build
INC_DIR=include

TARGET=final.elf

C_SRC=$(wildcard $(SRC_DIR)/*.c)
OBJ=$(addprefix $(BUILD_DIR)/,$(notdir $(C_SRC:.c=.o)))

CC=arm-none-eabi-gcc
C_FLAGS=-c -mcpu=cortex-m4 -mthumb -Wall -g -I$(INC_DIR)
LDFLAGS=-nostdlib -T stm32f469ni.ld -g -Wl,-Map=$(BUILD_DIR)/final.map

$(BUILD_DIR)/$(TARGET): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(C_FLAGS) -o $@ $^

clean:
	rm $(BUILD_DIR)/*

help:
	@echo "Sources: $(C_SRC)"
	@echo "Obj: $(OBJ)"
