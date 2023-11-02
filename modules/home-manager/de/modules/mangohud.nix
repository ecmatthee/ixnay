{
  programs = {
    mangohud = {
      enable = true;
      enableSessionWide = true;
      #settings = {
      #  gpu_stats
      #  gpu_temp
      #};
      settingsPerApplication = {
        mpv = {
          no_display = true;
        };
      };
    };
  };
}
