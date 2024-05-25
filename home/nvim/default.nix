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
      key = "<leader>g";
    }
  ];

  clipboard.providers.wl-copy.enable = true;

#    colorschemes.gruvbox.enable = true;
    colorschemes.nord.enable = true;

  };

}
