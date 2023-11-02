{
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [
        7777
        7778
        8777
        9777
        13000
        14000
        14001
        41675
        41676
        28900
        28910
      ];
      allowedUDPPorts = [
        7777
        7778
        8777
        9777
        13000
        14000
        14001
        41675
        41676
        27900
      ];
    };
  };
}
