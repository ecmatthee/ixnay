{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
        consoleMode = "auto";
        memtest86 = {
          enable = true;
        };
      };
      efi.canTouchEfiVariables = true;
      timeout = 5;
    };
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];
    consoleLogLevel = 3;
  };
}
