{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      pinentry-curses
      pinentry-gtk2
    ];
  };

  programs = {
    gnupg = {
      agent = {
        enable = true;
        pinentryFlavor = "gtk2";
      };
    };
  };
}
