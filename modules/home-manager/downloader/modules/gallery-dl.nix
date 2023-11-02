{
  programs = {
    gallery-dl = {
      enable = true;
      settings = {
        extractor = {
          base-directory = "~/download/gallery-dl/";
          archive = "~/download/gallery-dl/archive.sqlite3";
          path-restrict = {
            "\\" = "⧹";
            "/"  = "⧸";
            "|"  = "￨";
            ":"  = "꞉";
            "*"  = "∗";
            "?"  = "？";
            "\"" = "″";
            "<"  = "﹤";
            ">"  = "﹥";
          };

          deviantart = {
            client-id = "18557";                                 
            client-secret = "622d6f006aecb519fd3adb6b32855234";
          };

          mangadex = {
            postprocessors = ["cbz"];
          };

          tumblr = {
            api-key = "5whHD1PA2Cp6UEVwPEizveGTDfN3gkHGbdLb9YYH7JIGx5zgBF";
            api-secret = "wpn1VzG2HcQmn1caoeQO8A3UkrlcsRfxINaysR5vDTQGcI5QL7";
          };

          pixiv = {
            ugoira = true;
            postprocessors = ["ugoira-copy"];
          };
        };

        downloader = {
          part-directory = "~/download/gallery-dl/tmp/";
        };

        output = {
          log = {
            level = "info";
            format = {
              debug = "\u001b[0;37m{name}: {message}\u001b[0m";
              info = "\u001b[1;37m{name}: {message}\u001b[0m";
              warning = "\u001b[1;33m{name}: {message}\u001b[0m";
              error = "\u001b[1;31m{name}: {message}\u001b[0m";
            };
          };
          shorten = "eaw";
          logfile = {
            path = "~/download/gallery-dl/log.txt";
            mode = "w";
            level = "debug";
          };
        };

        postprocessor = {
          cbz = {
            name = "zip";
            extension = "cbz";
          };

          ugoira-webm = {
            name = "ugoira";
            extension = "webm";
            ffmpeg-args = [
              "-c:v"
              "libvpx-vp9"
              "-an"
              "-b:v"
              "0"
              "-crf"
              "30"
            ];
            ffmpeg-twopass = true;
            ffmpeg-demuxer = "image2";
          };

          ugoira-mp4 = {
            name = "ugoira";
            extension = "mp4";
            ffmpeg-args = [
              "-c:v"
              "libx264"
              "-an"
              "-b:v"
              "4M"
              "-preset"
              "veryslow"
            ];
            ffmpeg-twopass = true;
            libx264-prevent-odd = true;
          };

          ugoira-gif = {
            name = "ugoira";
            extension = "gif";
            ffmpeg-args = [
              "-filter_complex"
              "[0:v] split [a][b];[a] palettegen [p];[b][p] paletteuse"
            ];
          };

          ugoira-copy = {
            name = "ugoira";
            extension = "mkv";
            ffmpeg-args = [
              "-c"
              "copy"
            ];
            libx264-prevent-odd = false;
            repeat-last-frame = false;
          };
        };

        cache = {
          file = "~/download/gallery-dl/cache.sqlite3";
        };
      };
    };
  };
}
