{ lib, ...}:

{
  imports = [
    ./modules/android.nix
    ./modules/audio.nix
    ./modules/boot
    ./modules/caddy.nix
    ./modules/cloudflare-dyndns.nix
    ./modules/docker.nix
    ./modules/filesystem
    ./modules/gaming
    ./modules/gnupg.nix
    ./modules/immich.nix
    ./modules/jellyfin.nix
    ./modules/mealie.nix
    ./modules/ollama.nix
    ./modules/open-webui.nix
    ./modules/openssl.nix
    ./modules/paperless.nix
    ./modules/postgresql.nix
    ./modules/printer.nix
    ./modules/radicale.nix
    ./modules/scanner.nix
    ./modules/security.nix
    ./modules/stirling-pdf.nix
    ./modules/video.nix
  ];

  ixnay.services = {
    paperless.enable = lib.mkDefault false;
  };
}
