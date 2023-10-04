{pkgs, ...}:

{
  home.packages = with pkgs; [
    libiconv
    pkg-config
    (with fenix; with stable; combine [
      cargo
      clippy
      rust-src
      rustc
      rustfmt
      targets.wasm32-unknown-unknown.stable.rust-std
    ])
    #rust-analyzer-nightly
    rust-analyzer
    cargo-audit
    cargo-semver-checks
    bacon
    #perseus-cli
  ];
}
