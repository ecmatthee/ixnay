{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # TODO Config File
    libreoffice-qt
    hunspell
  ];
}
