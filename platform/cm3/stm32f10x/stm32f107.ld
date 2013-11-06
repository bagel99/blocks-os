OUTPUT_FORMAT ("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
ENTRY(_start)
SEARCH_DIR(.)

MEMORY
{
  rom (rx)  : ORIGIN = 0x08000000, LENGTH = 256K
  ram (rwx) : ORIGIN = 0x20000000, LENGTH =  64K
}


SECTIONS
{
    .text :
    {
	*(.vectors)
	*(.text*)
	*(.rodata*)
	*(.data.rel.ro.local)
    } > rom
    . = ALIGN (8);
    _etext = .;
    .data :
    {
	_data = .;
	*(.data*)
	. = ALIGN (8);
	_edata = .;
    } >ram AT>rom
    .bss :
    {
	_bss = .;
	*(.bss*)
	*(COMMON)
	. = ALIGN (8);
	_end = .;
    } >ram

