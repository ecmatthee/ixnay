{ config, lib, modulesPath, inputs, ... }:

{
  imports = [ 
    (modulesPath + "/installer/scan/not-detected.nix")

    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  hardware = {
    enableAllFirmware = false;
    enableRedistributableFirmware = true;
  };

  # TODO Remove unneeded kernel modules

  boot = {
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    supportedFilesystems = [ "zfs" ];
    zfs = {
      extraPools = [ "pi" ];
      forceImportRoot = false;
    };
    #postDeviceCommands = lib.mkAfter ''
    #  zfs rollback -r rpool/enc/impermanence/root@blank
    #''; 
    #zfs rollback -r rpool/enc//home@blank
  };


  fileSystems."/" = { 
    device = "/dev/disk/by-label/nix";
    fsType = "ext4";
  };

  #fileSystems."/" = { 
  #  device = "none";
  #  fsType = "tmpfs";
  #  options = [ "defaults" "size=2G" "mode=755" ];
  #};

  fileSystems."/boot" = { 
    device = "/dev/disk/by-label/NIXBOOT";
    fsType = "vfat";
  };

  #fileSystems."/nix" = { 
  #  device = "/dev/disk/by-label/nix";
  #  fsType = "ext4";
  #};

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
