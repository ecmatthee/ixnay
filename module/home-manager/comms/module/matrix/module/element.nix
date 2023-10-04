{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # TODO Config File
    element-desktop
  ];
}
