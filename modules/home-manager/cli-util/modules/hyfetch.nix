{
  programs = {
    hyfetch = {
      enable = true;
      settings = {
        preset = "bisexual";
        mode = "rgb";
        light-dark = "dark";
        lightness = 0.65;
        color_align = {
          mode = "custom";
          custom_colors = {
            "1" = 2;
            "2" = 0;
          };
        };
      };
    };
  };
}
