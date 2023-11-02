{
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
