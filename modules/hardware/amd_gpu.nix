{ pkgs, ... }:

{
  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      libva-utils
      vulkan-tools
    ];
  };
}
