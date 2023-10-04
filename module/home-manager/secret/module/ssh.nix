{
  programs = {
    ssh = {
      enable = true;
      matchBlocks = {
        "github.com" = {
          hostname = "github.com";
          user = "git";
          identityFile = "/home/ecm/.ssh/github.com";
        };
      };
    };
  };
}
