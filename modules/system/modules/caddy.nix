{config, ...}:

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
            reverse_proxy http://${builtins.toString config.services.immich.host}:${builtins.toString config.services.immich.port}
          '';
        };
        "jelly.ecmatthee.com" = {
          extraConfig = ''
            reverse_proxy http://127.0.0.1:8096
          '';
        };
        "pdf.ecmatthee.com" = {
          extraConfig = ''
            reverse_proxy http://${builtins.toString config.services.stirling-pdf.environment.SERVER_ADDRESS}:${builtins.toString config.services.stirling-pdf.environment.SERVER_PORT}
          '';
        };
        "radicale.ecmatthee.com" = {
          extraConfig = ''
            reverse_proxy http://${builtins.toString (builtins.elemAt config.services.radicale.settings.server.hosts 0)}
          '';
        };
        "mealie.ecmatthee.com" = {
          extraConfig = ''
            reverse_proxy http://${builtins.toString config.services.mealie.listenAddress}:${builtins.toString config.services.mealie.port}
          '';
        };
        "llm.ecmatthee.com" = {
          extraConfig = ''
            reverse_proxy http://${builtins.toString config.services.open-webui.host}:${builtins.toString config.services.open-webui.port}
          '';
        };
      };
    };
  };
}
