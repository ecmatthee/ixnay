{ pkgs, lib, ... }:
let
  latestZfsCompatibleLinuxPackages = lib.pipe pkgs.linuxKernel.packages [
    builtins.attrValues
    (builtins.filter (
      kPkgs:
      (builtins.tryEval kPkgs).success
      && kPkgs ? kernel
      && kPkgs.kernel.pname == "linux"
      && !kPkgs.zfs.meta.broken
    ))
    (builtins.sort (a: b: (lib.versionOlder a.kernel.version b.kernel.version)))
    lib.last
  ];
in
{
  boot = {
    supportedFilesystems = [ "zfs" ];
    kernelPackages = latestZfsCompatibleLinuxPackages;
    zfs = {
      removeLinuxDRM = true;
      forceImportRoot = false;
    };
  };

  services = {
    zfs = {
      autoScrub = {
        enable = true;
        interval = "*-*-01,14 00:00:00 UTC";
        pools = [ ];
      };

      trim = {
        enable = true;
        interval = "*-*-07,21 00:00:00 UTC";
      };

      autoSnapshot = {
        enable = false;
        flags = "-k -p --utc";
        frequent = 4;
        hourly = 24;
        daily = 7;
        weekly = 4;
        monthly = 12;
      };

      # TODO ZED mail setup
      # https://nixos.wiki/wiki/Msmtp
      # https://nixos.wiki/wiki/ZFS
      zed = {
        settings = {
          ZED_DEBUG_LOG = "/tmp/zed.debug.log";
          ZED_EMAIL_ADDR = [ "root" ];
          ZED_EMAIL_PROG = "${pkgs.msmtp}/bin/msmtp";
          ZED_EMAIL_OPTS = "-s '@SUBJECT@' @ADDRESS@ -r herald.srv@gmail.com";

          ZED_NOTIFY_INTERVAL_SECS = 3600;
          ZED_NOTIFY_VERBOSE = true;

          ZED_USE_ENCLOSURE_LEDS = true;
          ZED_SCRUB_AFTER_RESILVER = true;
        };
        enableMail = false;
      };
    };
  };
}
