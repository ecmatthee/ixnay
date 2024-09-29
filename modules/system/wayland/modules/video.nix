{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      libva-utils
      vulkan-tools
    ];
  };

  programs = {
    sway = {
      enable = true;
      wrapperFeatures = {
        gtk = true;
      };
      extraPackages = [];
    };
  };
}
