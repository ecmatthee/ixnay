{ pkgs, ... }:

{
  programs = {
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland.override {
        plugins = with pkgs; [
          #rofi-calc
          rofi-emoji
        #   (rofi-emoji.override {
        #     rofi-unwrapped = rofi-wayland-unwrapped;
        #   })
        ];
      };
      #theme = ./tmp.rasi;
      terminal = "${pkgs.foot}/bin/foot";
      extraConfig = {
        modes = [
          "combi"
        ];
        combi-modes = [
          "drun"
        ];
        combi-hide-mode-prefix = true;
        display-combi = "Launch";
        #drun = {
        #  fallback-icon = "/home/ecm/pictures/term_icon.png";
        #};
      #  entry {
      #      placeholder: "Type here";
      #      cursor: pointer;
      #  }
      #
      #  element {
      #      orientation: horizontal;
      #      children: [ element-icon, element-text ];
      #      spacing: 5px;
      #  }
      #
      #  element-icon {
      #      size: 1.5em;
      #  }
      #
      #  element-text {
      #      vertical-align: 0.5;
      #  }
      };
    };
  };
}
