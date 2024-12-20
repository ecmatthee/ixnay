{ pkgs, config, ... }:

{
  fonts = {
    packages = with pkgs; [
      roboto
      inter
      crimson-pro
      nerdfonts
      noto-fonts
      noto-fonts-extra
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";
    image = pkgs.fetchurl {
      url = "https://files.catbox.moe/9xwh3p.png";
      sha256 = "5b316aac23a692328a3500e54d2ccf9b96bb2a48bbf8573ebff66198dbd51528";
    };
    # imageScalingMode = "fill";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 32;
    };
    # opacity = {
    #   applications = 1.0;
    #   desktop = 1.0;
    #   popups = 1.0;
    #   terminal = 1.0;
    # };
    fonts = {
      serif = config.stylix.fonts.sansSerif;
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      monospace = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      # sizes = {
      #   applications = 12;
      #   desktop = 10;
      #   popups = 10;
      #   terminal = 12;
      # };
    };
  };
}
