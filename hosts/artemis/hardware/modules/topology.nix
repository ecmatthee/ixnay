{
  boot = {
    zfs = {
      extraPools = [ "pi" ];
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/nix";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-label/NIXBOOT";
      fsType = "vfat";
    };
  };


  zramSwap = {
    # TODO
    #writebackDevice = "/dev/disk/by-partlabel/zramwbd";
  };

  services = {
    # TODO
    zfs = {
      autoReplication = {
        enable = false;
        host = "example.com";
        username = "zfs-remote";
        localFilesystem = "pi";
        remoteFilesystem = "piscine";
        identityFilePath = "/nix/secrets/ssh/id_rsa";
      };
    };
  };

  #environment = {
  #  etc
  #};

  # TODO ZFS Impermanence
  #boot.postDeviceCommands = lib.mkAfter ''
  #  zfs rollback -r rpool/enc/impermanence/root@blank
  #'';
  #zfs rollback -r rpool/enc//home@blank
  #fileSystems."/" = {
  #  device = "none";
  #  fsType = "tmpfs";
  #  options = [ "defaults" "size=2G" "mode=755" ];
  #};
  #fileSystems."/nix" = {
  #  device = "/dev/disk/by-label/nix";
  #  fsType = "ext4";
  #};
}
