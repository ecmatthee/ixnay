{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kdenlive
    # TODO Glaxnimate 
    # Dependency for kdenlive vectorial animation plugin.
    # Adding package seems to fix behavior but error message remains.
    # Solution would see removal of explicit declaration of dependency.
    # https://github.com/NixOS/nixpkgs/issues/209923
    # glaxnimate
  ];
}
