{
  home.persistence."/nix/persist/home/ecm" = {
    removePrefixDirectory = true;
    allowOther = true;
    # TODO Game Saves (XDG_DOCUMENT HOME)
    # TODO Game Saves (XDG_DATA_HOME)
    # TODO Game Saves (XDG_CONFIG_HOME)
    # TODO Game Saves (HOME)
    # TODO Game Saves (APP_DATA)
    # TODO Game Saves (GAME_FOLDER)
    # TODO Game Installs
    # TODO Beet DB
    # TODO Gallery-dl DB
    # TODO Torrents
    # TODO Waydroid
    # TODO Rust Cargo Pub ID
    # TODO PRJ Folerd
    directories = [
      "Firefox/.mozilla"
      # TODO Non Mutable gnupg & remove
      "GPG/.local/share/.gnupg"
      # TODO Non Mutable ssh & remove
      "SSH/.ssh"
      "Newsboat/.local/share/newsboat"
      "XDG/.local/xdg"
    ];
    files = [
      "Atom/.atom/config.cson"
      "Atom/.atom/github.cson"
    ];
  };
}
