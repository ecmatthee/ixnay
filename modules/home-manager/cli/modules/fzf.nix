{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fd
  ];

  programs = {
    fzf = {
      enable = true;
      changeDirWidgetCommand = "fd --type d --hidden --no-follow --no-ignore";
      defaultCommand = "fd --type f --hidden --no-follow --no-ignore";
      fileWidgetCommand = "fd --type f --hidden --no-follow --no-ignore";
    };
  };
}
