/* Define entry point for the program */
ENTRY(Reset_Handler)

/* Define available memory spaces and their RWX attributes */
/* External ram is excluded though is present on the STM32F469Discovery board */
MEMORY
{
    FLASH (rx) : ORIGIN =0x08000000, LENGTH =2048K
    SRAM (rwx) : ORIGIN =0x20000000, LENGTH =320K
}

/* Define how to map input sections to output sections */
SECTIONS
{
    /* Read directrly from flash */
    /* Vector table, code, Read-Only data (Constants) */
    .text :
    {
        *(.isr_vectors)
        *(.text)
        *(.rodata)
        _etext = .;
    } > FLASH

    /* Initialized static data (Copied to RAM at startup) */
    .data :
    {
        _sdata = .;
        *(.data)
        _edata = .;
    } > SRAM AT> FLASH

    /* Uninitialized static data */
    .bss :
    {
        _sbss = .;
        *(.bss)
        *(COMMON)
        _ebss = .;
    } > SRAM
}