{
  services = {
    zfs = {
      autoScrub = {
        enable = true;
        interval = "Sun, 02:00";
        #"daily"
        pools = [ ];
      };
    };

    zfs.autoSnapshot = {
      enable = true;
      flags = "-k -p --utc";
      frequent = 4;
      hourly = 24;
      daily = 7;
      weekly = 4;
      monthly = 12;
    };

    # TODO Replication
    #autoReplication = {
    #  enable = false;
    #};

    # TODO Trim on SSD Pools only
    #trim = {
    #  enable = true;
    #};

    # TODO ZED mail setup
    # https://nixos.wiki/wiki/Msmtp
    # https://nixos.wiki/wiki/ZFS
    #zed = {
    #  settings = {};
    #};
  };
}
