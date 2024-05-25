{ config, pkgs, inputs, ... }:

{
  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    plugins = {
      lualine.enable = true;
      telescope.enable = true;
      oil.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;
      which-key.enable = true;
      nvim-tree.enable = true;
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
        
      };


      keymaps.diagnostic =  {
       "<leader>j" = "goto_next";
       "<leader>k" = "goto_prev";
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

 keymaps = [
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>fg";
    }

    {
      action = "<cmd>Telescope find_files<cr>";
      key = "<leader>ff";
    }

    {
      action = "<cmd>Telescope buffers<cr>";
      key = "<leader>fb";
    }

    {
      action = "<cmd>Telescope help_tags<cr>";
      key = "<leader>fh";
    }

  ];

  clipboard.providers.wl-copy.enable = true;

    colorschemes.gruvbox.enable = true;
#    colorschemes.nord.enable = true;

  };

}
