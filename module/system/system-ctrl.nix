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
    #cpuFreqGovernor = "performance";
    #cpuFreqGovernor = "powersave";
    powertop.enable = true;
  };

  services = {
    thermald = {
      enable = true;
    };
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
           governor = "powersave";
           turbo = "never";
        };
        charger = {
           governor = "performance";
           turbo = "auto";
        };
      };
    };
  };
}
