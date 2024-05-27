{ config, pkgs, inputs, ... }:

{
  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      termguicolors = true;
    };

    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      oil.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;
      nvim-tree.enable = true;
      nix.enable = true;
      nix-develop.enable = true;
      notify.enable = true;

      harpoon = {
        enable = true;
        enableTelescope = true;

        keymaps =  { # TODO: Add the rest of keymap
          addFile = "<leader>ha";
          cmdToggleQuickMenu = "<leader>hm";
        };

      };
    };


    plugins.which-key = {
      enable = true;

      registrations = {
        "<leader>f" ="Find files";
        "<leader>e" = "Explorer";
        "<leader>w" = "Window";
        "<leader>h" = "Harpoon";
      };
    };

   plugins.cmp = {
     enable = true;
     autoEnableSources = true;

     settings.sources = [
       { name = "nvim_lsp"; }
       { name = "path"; }
       { name = "buffer"; }
     ];
   }; 


    plugins.lsp = {
      enable = true;
      servers =  {
	tsserver.enable = true;
	lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
	};

        rust-analyzer = {
	  enable = true;
	  installCargo = false;
          installRustc = false;
	};
        
	clangd.enable = true;

	cmake.enable = true;

	gopls.enable = true;

	omnisharp.enable = true;
      };


      keymaps.diagnostic =  {
       "<leader>j" = "goto_next";
       "<leader>k" = "goto_prev";
      };
    };


 keymaps = [
    {
      action = "<cmd>lua require('telescope.builtin').live_grep()<CR>";
      key = "<leader>fg";
      options.desc = "Live Grep";
    }

    {
      action = "<cmd>lua require('telescope.builtin').find_files()<cr>";
      key = "<leader>ff";
      options.desc = "Find files";
    }

    {
      action = "<cmd>lua require('telescope.builtin').buffers()<cr>";
      key = "<leader>fb";
      options.desc = "Find Buffers";
    }

    {
      action = "<cmd>lua require('telescope.builtin').help_tags()<cr>";
      key = "<leader>fh";
      options.desc = "Find Help Tags";
    }

    {
      action = "<cmd>NvimTreeToggle<cr>";
      key = "<leader>ee";
      options.desc = "Toggle Nvim Tree";
    }
    
    {
      action = "<cmd>NvimTreeFocus<cr>";
      key = "<leader>ef";
      options.desc = "Focus Nvim Tree";
    }

    {
      action = "<cmd>NvimTreeFindFile<cr>";
      key = "<leader>eff";
      options.desc = "Find File";
    }
    
    {
      action = "<cmd>NvimTreeCollapse<cr>";
      key = "<leader>ec";
      options.desc = "Tree Collapse";
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
