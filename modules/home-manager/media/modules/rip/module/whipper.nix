{ pkgs, ... }:

{
  home.packages = with pkgs; [
    whipper
  ];
}
