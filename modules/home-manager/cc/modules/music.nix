{ pkgs, ...}:

{
  home.packages = with pkgs; [
      ffmpeg_6-full
      flac
      # mp3val
      # Beets dependants
      # chromaprint
      # python311Packages.pyacoustid
      python312Packages.deemix
      # python311Packages.discogs-client
      # python311Packages.requests
  ];


  programs = {
    ncmpcpp = {
      enable = true;
    };

    beets = {
      enable = false;
      package = pkgs.beets-unstable;
      mpdIntegration = {
        enableStats = true;
        enableUpdate = true;
      };

      settings = {
        directory  = "~/root/media/snd/music";
        library = "~/.local/share/beetlibrary.db";
        paths = {
          default = "%the{$albumartist}/$album%aunique{} [$year]$atypes/$track $title";
          singleton = "%the{$artist}/Singles/$title [$year]";
          comp = "Compilations/$album%aunique{} [$year]/$track $title";
          "albumtype:soundtrack" = "Soundtracks/$album [$year]/$track $title";
        };

        plugins = [
          # Autotag
          "chroma"
          "discogs"
          # Deezer breaks single tracks
          #"deezer"
          "spotify"
          "fromfilename"
          # Metadata
          "acousticbrainz"
          "absubmit"
          "fetchart"
          "embedart"
          "edit"
          #"keyfinder"
          "mbsync"
          "lyrics"
          "scrub"
          "replaygain"
          # Interoperability
          "badfiles"
          # Path
          "albumtypes"
          "the"
          # Miscellaneous
          "info"
          "missing"
        ];

        discogs = {
          source_weight = 0.3;
          user_token = "";
          index_tracks = true;
        };

        #deezer = {
        #  source_weight = 0.6;
        #};

        spotify = {
          source_weight = 0.6;
        };

        embedart = {
          compare_threshold = 10;
        };

        fetchart = {
          store_source = true;
          high_resolution = true;
          cover_format = "png";
        };

        #keyfinder = {
        #  overwrite = true;
        #};

        replaygain = {
          backend = "ffmpeg";
          overwrite = true;
        };

        badfiles = {
          check_on_import = true;
        };
      };
    };
  };

  services = {
    mpd = {
      enable = true;
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "MPD PipeWire Output"
        }
      '';
    };
  };
}
