{
  programs = {
    atuin = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        # TODO Sync
        # https://github.com/atuinsh/atuin
        # https://atuin.sh/docs/commands/sync
        # https://atuin.sh/docs/self-hosting
        # https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=atuin
        auto_sync = true;
        sync_frequency = "10m";
        sync_address = "https://api.atuin.sh";
        update_check = true;
        dialect = "uk";
        search_mode = "fuzzy";
        filter_mode = "host";
        exit_mode = "return-query";
      };
    };
  };
}
