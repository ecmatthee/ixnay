{pkgs, ...}:

{
  home.packages = with pkgs; [
    shellcheck
    nodePackages.bash-language-server
  ];
}
