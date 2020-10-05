#include <stdint.h>

#define RCC_ADDR (0x40023800)

volatile uint32_t * RCC_AHB1_PERI_CLK_EN_REG = (uint32_t*) (RCC_ADDR + 0x30);

uint32_t RCC_Init = 0x1;

volatile uint32_t data1;
uint32_t data2;
uint32_t data3;
uint32_t data4;
uint32_t data5;
uint32_t dataArray[20];

int main() {
    
    *RCC_AHB1_PERI_CLK_EN_REG = RCC_Init;
    
    data1 = 20;
    data2 = data1 + 2;

    for (int i = 0; i < 20; i++) {
        dataArray[i] = i;
    }

    return 0;
}