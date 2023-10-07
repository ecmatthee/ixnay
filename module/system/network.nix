{pkgs, ...}:

{
  # TODO VPN Setup
  environment = {
    systemPackages = with pkgs; [
      wireguard-tools
    ];
  };

  networking = {
    nameservers = [
      "9.9.9.9"
      "1.1.1.1"
      "8.8.8.8"
    ];
    enableIPv6 = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        8080
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
        8080
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
    dhcpcd = {
      enable = false;
    };

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
  };

  systemd = {
    network = {
      enable = true;
      wait-online.enable = false;
      #netdevs = {
      #  "10-wg0" = {
      #    netdevConfig = {
      #      Kind = "wireguard";
      #      Name = "wg0";
      #      MTUBytes = "1300";
      #    };
      #    # See also man systemd.netdev (also contains info on the permissions of the key files)
      #    wireguardConfig = {
      #      PrivateKeyFile = "/run/keys/wireguard-privkey";
      #      ListenPort = 9918;
      #    };
      #    wireguardPeers = [{
      #      wireguardPeerConfig = {
      #        PublicKey = "5JMPeO7gXIbR5CnUa/NPNK4L5GqUnreF0/Bozai4pl4=";
      #        AllowedIPs = [ "0.0.0.0/0,::0/0" ];
      #        Endpoint = "185.213.154.66:51820"; #se=got-wg-001
      #      };
      #    }];
      #  };
      #};

      #networks.wg0 = {
      #  matchConfig.Name = "wg0";
      #  # IP addresses the client interface will have
      #  address = [
      #    "10.66.105.125/32"
      #    "fc00:bbbb:bbbb:bb01::3:697c/128"
      #  ];
      #  dns = [ "100.64.0.7" ];
      #  #ntp = [ "fc00::123" ];
      #  #gateway = [
      #  #  "fc00::1"
      #  #  "10.100.0.1"
      #  #];
      #  networkConfig = {
      #    DNSDefaultRoute = "yes";
      #    domains = [ "~." ];
      #  };
      #};

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

  services = {
    resolved = {
      enable = true;
      dnssec = "true";
      domains = [ "~." ];
      fallbackDns = [
        "9.9.9.9#dns.quad9.net"
        "1.1.1.1#cloudflare-dns.com"
        "8.8.8.8#dns.google"
        "2620:fe::9#dns.quad9.net"
        "2606:4700:4700::1111#cloudflare-dns.com"
        "2001:4860:4860::8888#dns.google"
      ];
      extraConfig = ''
        DNSOverTLS=yes
      '';
    };

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
      ports = [
        #22
        17382
      ];
      openFirewall = true;
    };

    jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };
}
