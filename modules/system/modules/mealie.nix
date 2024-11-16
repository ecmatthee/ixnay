let
  db = "mealie";
in
{
  services = {
    mealie = {
      enable = true;
      port = 22364;
      listenAddress = "127.0.0.1";
      settings = {
        ALLOW_SIGNUP = "true";
        DB_ENGINE = "postgres";
        # POSTGRES_PORT = config.services.postgresql.settings.port;
        # POSTGRES_SERVER = "/run/postgresql";
        POSTGRES_URL_OVERRIDE =
          "postgresql://" + db +":@/" + db + "?host=/run/postgresql";
      };
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
  };
}
