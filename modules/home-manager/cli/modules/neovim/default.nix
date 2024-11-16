{ lib, ... }:

{
  imports = [
    ./modules/nixcats.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
