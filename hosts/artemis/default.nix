{
  system = {
    stateVersion = "24.05";
  };

  nix = {
    settings = {
      sandbox = true;
      auto-optimise-store = true;
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

    ../../modules/stylix

    ../../modules/system/core
    ../../modules/system/database
    ../../modules/system/gaming
    ../../modules/system/llm
    ../../modules/system/printer
    ../../modules/system/server
    ../../modules/system/virtualisation
    ../../modules/system/wayland
  ];

  networking = {
    hostName = "artemis";
    hostId = "b80dff01";
  };

  i18n.defaultLocale = "en_US.UTF-8";

  # Not Compatible with flake (https://github.com/NixOS/nixpkgs/issues/97252)
  # system.copySystemConfiguration = true;
}
