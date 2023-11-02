{ inputs, ... }:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.ecm = {
      home.stateVersion = "23.11";
      imports = [
        #inputs.impermanence.nixosModules.home-manager.impermanence
        #../../module/home-manager/ephemeral-home.nix
        inputs.arkenfox.hmModules.default
        ../../modules/home-manager/browser
        ../../modules/home-manager/cli-util
        ../../modules/home-manager/comms
        ../../modules/home-manager/de
        ../../modules/home-manager/downloader
        ../../modules/home-manager/gui-misc
        ../../modules/home-manager/ide
        ../../modules/home-manager/media
        ../../modules/home-manager/shell
        ../../modules/home-manager/secret
      ];
    };
  };
}
