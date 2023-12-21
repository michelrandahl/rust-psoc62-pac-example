/*
MEMORY
{
  FLASH (rx)  : ORIGIN = 0x10000100, LENGTH = 2M
  RAM   (rwx) : ORIGIN = 0x08000000, LENGTH = 1M
}
*/

MEMORY
{
  /* Allocate the second 1 MB of flash to M0+ */
  FLASH (rx)  : ORIGIN = 0x10100000, LENGTH = 1M
  /* Allocate the second 512 KB of SRAM to M0+ */
  RAM   (rwx) : ORIGIN = 0x08080000, LENGTH = 512K
}
