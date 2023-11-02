{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # TODO Config File
    tutanota-desktop
  ];
}
