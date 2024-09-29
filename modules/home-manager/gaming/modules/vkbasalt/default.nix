{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vkbasalt
  ];

  xdg.configFile = {
    vkBasaltConfig = {
      enable = true;
      source = ./vkBasalt.conf;
      target = "vkBasalt/vkBasalt.conf";
    };
  };
}
