OUTPUT_FORMAT ("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
ENTRY(_start)
SEARCH_DIR(.)

MEMORY
{
  rom (rx)  : ORIGIN = 0x00000000, LENGTH = 512K
  ram (rwx) : ORIGIN = 0x10000000, LENGTH =  32K
  ahbram0   : ORIGIN = 0x2007c000, LENGTH =  16K
  ahbram1   : ORIGIN = 0x20080000, LENGTH =  16K
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
    .ethram :
    {
	_ethram = .;
    } >ahbram0
    .usbram :
    {
	_usbram = .;
    } >ahbram1
}
