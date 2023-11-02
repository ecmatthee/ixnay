{ inputs, ... }:

{
  system = {
    stateVersion = "23.05";
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
      inputs.nur.overlay
      inputs.fenix.overlays.default
    ];
  };

  imports = [
    ./hardware-configuration.nix
    ./users.nix

    ../../modules/hardware/amd_gpu.nix
    ../../modules/hardware/bluetooth.nix
    ../../modules/hardware/drive.nix
    ../../modules/hardware/power_management.nix
    ../../modules/hardware/rgb.nix
    ../../modules/hardware/screen.nix

    ../../modules/base
    ../../modules/database
    ../../modules/gaming
    ../../modules/network
    ../../modules/printer
    ../../modules/system
    ../../modules/virtualisation
    ../../modules/wayland
  ];

  networking = {
    hostName = "nixos";
    hostId = "b80dff01";
  };

  i18n.defaultLocale = "en_US.UTF-8";

  # Not Compatible with flake (https://github.com/NixOS/nixpkgs/issues/97252)
  # system.copySystemConfiguration = true;
}
