{ pkgs, ... }:

{
  # TODO Arkenfox
  # https://github.com/arkenfox/user.js/wiki/4.1-extensions
  # https://github.com/dwarfmaster/arkenfox-nixos
  # TODO Extension Data
  programs = {
    firefox = {
      enable = true;
      profiles.default = {
        id = 0;
        name = "Default";
        #isDefault = true;
	    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          export-tabs-urls-and-titles
          old-reddit-redirect
          rust-search-extension
          single-file
          skip-redirect
          sponsorblock
          tree-style-tab
          ublock-origin
        ];
        bookmarks = [
          {
            name = "wikipedia";
            tags = [ "wiki" ];
            keyword = "wiki";
            url = "https://en.wikipedia.org/";
          }
          {
            name = "kernel.org";
            url = "https://www.kernel.org";
          }
	      {
            name = "nix homepage";
            tags = [ "nix" ];
            url = "https://nixos.org/";
          }
          {
            name = "nix wiki";
            tags = [ "wiki" "nix" ];
            url = "https://nixos.wiki/";
          }
          {
            name = "NUR Search";
            tags = [ "nix" ];
            url = "https://nur.nix-community.org/";
          }
          {
            name = "arch wiki";
            tags = [ "wiki" "arch" ];
            url = "https://wiki.archlinux.org/";
          }
          {
            name = "emuwiki";
            tags = [ "wiki" ];
            url = "https://emulation.gametechwiki.com/index.php/Main_Page";
          }
        ];
        search = {
          engines = {
              "Nix Packages" = {
                urls = [{
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "channel"; value = "unstable"; }
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@np" ];
              };
              "Nix Options" = {
                urls = [{
                  template = "https://search.nixos.org/options";
                  params = [
                    { name = "channel"; value = "unstable"; }
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@no" ];
              };
              "NixOS Wiki" = {
                urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@nw" ];
              };
              "Arch Linux Wiki" = {
                urls = [{ template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; }];
                iconUpdateURL = "https://wiki.archlinux.org/favicon.ico";
                updateInterval = 24 * 60 * 60 * 1000;
                definedAliases = [ "@aw" ];
              };
              "Bing".metaData.hidden = true;
              "Amazon".metaData.hidden = true;
              "Google".metaData.alias = "@g";
              "Wikipedia".metaData.alias = "@w";
          };
          force = true;
          order = [];
        };
      };
    };
  };
}
