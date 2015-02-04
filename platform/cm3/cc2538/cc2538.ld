
MEMORY
{
  flash (rx)  : ORIGIN = 0x00200000, LENGTH = 0x80000
  ram (rwx) : ORIGIN = 0x20000000, LENGTH = 0x8000
}

STACK = 0x20008000;

SECTIONS
{
    .text :
    {
	*(.vectors)
	*(.text*)
	*(.rodata*)
        . = ALIGN(4);
	_etext = .;
    } >flash
    /* DMA table must be 1024 aligned, so just put it at beginning of data */
    .dmadata(NOLOAD):
    {
	*(.dmatable)
    } >ram
    .data :
    {
	_data = .;
	*(.data*)
	. = ALIGN(4);
	_edata = .;
    } >ram AT>flash
    .bss :
    {
	_bss = .;
	*(.bss*)
	*(COMMON)
	. = ALIGN(4);
	_end = .;
    } >ram
    .ARM.exidx :
    {
        *(.ARM.exidx*)
    } >flash
}
