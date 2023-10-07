{

  # https://nitinpassa.com/running-syncthing-as-a-system-user-on-nixos/
  # https://wes.today/nixos-syncthing/
  services = {
    syncthing = {
      enable = true;
      systemService = true;
      openDefaultPorts = true;
      user = "syncthing";
      group = "syncthing";
      datadir = "/home/syncthing";
    };
  };
}
