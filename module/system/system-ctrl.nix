{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      smartmontools
    ];
  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "performance";
  };

  services = {
    tlp = {
      enable = true;
    };
  };
}
