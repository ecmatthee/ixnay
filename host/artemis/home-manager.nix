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
        ../../module/home-manager/browser
        ../../module/home-manager/cli-util
        ../../module/home-manager/comms
        ../../module/home-manager/de
        ../../module/home-manager/downloader
        ../../module/home-manager/gui-misc
        ../../module/home-manager/ide
        ../../module/home-manager/media
        ../../module/home-manager/shell
        ../../module/home-manager/secret
      ];
    };
  };
}
