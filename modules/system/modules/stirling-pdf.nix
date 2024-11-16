{
  services = {
    stirling-pdf = {
      enable = true;
      environment = {
        SERVER_PORT = 17834;
        SERVER_ADDRESS = "127.0.0.1";
      };
    };
  };
}
