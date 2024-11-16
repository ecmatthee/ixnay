{ pkgs, ... }:

let
  db = [
    "cove"
  ];
  users = builtins.map (i: {
    name = i;
    ensureDBOwnership = true;
  }) db;
in {
  services = {
    postgresql = {
      enable = true;
      ensureDatabases = db;
      ensureUsers = users;
      # TODO Document
      # ++ [
      #   {
      #     name = builtins.elemAt db 0;
      #     ensureDBOwnership = true;
      #   }
      # ];
      authentication = pkgs.lib.mkOverride 10 ''
        #type  database  DBuser  address       auth-method
        local  all       all                   peer
        host   all       all     127.0.0.1/32  scram-sha-256
        host   all       all     ::1/128       scram-sha-256
      '';
      package = pkgs.postgresql_16;
      settings = {
        port = 5432;
      };
      extraPlugins = ps: with ps; [
        postgis
      ];
    };
    postgresqlBackup = {
      enable = true;
      compression = "zstd";
      location = "/var/backup/postgresql";
      databases = db;
    };
  };
}
