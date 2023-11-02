{
  networking = {
    enableIPv6 = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        8080
      ];
      allowedUDPPorts = [
        8080
      ];
    };
  };
}
