{ pkgs, ...}:

{
  environment = {
    systemPackages = with pkgs; [
      git
      p7zip
      unzip
      unrar
      openssl
      parted
      wget
      zps
    ];
  };
}
