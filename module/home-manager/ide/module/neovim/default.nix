{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodePackages.vscode-langservers-extracted
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      extraLuaConfig = builtins.readFile ./config/settings.lua;
      plugins = with pkgs.vimPlugins; [
        # Libs
        {
          plugin = plenary-nvim;
        }
        {
          plugin = nui-nvim;
        }
        {
          plugin = nvim-web-devicons;
        }

        # LSP
        {
          plugin = nvim-lspconfig;
          type = "lua";
          config = builtins.readFile ./config/plugins/lspconfig.lua;
        }
        {
          plugin = typst-vim;
        }
        {
          plugin = neodev-nvim;
        }
        {
          plugin = conjure;
          #type = "lua";
          #config = builtins.readFile ./config/plugins/toggleterm.lua;
        }
        {
          plugin = scnvim;
        }

        # Treesitter
        {
          plugin = nvim-treesitter.withAllGrammars;
          type = "lua";
          config = builtins.readFile ./config/plugins/treesitter.lua;
        }
        {
          plugin = rainbow-delimiters-nvim;
          type = "lua";
          config = builtins.readFile ./config/plugins/rainbow-delimiters.lua;
        }

        # Completion
        {
          plugin = nvim-cmp;
          type = "lua";
          config = builtins.readFile ./config/plugins/nvim-cmp.lua;
        }
        {
          plugin = cmp-nvim-lsp; 
        }
        {
          plugin = cmp-buffer; 
        }
        {
          plugin = cmp-path; 
        }
        {
          plugin = cmp-cmdline; 
        }
        {
          plugin = luasnip;
          type = "lua";
          config = builtins.readFile ./config/plugins/luasnip.lua;
        }
        {
          plugin = cmp_luasnip;
        }
        {
          plugin = friendly-snippets;
        }

        # DAP
        {
          plugin = nvim-dap;
        }

        # Utils
        {
          plugin = trouble-nvim;
        }
        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile ./config/plugins/telescope.lua;
        }
        {
          plugin = mini-nvim;
          type = "lua";
          config = builtins.readFile ./config/plugins/mini.lua;
        }
        {
          plugin = sort-nvim;
          type = "lua";
          config = builtins.readFile ./config/plugins/sort.lua;
        }
        {
          plugin = mkdir-nvim;
        }
        {
          plugin = toggleterm-nvim;
          type = "lua";
          config = builtins.readFile ./config/plugins/toggleterm.lua;
        }

        #{
        #  plugin = hardtime-nvim;
        #  type = "lua";
        #  config = ''
        #    require("hardtime").setup()
        #  '';
        #}

        # UI
        {
          plugin = kanagawa-nvim;
          type = "lua";
          config = builtins.readFile ./config/plugins/theme.lua;
        }
        #{
        #  plugin = noice-nvim;
        #  type = "lua";
        #  config = builtins.readFile ./config/plugins/noice.lua;
        #}
        #{
        #  plugin = nvim-notify;
        #}
        #{
        #  plugin = heirline-nvim;
        #  type = "lua";
        #  config = builtins.readFile ./config/plugins/heirline.lua;
        #}
      ];
    };
  };
}
