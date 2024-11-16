{
  programs = {
    msmtp = {
      enable = true;
      setSendmail = true;
      defaults = {
        aliases = "/etc/aliases";
        port = 465;
        auth = true;
        tls = "on";
        tls_starttls = "off";
        tls_trust_file = "/etc/ssl/certs/ca-certificates.crt";
      };
      accounts = {
        default = {
          host = "smtp.gmail.com";
          from = "herald.srv@gmail.com";
          user = "herald.srv@gmail.com";
          password = "vndcfwlaskdxhens";
        };
      };
    };
  };
 
  environment = {
    etc = {
      "aliases" = {
        enable = true;
        source = ../data/aliases;
        mode = "0644";
      };
    };
  };
}
