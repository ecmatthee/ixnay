{config, ...}:

{
  # TODO Syncthing User setup
  # https://nitinpassa.com/running-syncthing-as-a-system-user-on-nixos/
  # https://wes.today/nixos-syncthing/
  # syncthing group setup
  services = {
    syncthing = {
      enable = true;
      systemService = true;
      openDefaultPorts = true;
      overrideDevices = true;
      overrideFolders = true;
      user = "syncthing";
      group = "syncthing";
      datadir = "/home/syncthing";
      configdir = config.services.syncthing.dataDir + "/.config/syncthing";
      settings = {
        options = {
          urAccepted = 1;
          relaysEnabled = true;
        };
      };
    };
  };
}
