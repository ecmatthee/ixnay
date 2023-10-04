{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pv
  ];
}
