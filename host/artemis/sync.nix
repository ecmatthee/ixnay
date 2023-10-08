{config, ...}:

{
  # TODO Set up key & cert for immutable machine id
  # TODO Folders & Devices -> Extract to host specific config
  services = {
    syncthing = {
      key = "";
      cert = "";
      settings = {
        devices = {
          firefly = {
            id = "YKS5PMV-WQQCEE7-NDWCWOS-4ZY3WYM-X3JKZF2-EVQWMLB-ZN4VTCX-2FLGXAT";
            name = "firefly";
          };
          #vortex = {
          #  id = "";
          #};
        };
        folders = {
          firefly = {
            enable = true;
            id = "2w8uk-cznb4";
            label = "Firefly";
            path = config.services.syncthing.dataDir + "/firefly";
            devices = [
              "firefly"
            ];
          };
        };
      };
    };
  };
}
