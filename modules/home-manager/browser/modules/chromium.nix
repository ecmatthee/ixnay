{
  programs = {
    chromium = {
      enable = true;
      commandLineArgs = [
        #"--enable-features=UseOzonePlatform"
        #"--ozone-platform=wayland"
        "--enable-features=WebRTCPipeWireCapturer"
      ];
      extensions = [
        {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origin
      ];
    };
  };
}
