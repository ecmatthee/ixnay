{ lib, config, ... }:

let
  cfg = config.ixnay.services.paperless;
  db = "paperless";
in
{
  options = {
    ixnay.services.paperless.enable = lib.mkEnableOption "enables paperless server";
  };

  config = lib.mkIf cfg.enable {
    services = {
      paperless = {
        enable = false;
        port = 28981;
        passwordFile = config.sops.secrets."service/paperless".path;
        address = "127.0.0.1";
        settings = {
          PAPERLESS_ADMIN_USER = "admin";
          PAPERLESS_DBHOST = "/run/postgresql";
          PAPERLESS_DBPORT = config.services.postgresql.settings.port;
          PAPERLESS_DBNAME = db;
          PAPERLESS_DBUSER = db;
          PAPERLESS_ACCOUNT_ALLOW_SIGNUPS = false;
          PAPERLESS_TIKA_ENABLED = true;
          PAPERLESS_TIKA_ENDPOINT = "http://localhost:" +
            builtins.toString config.services.tika.port;
          PAPERLESS_TIKA_GOTENBERG_ENDPOINT = "http://localhost:" +
            builtins.toString config.services.gotenberg.port;
          PAPERLESS_OCR_LANGUAGE = "eng+afr";
        };
      };

      tika = {
        enable = true;
        listenAddress = "127.0.0.1";
        port = 19998;
      };

      gotenberg = {
        enable = true;
        port = 23678;
      };

      postgresql = {
        ensureDatabases = [ db ];
        ensureUsers = [
          {
            name = db;
            ensureDBOwnership = true;
          }
        ];
      };

      postgresqlBackup = {
        databases = [
          db
        ];
      };
      caddy = {
        virtualHosts = {
          "paperless.ecmatthee.com" = {
            extraConfig = ''
              reverse_proxy http://${builtins.toString config.services.paperless.address}:${builtins.toString config.services.paperless.port}
            '';
          };
        };
      };
    };
  };
}
