{ config, ... }:

{
  users = {
    mutableUsers = false;
    users = {
      ecm = {
        hashedPasswordFile = config.sops.secrets."user/ecm".path;
        isNormalUser = true;
        extraGroups = [ "wheel" "scanner" "lp" "docker" "adbusers"];
      };
    };
  };
}
