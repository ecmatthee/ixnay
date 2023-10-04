{ pkgs, ... }:

{
  boot = {
    initrd.kernelModules = [ "amdgpu" ];
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
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
