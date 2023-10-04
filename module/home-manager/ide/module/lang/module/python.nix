{pkgs, ...}:

{
  home.packages = with pkgs; [
    python311
    nodePackages_latest.pyright
  ];
}
