{ pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      hdparm
      smartmontools
      e2fsprogs
    ];
  };
}
