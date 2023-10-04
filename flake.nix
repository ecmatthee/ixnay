{
  description = "Configuration flake for NixOS systems";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url =  "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
    };
    nur = {
      url = "github:nix-community/NUR";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, ... }:
  {
    nixosConfigurations = {
      artemis = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./host/artemis/default.nix
          home-manager.nixosModules.home-manager {
            imports = [
              ./host/artemis/home-manager.nix
            ];
          }
        ];
      };

      vortex = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./host/vortex/default.nix
          home-manager.nixosModules.home-manager {
            imports = [
              ./host/vortex/home-manager.nix
            ];
          }
        ];
      };

      titan = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./host/titan/default.nix
          home-manager.nixosModules.home-manager {
            imports = [
              ./host/titan/home-manager.nix
            ];
          }
        ];
      };
    };
  };
}
