{ inputs, ... }:

{
  imports = [
    inputs.aagl.nixosModules.default
  ];

  programs = {
    anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
    anime-borb-launcher.enable = true;
    honkers-railway-launcher.enable = true;
    honkers-launcher.enable = true;
  };
}
