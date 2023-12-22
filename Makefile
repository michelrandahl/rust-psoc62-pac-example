build-m0:
	cargo build --target=thumbv6m-none-eabi

build-m4:
	cargo build --target=thumbv7em-none-eabihf

run-m0:
	cargo run --target=thumbv6m-none-eabi

run-m4:
	cargo run --target=thumbv7em-none-eabihf
