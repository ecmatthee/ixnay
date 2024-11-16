{ config, ...}:

{
  services = {
    cloudflare-dyndns = {
      enable = true;
      proxied = false;
      domains = builtins.attrNames config.services.caddy.virtualHosts ++ [
        # TODO Figure out how to itterate over aliases
        "www.ecmatthee.com"
      ];
      apiTokenFile = "${config.sops.templates."ddns.conf".path}";
    };
  };
}
