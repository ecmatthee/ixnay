{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      wireguard-tools
      #mullvad-vpn
    ];
  };
  
  #systemd = {
  #  network = {
  #    netdevs = {
  #      "10-wg0" = {
  #        netdevConfig = {
  #          Kind = "wireguard";
  #          Name = "wg0";
  #          MTUBytes = "1300";
  #        };
  #        # See also man systemd.netdev (also contains info on the permissions of the key files)
  #        wireguardConfig = {
  #          PrivateKeyFile = "/run/keys/wireguard-privkey";
  #          ListenPort = 9918;
  #        };
  #        wireguardPeers = [{
  #          wireguardPeerConfig = {
  #            PublicKey = "5JMPeO7gXIbR5CnUa/NPNK4L5GqUnreF0/Bozai4pl4=";
  #            AllowedIPs = [ "0.0.0.0/0,::0/0" ];
  #            Endpoint = "185.213.154.66:51820"; #se=got-wg-001
  #          };
  #        }];
  #      };
  #    };

  #    networks.wg0 = {
  #      matchConfig.Name = "wg0";
  #      # IP addresses the client interface will have
  #      address = [
  #        "10.66.105.125/32"
  #        "fc00:bbbb:bbbb:bb01::3:697c/128"
  #      ];
  #      dns = [ "100.64.0.7" ];
  #      #ntp = [ "fc00::123" ];
  #      #gateway = [
  #      #  "fc00::1"
  #      #  "10.100.0.1"
  #      #];
  #      networkConfig = {
  #        DNSDefaultRoute = "yes";
  #        domains = [ "~." ];
  #      };
  #    };
  #  };
  #};

  #services = {
  #  mullvad-vpn = {
  #    enable = true;
  #  };
  #};
}
