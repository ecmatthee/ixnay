{inputs, ...}:
{
  home-manager = {
    backupFileExtension = "hm-backup";
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [
      inputs.nur.hmModules.nur
      inputs.sops-nix.homeManagerModules.sops
    ];
    users = {
      ecm = {
        home.stateVersion = "24.05";
        imports = [
          inputs.arkenfox.hmModules.default
          # inputs.nixvim.homeManagerModules.nixvim
          inputs.nixCats.homeModule
          ../../modules/home-manager/gaming
          ../../modules/home-manager/cc
          ../../modules/home-manager/cli
          ../../modules/home-manager/de
          ../../modules/home-manager/gui
          ../../modules/home-manager/services
        ];
      };
    };
  };
}
