final: prev:
let
  overlays = [
    (import ./weechat.nix)
    #(import ./perseus-cli.nix)
  ];
in
prev.lib.composeManyExtensions overlays final prev
