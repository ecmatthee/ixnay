{
  networking = {
    dhcpcd = {
      enable = false;
    };
    nameservers = [
      "1.1.1.1"
      #"9.9.9.9"
      #"8.8.8.8"
    ];
    useDHCP = false;
    useNetworkd = true;
    wireless = {
      iwd = {
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
    };
  };

  services = {
    resolved = {
      enable = true;
      dnssec = "false";
      llmnr = "true";
      domains = [ "~." ];
      fallbackDns = [
        "1.1.1.1#cloudflare-dns.com"
        #"9.9.9.9#dns.quad9.net"
        #"8.8.8.8#dns.google"
        #"2620:fe::9#dns.quad9.net"
        "2606:4700:4700::1111#cloudflare-dns.com"
        #"2001:4860:4860::8888#dns.google"
      ];
      extraConfig = ''
        DNSOverTLS=yes
        MulticastDNS=false
      '';
    };
  };

  systemd = {
    network = {
      enable = true;
      wait-online.enable = false;
      networks = {
        "30-wired-universal" = {
          matchConfig = {
            Name = "en*";
          };
          networkConfig = {
            DHCP = "yes";
          };
          dhcpV4Config = {
            RouteMetric = 10;
            UseDNS = "false";
          };
          dhcpV6Config = {
            RouteMetric = 10;
          };
        };

        "35-wireless-universal" = {
          matchConfig = {
            Name = "wl*";
          };
          networkConfig = {
            DHCP = "yes";
            IgnoreCarrierLoss = "3s";
          };
          dhcpV4Config = {
            RouteMetric = 20;
            UseDNS = "false";
          };
          dhcpV6Config = {
            RouteMetric = 20;
          };
        };
      };
    };
  };
}
