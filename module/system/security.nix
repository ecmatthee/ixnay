{
  security = {
    pam.services.swaylock.text = ''
      # PAM configuration file for the swaylock screen locker. By default, it includes
      # the 'login' configuration file (see /etc/pam.d/login)
      auth include login
    '';
    polkit.enable = true;
    rtkit.enable = true;
    sudo = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = true;
      extraConfig = ''
        Defaults lecture = never
        Defaults insults
      '';
    };
  };
}
