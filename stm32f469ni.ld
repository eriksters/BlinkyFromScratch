ENTRY(Reset_Handler)

MEMORY
{
    FLASH (rx) : ORIGIN =0x08000000, LENGTH =2048K
    SRAM (rwx) : ORIGIN =0x20000000, LENGTH =320K
}

SECTIONS
{
    .text :
    {
        *(.isr_vectors)
        *(.text)
        *(.rodata)
    } > FLASH

    .data :
    {
        *(.data)
    } > SRAM AT> FLASH

    .bss :
    {
        *(.bss)
    } > SRAM
}