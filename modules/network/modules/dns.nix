{
  networking = {
    nameservers = [
      "9.9.9.9"
      "1.1.1.1"
      "8.8.8.8"
    ];
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
  };
}
