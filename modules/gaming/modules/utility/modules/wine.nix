{ pkgs, ...}:

{
  environment = {
    systemPackages = with pkgs; [
      wineWowPackages.waylandFull
      winetricks
      vkd3d
      dxvk
    ];
  };
}
