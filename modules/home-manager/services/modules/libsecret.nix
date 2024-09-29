{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libsecret
  ];
}

