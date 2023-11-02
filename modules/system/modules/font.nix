{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      nerdfonts
      noto-fonts
      noto-fonts-extra
      noto-fonts-cjk
      noto-fonts-emoji
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Dejavu Serif" ];
        sansSerif = [ "Dejavu Sans" ];
        monospace = [ "DejaVuSansM Nerd Font Mono" ];
      };
    };
  };
}
