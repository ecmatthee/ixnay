{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      pulsemixer
    ];
  };

  sound.enable = false;

  services = {
    pipewire = {
      enable = true;
      wireplumber.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        #xdg-desktop-portal-gtk
      ];
    };
  };
}
