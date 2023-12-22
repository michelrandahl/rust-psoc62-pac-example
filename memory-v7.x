MEMORY
{
  /* Allocate the second 1 MB of flash to M4 */
  FLASH (rx)  : ORIGIN = 0x10100000, LENGTH = 1M
  /* Allocate the second 512 KB of SRAM to M4 */
  RAM   (rwx) : ORIGIN = 0x08080000, LENGTH = 512K
}
