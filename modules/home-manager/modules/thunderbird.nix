{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # protonmail-bridge
    protonmail-bridge-gui
  ];

  programs = {
    thunderbird = {
      enable = true;
      profiles = {
        default = {
          isDefault = true;
          settings = {
            "calendar.alarms.playsound" = false;
            "mail.biff.play_sound" = false;
            "mail.chat.play_sound" = false;
            "mail.feed.play_sound" = false;
            "mail.serverDefaultStoreContractID" = "@mozilla.org/msgstore/maildirstore;1"; # Maildir
            "messenger.options.messagesStyle.theme" = "simple";
          };
        };
      };
      # TODO
    };
  };
}
