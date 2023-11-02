{ pkgs, ...}:

{
  environment = {
    systemPackages = with pkgs; [
      protontricks
    ];
  };

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      # TODO Setup Gamescope
      #gamescopeSession = {
      #  enable = false;
      #  env = {};
      #  args = [];
      #};
    };
  };

  hardware = {
    steam-hardware.enable = true;
  };
}
