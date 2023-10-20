{
  services = {
    zfs = {
      autoScrub = {
        enable = true;
        interval = "*-*-01,14 00:00:00 UTC";
        pools = [ ];
      };

      trim = {
        enable = true;
        interval = "*-*-07,21 00:00:00 UTC";
      };

      autoSnapshot = {
        enable = true;
        flags = "-k -p --utc";
        frequent = 4;
        hourly = 24;
        daily = 7;
        weekly = 4;
        monthly = 12;
      };

      # TODO Replication should be host spesefic
      autoReplication = {
        enable = false;
        host = "example.com";
        username = "zfs-remote";
        localFilesystem = "pi";
        remoteFilesystem = "piscine";
        identityFilePath = "/nix/secrets/ssh/id_rsa";
      };

      # TODO ZED mail setup
      # https://nixos.wiki/wiki/Msmtp
      # https://nixos.wiki/wiki/ZFS
      #zed = {
      #  settings = {};
      #};

      # TODO removeLinuxDRM on aarch64
    };
  };
}
