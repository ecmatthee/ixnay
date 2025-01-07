{ pkgs, ...}:

{
  # TODO Fuck
  # https://nixos.wiki/wiki/Android
  environment = {
    systemPackages = with pkgs; [
      android-tools
      scrcpy
    ];
  };

  virtualisation = {
    waydroid = {
      # TODO Fix Mess
      # https://github.com/casualsnek/waydroid_script
      # https://gitlab.com/AuroraOSS/AuroraStore
      # https://f-droid.org/en/
      # https://old.reddit.com/r/pinephone/comments/xqleo6/pro_tip_waydroid_with_google_play_services/

      enable = true;
    };

    lxd = {
      enable = true;
    };
  };

  programs = {
    adb = {
      enable = true;
    };
  };
}
