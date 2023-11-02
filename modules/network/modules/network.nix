{
  networking = {
    wireless.iwd = {
      enable = true;
      settings = {
        Network = {
          EnableIPv6 = true;
          RoutePriorityOffset = 300;
        };
        Settings = {
          AutoConnect = true;
        };
      };
    };
    dhcpcd = {
      enable = false;
    };
  };

  systemd = {
    network = {
      enable = true;
      wait-online.enable = false;
      networks."30-wired-universal" = {
        matchConfig = {
          Name = "en*";
        };
        networkConfig = {
          DHCP = "yes";
        };
        dhcpV4Config = {
          RouteMetric = 10;
        };
        dhcpV6Config = {
          RouteMetric = 10;
        };
        dns = [
          "9.9.9.9"
          "1.1.1.1"
        ];
      };

      networks."35-wireless-universal" = {
        matchConfig = {
          Name = "wl*";
        };
        networkConfig = {
          DHCP = "yes";
          IgnoreCarrierLoss = "3s";
        };
        dhcpV4Config = {
          RouteMetric = 20;
        };
        dhcpV6Config = {
          RouteMetric = 20;
        };
        dns = [
          "9.9.9.9"
          "1.1.1.1"
        ];
      };
    };
  };
}
