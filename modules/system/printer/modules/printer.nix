{ pkgs, ... }:

{
  services = {
    # TODO https://nixos.wiki/wiki/Printing#Configuration
    # NOTE Web config accessible on http://localhost:631/
    printing = {
      enable = true;
      cups-pdf = {
        enable = true;
      };
      drivers = with pkgs; [
        brlaser
        brgenml1lpr
        brgenml1cupswrapper
      ];
    };
  };
}
