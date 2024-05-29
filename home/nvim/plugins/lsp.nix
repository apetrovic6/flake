{ config, pkgs, ... }:

{
  programs.nixvim.plugins.lsp = {
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
} 
