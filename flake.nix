{
  description = "Configuration flake for NixOS systems";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    home-manager = {
      url =  "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
    };
    arkenfox = {
      url = "github:dwarfmaster/arkenfox-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixCats = {
      url = "github:BirdeeHub/nixCats-nvim";
    };
    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    base16 = {
      url = "github:SenchoPens/base16.nix";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, stylix, nur, sops-nix, ... }:
  {
    nixosConfigurations = {
      artemis = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          stylix.nixosModules.stylix
          nur.nixosModules.nur
          sops-nix.nixosModules.sops
          ./hosts/artemis/default.nix
          home-manager.nixosModules.home-manager {
            imports = [
              ./hosts/artemis/home-manager.nix
            ];
          }
        ];
      };
      # moby = nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   specialArgs = { inherit inputs; };
      #   modules = [
      #     stylix.nixosModules.stylix
      #     nur.nixosModules.nur
      #     sops-nix.nixosModules.sops
      #     ./hosts/moby/default.nix
      #     home-manager.nixosModules.home-manager {
      #       imports = [
      #         ./hosts/moby/home-manager.nix
      #       ];
      #     }
      #   ];
      # };
    };
  };
}
