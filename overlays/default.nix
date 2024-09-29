final: prev:
let
  overlays = [
    (import ./modules/hakuneko-nightly.nix)
  ];
in
prev.lib.composeManyExtensions overlays final prev
