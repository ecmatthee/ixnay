{config, ...}:

{
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      documents = "${config.home.homeDirectory}/.local/xdg/documents";
      download = "${config.home.homeDirectory}/download";
      music = "${config.home.homeDirectory}/.local/xdg/music";
      pictures = "${config.home.homeDirectory}/.local/xdg/pictures";
      videos ="${config.home.homeDirectory}/.local/xdg/video";
      desktop = "${config.home.homeDirectory}/.local/xdg/desktop";
      publicShare = "${config.home.homeDirectory}/.local/xdg/public";
      templates = "${config.home.homeDirectory}/.local/xdg/template";
      extraConfig = {
        # TODO Set up steam & heroic to use XDG_GAMES_DIR.
        XDG_GAMES_DIR = "${config.home.homeDirectory}/.local/gms";
        XDG_WINE_DIR = "${config.home.homeDirectory}/.local/cellar";
      };
    };
    #desktopEntries = {};
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
      };
    };
  };
}
