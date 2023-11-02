{ config, ... }:


{
  boot.kernelModules = [
    "i2c-dev"
    (if config.hardware.cpu.intel.updateMicrocode then "i2c-i801" else if config.hardware.cpu.amd.updateMicrocode then "i2c-piix4" else "")
    ""
  ];

  hardware.i2c.enable = true;

  services = {
    hardware = {
      openrgb = {
        enable = true;
      };
    };
  };
}
