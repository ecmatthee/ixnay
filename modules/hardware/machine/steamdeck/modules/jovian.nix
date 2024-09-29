{ inputs, ... }:

{
  jovian = {
    decky-loader = {
      enable = true;
    };
    devices = {
      steamdeck = {
        enable = true;
        autoUpdate = true;
        # enableGyroDsuService = true;
      };
    };
    steam = {
      enable = true;
      autoStart = true;
      # user = "";
    };
    steamos = {
      useSteamOSConfig = true;
    };
  };
}
