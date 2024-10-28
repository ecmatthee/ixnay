{ config, ...}:

{
  services = {
    cloudflare-dyndns = {
      enable = true;
      proxied = false;
      domains = [
        "ecmatthee.com"
        "www.ecmatthee.com"
        "immich.ecmatthee.com"
        "jelly.ecmatthee.com"
        "pdf.ecmatthee.com"
        "radicale.ecmatthee.com"
        "mealie.ecmatthee.com"
        "paperless.ecmatthee.com"
      ];
      apiTokenFile = "${config.sops.templates."ddns.conf".path}";
    };
  };
}
