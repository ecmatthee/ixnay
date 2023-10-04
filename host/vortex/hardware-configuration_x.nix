{ config, lib, modulesPath, ... }:

{
  imports = [ 
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

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
      extraPools = [  ];
      forceImportRoot = false;
    };
    postDeviceCommands = lib.mkAfter ''
      zfs rollback -r rpool/enc/impermanence/root@blank
    ''; 
    #zfs rollback -r rpool/enc//home@blank
  };

  fileSystems."/" = { 
    device = "rpool/enc/impermanence/root";
    fsType = "zfs";
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-label/NIXBOOT";
    fsType = "vfat";
  };

  fileSystems."/home" = { 
    device = "rpool/enc/impermanence/home";
    fsType = "zfs";
  };

  fileSystems."/nix" = { 
    device = "rpool/enc/nix";
    fsType = "zfs";
  };

  fileSystems."/persist" = { 
    device = "rpool/enc/persist";
    fsType = "zfs";
  };

  fileSystems."/persist/system" = { 
    device = "rpool/enc/persist/system";
    fsType = "zfs";
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
