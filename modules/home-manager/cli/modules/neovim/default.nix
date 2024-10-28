{ config, lib, inputs, ... }:
let
  utils = inputs.nixCats.utils;
in {
  config = {
    nixCats = {
      enable = true;
      nixpkgs_version = inputs.nixpkgs;
      addOverlays = /* (import ./overlays inputs) ++ */ [
        (utils.standardPluginOverlay inputs)
      ];
      packageNames = [ "nvix" ];
      luaPath = "${./.}";
      categoryDefinitions.replace = ({ pkgs, settings, categories, name, ... }@packageDef: {
        lspsAndRuntimeDeps = {
          general = with pkgs; [
            bash-language-server
            lua-language-server
            marksman
            nil
            nixd
            nixfmt-rfc-style
            rust-analyzer
            tinymist
          ];
        };
        startupPlugins = {
          general = with pkgs.vimPlugins; [
            nvim-lspconfig
            nvim-treesitter.withAllGrammars
            mini-nvim
          ];
        };
      });
      packages = {
        nvix = {pkgs , ... }: {
          settings = {
            aliases = [ "vi" "vim" "nvim" ];
            wrapRc = true;
            configDirName = "nvim";
          };
          categories = {
            general = true;
          };
        };
      };
    };
  };
}
