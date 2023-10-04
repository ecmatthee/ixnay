{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
  ];

  xdg.configFile.hyprpaper = {
     enable = true;
     target = "hypr/hyprpaper.conf";
     text = ''
       preload = /home/ecm/.local/share/wallpapers/shooting-star.png
       wallpaper = ,/home/ecm/.local/share/wallpapers/shooting-star.png
     '';
  };
}
