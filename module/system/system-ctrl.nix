{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      smartmontools
      brightnessctl
    ];
  };

  powerManagement = {
    enable = true;
    #cpuFreqGovernor = "performance";
    #cpuFreqGovernor = "powersave";
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
