{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hugin
  ];
}
