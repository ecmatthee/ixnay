{
  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
      ports = [
        22
        # 17382
      ];
      openFirewall = false;
    };
  };
}
