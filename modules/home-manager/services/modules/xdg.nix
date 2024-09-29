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
        "application/pdf" = [ "org.pwmt.zathura.desktop" ];
        "application/oxps" = [ "org.pwmt.zathura.desktop" ];
        "application/epub+zip" = [ "org.pwmt.zathura.desktop" ];
        "application/x-fictionbook" = [ "org.pwmt.zathura.desktop" ];
        "application/vnd.djvu" = [ "org.pwmt.zathura.desktop" ];
        "application/vnd.djvu+multipage" = [ "org.pwmt.zathura.desktop" ];
        "application/postscript" = [ "org.pwmt.zathura.desktop" ];
        "application/eps" = [ "org.pwmt.zathura.desktop" ];
        "application/x-eps" = [ "org.pwmt.zathura.desktop" ];
        "application/x-cbr" = [ "org.pwmt.zathura.desktop" ];
        "application/x-cbz" = [ "org.pwmt.zathura.desktop" ];
        "application/x-cb7" = [ "org.pwmt.zathura.desktop" ];
        "application/x-cbt" = [ "org.pwmt.zathura.desktop" ];
        "image/eps" = [ "org.pwmt.zathura.desktop" ];
        "image/x-eps" = [ "org.pwmt.zathura.desktop" ];
        "image/bmp" = [ "imv.desktop" ];
        "image/gif" = [ "imv.desktop" ];
        "image/jpeg" = [ "imv.desktop" ];
        "image/jpg" = [ "imv.desktop" ];
        "image/pjpeg" = [ "imv.desktop" ];
        "image/png" = [ "imv.desktop" ];
        "image/tiff" = [ "imv.desktop" ];
        "image/x-bmp" = [ "imv.desktop" ];
        "image/x-pcx" = [ "imv.desktop" ];
        "image/x-png" = [ "imv.desktop" ];
        "image/x-portable-anymap" = [ "imv.desktop" ];
        "image/x-portable-bitmap" = [ "imv.desktop" ];
        "image/x-portable-graymap" = [ "imv.desktop" ];
        "image/x-portable-pixmap" = [ "imv.desktop" ];
        "image/tga" = [ "imv.desktop" ];
        "image/xbitmap" = [ "imv.desktop" ];
        "image/heif" = [ "imv.desktop" ];
        "image/avif" = [ "imv.desktop" ];
        "x-scheme-handler/http" = [ "firefox.desktop" ];
        "x-scheme-handler/https" = [ "firefox.desktop" ];
      };
    };
  };
}
