{
  services = {
    archisteamfarm = {
      enable = true;
      settings = {};
      bots = {
        sisyphus = {
          enable = true;
          username = "Goldleader_i";
          settings = {};
          passwordFile = ./default.nix;
        };
      };
    };
  };
}
