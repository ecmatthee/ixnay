{ config, ...}:

{
  services = {
    cloudflare-dyndns = {
      enable = true;
      proxied = true;
      domains = [
        "ecmatthee.com"
        "www.ecmatthee.com"
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
