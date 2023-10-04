{pkgs, ...}:

{
  home.packages = with pkgs; [
    supercollider-with-plugins
  ];
}
