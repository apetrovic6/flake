{ config, pkgs, inputs, ... }:

{
  imports = [
    ./dashboard.nix
    ./plugins/toggleterm.nix
    ./plugins/telescope.nix
    ./plugins/harpoon.nix
    ./plugins/which-key.nix
    ./plugins/lsp.nix
    ./plugins/nvim-tree.nix
    ./plugins/cmp.nix
    ./plugins/trouble.nix
    ./plugins/noice.nix
    ./plugins/todo-comments.nix
    ./plugins/lazygit.nix
    ./plugins/lint.nix
    ./plugins/spectre.nix
    ./plugins/bufferline.nix
    ./plugins/cmp.nix
    ./plugins/dap.nix
    ./plugins/lspsaga.nix
    ./plugins/none-ls.nix
  ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      termguicolors = true;
      fillchars = "eob: ,fold: ,vert:│";
      autoindent = true;
      expandtab = true;
      smartcase = true;
      smartindent = true;
      wrap = false;
      swapfile = false;
    };

    plugins = {
      lazy.enable = true;
      lsp-format.enable = true;
      lualine.enable = true;
      oil.enable = true;
      gitgutter.enable = true;
      multicursors.enable = true;
      fzf-lua.enable = true;
      luasnip.enable = true;
      nix.enable = true;
      nix-develop.enable = true;
      notify.enable = true;
      #      qmk.enable = true;
      indent-o-matic.enable = true;
      indent-blankline = {
        enable = true;

        settings = {
          debounce = 1000;
          scope = {
            enabled = true;
            show_start = false;
            injected_languages = true;
          };
        };
      };
    };

    plugins.lspkind = {
      enable = true;
      cmp.enable = true;
    };

    plugins.nvim-colorizer.enable = true;

    plugins.leap = { enable = true; };

    plugins.barbecue = { enable = true; };

    plugins.dressing = {
      enable = true;

    };

    plugins.treesitter = {
      enable = true;
      nixvimInjections = true;
      indent = true;
    };

    plugins.treesitter-context.enable = true;

    keymaps = [

      {
        action = "<cmd>wincmd j<cr>";
        key = "<c-e>";
        options.desc = "Focus Down Split";
      }

      {
        action = "<cmd>wincmd k<cr>";
        key = "<c-i>";
        options.desc = "Focus Up Split";
      }

      {
        action = "<cmd>wincmd l<cr>";
        key = "<c-o>";
        options.desc = "Focus Right Split";
      }

      {
        action = "<cmd>wincmd h<cr>";
        key = "<c-n>";
        options.desc = "Focus Left Split";
      }

      {
        action = "<cmd>only<cr>";
        key = "<leader>wo";
        options.desc = "Close all other windows";
      }

      {
        action = "<cmd>split<cr>";
        key = "<leader>wh";
        options.desc = "Horizontal Split";
      }

      {
        action = "<cmd>vs<cr>";
        key = "<leader>wv";
        options.desc = "Vertical Split";
      }
    ];

    clipboard.providers.wl-copy.enable = true;

    #  colorschemes.gruvbox.enable = true;
    # colorschemes.nord.enable = true;

  };

}
