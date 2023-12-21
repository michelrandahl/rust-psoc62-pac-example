#![no_std]
#![no_main]

use panic_halt as _;
use cortex_m_rt::entry;
use rust_psoc62_pac::Peripherals;
use embedded_hal::prelude::*;
use cortex_m::peripheral::syst::SystClkSource;

#[entry]
fn main() -> ! {
    let mut cp = cortex_m::Peripherals::take().unwrap();
    cp.SYST.set_clock_source(SystClkSource::Core);

    let peripherals = unsafe { Peripherals::steal() };
    let gpio = peripherals.GPIO;
    let port13 = gpio.prt(13);
    let port13_reg = port13.cfg();
    let clr = port13.out_clr();
    let out_set = port13.out_set();

    // into strong output
    port13_reg.modify(|_, w| unsafe { w.drive_mode7().bits(6) } );

    loop {
        // set pin to low (the LED is lit when the pin is low)
        clr.write(|w| unsafe { w.bits(1 << 7) });

        for _ in 0..1_000_00 {
            cortex_m::asm::nop();
        }

        // set pin to high (turn LED off)
        out_set.write(|w| unsafe { w.bits(1 << 7) });

        for _ in 0..1_000_00 {
            cortex_m::asm::nop();
        }

        continue;
    }
}
