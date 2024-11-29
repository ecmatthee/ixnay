{
  programs = {
    git = {
      enable = true;
      userName = "Ebert Matthee";
      userEmail = "ebert@ecmatthee.com";
      signing ={
        signByDefault = true;
        key = "ebert@ecmatthee.com";
      };
      extraConfig = {
        core.editor = "nvim";
      };
      aliases = {
        st = "status";
        co = "checkout";
        ci = "commit --verbose";
        amend = "commit --amend";
        aa = "add --all";
        cp = "cherry-pick";
        pa = "pull --all";
        fa = "fetch --all";
        pom = "push origin main";
      };
      difftastic = {
        enable = true;
        background = "dark";
        color = "always";
        display = "side-by-side";
      };
    };
  };
}
