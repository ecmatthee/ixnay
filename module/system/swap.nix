{
  boot = {
    kernel = {
      sysctl = { 
        "vm.swappiness" = 180; # Default 60
        "vm.watermark_boost_factor" = 0; # Default 15000
        "vm.watermark_scale_factor" = 125; # Default 10
        "vm.page-cluster" = 0; # Default 3
      };
    };
  };

  zramSwap = {
    enable = true;
    #writebackDevice = "/dev/disk/by-partlabel/zramwbd";
    algorithm = "zstd";
    memoryPercent = 50;
  };

  swapDevices = [ ];
}
