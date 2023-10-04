{ config, lib, modulesPath, ... }:

{
  imports = [ 
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    initrd = {
      availableKernelModules = [ "ahci" "xhci_pci" "usb_storage" "sd_mod" "sr_mod" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    supportedFilesystems = [ "zfs" ];
    zfs = {
      extraPools = [ ];
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
