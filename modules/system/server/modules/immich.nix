let
  db = "immich";
in
{
  services = {
    immich = {
      enable = true;
      host = "localhost";
      port = 3001; # 3003 is used by machine learninig
      user = db;
      group = db;
      database = {
        name = db;
        user = db;
        createDB = true; # Handles Postgres Setup
      };
      openFirewall = false;
      mediaLocation = "/var/lib/immich";
    };
    postgresqlBackup = {
      databases = [
        db
      ];
    };
  };
}
