{
  networking = {
    enableIPv6 = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        59443 #qbit
      ];
      allowedUDPPorts = [
        59443 #qbit
      ];
    };
  };
}
