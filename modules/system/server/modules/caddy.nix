{
  networking = {
    firewall = {
      allowedTCPPorts = [
        80
        443
      ];
    };
  };

  services = {
    caddy = {
      enable = true;
      email = "ebert@ecmatthee.com";
      virtualHosts = {
        "ecmatthee.com" = {
          extraConfig = ''
            respond "Hello, world!"
          '';
          serverAliases = [
            "www.ecmatthee.com"
          ];
        };
        "immich.ecmatthee.com" = {
          extraConfig = ''
            reverse_proxy http://127.0.0.1:3001
          '';
        };
        "jelly.ecmatthee.com" = {
          extraConfig = ''
            reverse_proxy http://127.0.0.1:8096
          '';
        };
        "pdf.ecmatthee.com" = {
          extraConfig = ''
            reverse_proxy http://127.0.0.1:17834
          '';
        };
        "radicale.ecmatthee.com" = {
          extraConfig = ''
            reverse_proxy http://127.0.0.1:5232
          '';
        };
        "mealie.ecmatthee.com" = {
          extraConfig = ''
            reverse_proxy http://127.0.0.1:22364
          '';
        };
        "paperless.ecmatthee.com" = {
          extraConfig = ''
            reverse_proxy http://127.0.0.1:28981
          '';
        };
      };
    };
  };
}
