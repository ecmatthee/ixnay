{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      brightnessctl
      hdparm
      smartmontools
    ];
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "ondemand";
  };

  services = {
    thermald = {
      enable = true;
    };
  };
}
