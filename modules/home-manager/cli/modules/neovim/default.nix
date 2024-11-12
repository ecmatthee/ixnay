{ lib, ... }:

{
  imports = [
    ./modules/nixcats.nix
  ];

  home.sessionVariables = {
    EDITOR = lib.mkOverride 900 "nvim";
    VISUAL = lib.mkOverride 900 "nvim";
  };
}
