{ config, ...}:

{
  system = {
    stateVersion = "24.05";
    # stateVersion = config.system.nixos.release;
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      sandbox = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      persistent = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      (import ../../overlays)
    ];
  };

  imports = [
    ./secrets.nix
    ./hardware
    ./users.nix

    ../../modules/nix
    ../../modules/system
  ];

  networking = {
    hostName = "artemis";
    hostId = "b80dff01";
  };

  i18n.defaultLocale = "en_US.UTF-8";

  # Not Compatible with flake (https://github.com/NixOS/nixpkgs/issues/97252)
  # system.copySystemConfiguration = true;
}
