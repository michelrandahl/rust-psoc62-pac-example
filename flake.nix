# run `nix develop`
{
  description = "Rust on psoc62";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url  = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay)  ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        from-rust-toolchain-file = pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            openssl
            pkg-config
            #rust-bin.stable.latest.default
            from-rust-toolchain-file
            #rust-analyzer
            evcxr
            flip-link # Adds zero-cost stack overflow protection to your embedded programs
            probe-rs # (cargo-embed) can be used to flash binaries onto microcontrollers
            svd2rust
            openocd
            picocom
            gdb
            libusb
            cargo-binutils # tools for examining rust binaries (`cargo-size`, `cargo-strip`, `cargo-objdump`)
            probe-rs # (cargo-embed) can be used to flash binaries onto microcontrollers
            gcc-arm-embedded
          ];

          shellHook = ''
            cargo install form
            #cargo install rust-analyzer --git https://github.com/rust-analyzer/rust-analyzer --branch master
            export PATH="$HOME/.cargo/bin:$PATH"
            export PS1="[\e[1;32mNix-psoc62\e[0m] $PS1"
          '';
        };
      }
    );
}
