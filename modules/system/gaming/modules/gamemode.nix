{ pkgs, ...}:

{
  programs = {
    gamemode = {
      enable = true;
      settings = {
        general = {
          renice = 0;
        };

        # Warning: GPU optimisations have the potential to damage hardware
        #gpu = {
        #  apply_gpu_optimisations = "accept-responsibility";
        #  gpu_device = 0;
        #  amd_performance_level = "high";
        #};

        custom = {
          start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
          end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";
        };
      };
    };
  };
}
