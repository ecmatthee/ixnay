{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # TODO Config File
    webcord-vencord
  ];
}
