{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      hdparm
      smartmontools
    ];
  };

  services = {
    smartd = {
      enable = true;
      autodetect = true;
    };
  };
}
