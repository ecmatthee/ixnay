{ config, ... }:

{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age = {
      keyFile = "/nix/secret/age/keys.txt";
    };

    secrets = {
      "api/cloudflare" = {};
      "service/radicale/username" = {};
      "service/radicale/bcrypt" = {};
      "service/paperless" = {};
      "user/ecm" = {
        neededForUsers = true;
      };
      "zfs/pi/data" = {};
      "zfs/pi/media" = {};
    };
    templates = {
      "ddns.conf" = {
        content = ''
          CLOUDFLARE_API_TOKEN=${config.sops.placeholder."api/cloudflare"}
        '';
        path = "/var/lib/sops/ddns.conf";
      };
      "radicale.htpasswd" = {
        owner = "radicale";
        content = ''
          ${config.sops.placeholder."service/radicale/username"}:${config.sops.placeholder."service/radicale/bcrypt"}
        '';
        path = "/var/lib/sops/radicale.htpasswd";
      };
    };
  };
}
