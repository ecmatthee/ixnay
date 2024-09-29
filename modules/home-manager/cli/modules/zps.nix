{ pkgs, ...}:

{
  home.packages = with pkgs; [
    zps
  ];
}
