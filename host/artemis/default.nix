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
      (import ../../overlay)
      inputs.nur.overlay
      inputs.fenix.overlays.default
    ];
  };

  imports = [
    ./hardware-configuration.nix
    ./users.nix
    ../../module/hardware/amd_cpu.nix
    ../../module/hardware/amd_gpu.nix
    ../../module/hardware/bluetooth.nix
    #../../module/system/ephemeral.nix
    ../../module/system/boot.nix
    ../../module/system/console.nix
    ../../module/system/font.nix
    ../../module/system/gaming
    ../../module/system/gnupg.nix
    ../../module/system/network.nix
    ../../module/system/postgresql.nix
    ../../module/system/printer.nix
    ../../module/system/security.nix
    ../../module/system/shell.nix
    ../../module/system/snowflake.nix
    ../../module/system/swap.nix
    ../../module/system/system-ctrl.nix
    ../../module/system/timezoned.nix
    ../../module/system/utils.nix
    ../../module/system/virtualisation
    #../../module/system/vpn.nix
    ../../module/system/wayland.nix
    ../../module/system/zfs.nix
  ];

  networking = {
    hostName = "nixos";
    hostId = "b80dff01";
  };

  i18n.defaultLocale = "en_US.UTF-8";

  # Not Compatible with flake (https://github.com/NixOS/nixpkgs/issues/97252)
  # system.copySystemConfiguration = true;
}
