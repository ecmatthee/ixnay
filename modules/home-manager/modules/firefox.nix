{ pkgs, config, ... }:

{
  # TODO Extension Data
  programs = {
    firefox = {
      enable = true;
      arkenfox = {
        enable = true;
        version = "master";
      };
      policies = {
        DefaultDownloadDirectory = "\${home}/downloads/firefox";
      };
      profiles.default = {
        id = 0;
        name = "Default";
        isDefault = true;
        arkenfox = {
          enable = true;

          # 0100: STARTUP
          # 0200: GEOLOCATION / LANGUAGE / LOCALE
          # 0300: QUIETER FOX
          # 0400: SAFE BROWSING
          # 0600: BLOCK IMPLICIT OUTBOUND
          # 0700: DNS / DoH / PROXY / SOCKS
          # 0800: LOCATION BAR / SEARCH BAR / SUGGESTIONS / HISTORY / FORMS
          # 0900: PASSWORDS
          # 1000: DISK AVOIDANCE
          # 1200: HTTPS (SSL/TLS / OCSP / CERTS / HPKP)
          # 1600: REFERERS
          # 1700: CONTAINERS
          # 2000: PLUGINS / MEDIA / WEBRTC
          # 2400: DOM (DOCUMENT OBJECT MODEL)
          # 2600: MISCELLANEOUS
          # 2700: ETP (ENHANCED TRACKING PROTECTION)
          # 2800: SHUTDOWN & SANITIZING
          # 4500: RFP (resistFingerprinting)
          # 5000: OPTIONAL OPSEC
          # 5500: OPTIONAL HARDENING
          # 6000: DON'T TOUCH
          # 7000: DON'T BOTHER
          # 8000: DON'T BOTHER: FINGERPRINTING
          # 9000: NON-PROJECT RELATED
          # 9999: DEPRECATED / RENAMED

          "0000" = {
            enable = true;
          };
          "0100" = {
            enable = true;
          };
          "0200" = {
            enable = true;
          };
          "0300" = {
            enable = true;
          };
          "0400" = {
            enable = true;
          };
          "0600" = {
            enable = true;
          };
          "0700" = {
            enable = true;
            "0710"."network.trr.mode" = {
              enable = true;
              value = 5;
            };
          };
          "0800" = {
            enable = true;
          };
          "0900" = {
            enable = true;
          };
          "1000" = {
            enable = true;
          };
          "1200" = {
            enable = true;
          };
          "1600" = {
            enable = true;
          };
          "1700" = {
            enable = true;
          };
          "2000" = {
            enable = true;
          };
          "2400" = {
            enable = true;
          };
          "2600" = {
            enable = true;
            #"2651"."browser.download.useDownloadDir".value = true;
          };
          "2700" = {
            enable = true;
          };
          "2800" = {
            enable = true;
          };
          "4500" = {
            enable = true;
            "4504"."privacy.resistFingerprinting.letterboxing".enable = false;
          };
          "5000" = {
            enable = true;
            "5003"."signon.rememberSignons".enable = true;
            "5010"."browser.urlbar.suggest.topsites".enable = true;
          };
        };
        extensions = with config.nur.repos.rycee.firefox-addons; [
          export-tabs-urls-and-titles
          keepassxc-browser
          old-reddit-redirect
          sidebery
          single-file
          skip-redirect
          sponsorblock
          ublock-origin
        ];
        bookmarks = [
          {
            name = "Android Source";
            tags = [ "dev" ];
            url = "https://source.android.com/";
          }
          {
            name = "MDN";
            tags = [ "dev" ];
            url = "https://developer.mozilla.org/";
          }
          {
            name = "Wikipedia";
            tags = [ "wiki" ];
            keyword = "wiki";
            url = "https://en.wikipedia.org/";
          }
          {
            name = "Nix Homepage";
            tags = [ "nix" ];
            url = "https://nixos.org/";
          }
          {
            name = "Nix Wiki";
            tags = [ "nix" ];
            url = "https://wiki.nixos.org/";
          }
          {
            name = "NUR Search";
            tags = [ "nix" ];
            url = "https://nur.nix-community.org/";
          }
          {
            name = "Arch Wiki";
            tags = [ "arch" ];
            url = "https://wiki.archlinux.org/";
          }
          {
            name = "EMUwiki";
            tags = [ "emulation" ];
            url = "https://emulation.gametechwiki.com/index.php/Main_Page";
          }
          {
            name = "Aither";
            tags = [ "piracy" ];
            url = "https://aither.cc/";
          }
          {
            name = "MyAnonaMouse";
            tags = [ "piracy" ];
            url = "https://www.myanonamouse.net/";
          }
          {
            name = "1337x";
            tags = [ "piracy" ];
            url = "https://1337x.to/";
          }
          {
            name = "Torrent Galaxy";
            tags = [ "piracy" ];
            url = "https://torrentgalaxy.to/";
          }
          {
            name = "nyaa";
            tags = [ "piracy" ];
            url = "https://nyaa.si/";
          }
          {
            name = "Fitgirl";
            tags = [ "piracy" ];
            url = "https://fitgirl-repacks.site/";
          }
          {
            name = "NXBrew";
            tags = [ "piracy" ];
            url = "https://nxbrew.com/";
          }
          {
            name = "JustLightNovels";
            tags = [ "piracy" ];
            url = "https://www.justlightnovels.com/";
          }
          {
            name = "ROMS Megathread";
            tags = [ "piracy" ];
            url = "https://r-roms.github.io/";
          }
          {
            name = "Seadex";
            tags = [ "piracy" ];
            url = "https://releases.moe";
          }
          {
            name = "A Certain Fansubber's Index";
            tags = [ "piracy" ];
            url = "https://index.fansubcar.tel/";
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
              "Home-Manager Options" = {
                urls = [{
                  template = "https://home-manager-options.extranix.com";
                  params = [
                    { name = "query"; value = "{searchTerms}"; }
                    { name = "release"; value = "master"; }
                  ];
                }];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@ho" ];
              };
              "NixOS Wiki" = {
                urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = [ "@nw" ];
              };
              "Arch Linux Wiki" = {
                urls = [{ template = "https://wiki.archlinux.org/index.php?search={searchTerms}"; }];
                iconUpdateURL = "https://wiki.archlinux.org/favicon.ico";
                updateInterval = 24 * 60 * 60 * 1000;
                definedAliases = [ "@aw" ];
              };
              "MDN" = {
                urls = [{ template = "https://developer.mozilla.org/en-US/search?q={searchTerms}"; }];
                iconUpdateURL = "https://developer.mozilla.org/favicon-48x48.cbbd161b.png";
                updateInterval = 24 * 60 * 60 * 1000;
                definedAliases = [ "@mdn" ];
              };
              # "Kagi" = {
              #   urls = [{ template = "https://kagi.com/search?q="; }];
              #   iconUpdateURL = "https://kagi.com/favicon.ico";
              #   updateInterval = 24 * 60 * 60 * 1000;
              #   definedAliases = [ "@kg" ];
              # };
              "Google" = {
                metaData = {
                  alias = "@g";
                  hidden = true;
                };
              };
              "Wikipedia (en)" = {
                metaData = {
                  alias = "@w";
                  hidden = true;
                };
              };
              "Bing" = {
                metaData = {
                  hidden = true;
                };
              };
              "Amazon.com" = {
                metaData = {
                  hidden = true;
                };
              };
          };
          force = true;
          default = "DuckDuckGo";
          order = [];
        };
      };
      profiles.vanilla = {
        id = 1;
        name = "Vanilla";
        extensions = with config.nur.repos.rycee.firefox-addons; [
          sidebery
          sponsorblock
          ublock-origin
        ];
      };
    };
  };
}
