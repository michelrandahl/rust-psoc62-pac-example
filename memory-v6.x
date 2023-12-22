MEMORY
{
  /* Allocate the first 1 MB of flash to M0+ */
  FLASH (rx)  : ORIGIN = 0x10000000, LENGTH = 1M
  /* Allocate the first 512 KB of SRAM to M0+ */
  RAM   (rwx) : ORIGIN = 0x08000000, LENGTH = 512K
}
