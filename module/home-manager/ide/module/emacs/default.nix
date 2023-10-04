{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libvterm
  ];

  programs = {
    emacs = {
      enable = true;
      package = pkgs.emacs29-pgtk;
      extraPackages = epkgs: with epkgs; [ 
        meow
        dashboard
        nerd-icons
        which-key
        vterm
        nix-mode
        rust-mode
        treesit-grammars.with-all-grammars
        vertico
        corfu
        cape
        orderless
        marginalia
        leaf
        leaf-keywords
        yasnippet
        yasnippet-snippets
        dirvish
      ];
      extraConfig = builtins.readFile ./init.el;
    };
  };

  services = {
    emacs = {
      enable = true;
    };
  };
}
