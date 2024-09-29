{
  programs = {
    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };
    nixvim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
      opts = {
        expandtab = true;
        tabstop = 4;
        shiftwidth = 4;
      };
      globals = {
        mapleader = ",";
      };
      extraConfigLua = builtins.readFile ./config/mini.lua;
      plugins = {
        lsp = {
          enable = true;
          servers = {
            bashls.enable = true;
            nil-ls.enable = true;
            rust-analyzer = {
              enable = true;
              installCargo = false;
              installRustc = false;
            };
            typst-lsp.enable = true;
            lua-ls.enable = true;
            marksman.enable = true;
          };
        };
        treesitter = {
          enable = true;
          settings = {
              incremental_selection.enable = true;
              ensure_installed = "all";
              indent.enable = true;
          };
          folding = true;
        };
        mini = {
          enable = true;
          modules = {
            ai = { };
            align = { };
            # animate = {};
            basics = {
              options = {
                basic = true;
                extra_ui = true;
                win_borders = "default";
              };
            };
            bracketed = {};
            bufremove = {};
            clue = {
              window = {
                delay = 250;
              };
            };
            comment = {};
            completion = {};
            cursorword = {};
            diff = {};
            extra = {};
            files = {};
            fuzzy = {};
            git = {};
            hipatterns = {};
            icons = {};
            indentscope = {};
            jump = {};
            jump2d = {};
            map = {};
            move = {};
            notify = {};
            operators = {};
            pairs = {};
            pick = {};
            sessions = {};
            splitjoin = {};
            starter = {};
            statusline = {};
            surround = {};
            tabline = {};
            trailspace = {};
            visits = {};
          };
          # mockDevIcons = true;
        };
        # fugitive = {
        #   enable = true;
        # };
        # gitsigns = {
        #   enable = true;
        # };
        # gitmessenger = {
        #   enable = true;
        # };
        # diffview = {
        #   enable = true;
        # };
        #dap = {
        #  enable = true;
        #};
        #trouble = {
        #  enable = true;
        #};
      };
      keymaps = [
        {
          mode = "n";
          key = "<leader>mt";
          action.__raw = "function() MiniTrailspace.trim(); MiniTrailspace.trim_last_lines() end";
          options = {
              desc = "Mini";
          };
        }
        {
          mode = "n";
          key = "<leader>mf";
          action.__raw = "function() MiniFiles.open() end";
          options = {
              desc = "Mini";
          };
        }
        {
          mode = "n";
          key = "<leader>gs";
          action = ":Git status<CR>";
          options = {
              desc = "git status";
          };
        }
      ];
    };
  };
}
