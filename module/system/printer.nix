{ pkgs, ... }:

{
  # Scanning Setup
  hardware = {
    sane = {
      enable = true;
    };
  };

  services = {
    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
    };

    # Cups Setup
    # Web config accessible on http://localhost:631/
    printing = {
      enable = true;
      drivers = with pkgs; [
        brlaser
        brgenml1lpr
        brgenml1cupswrapper
      ];
    };
  };
}
