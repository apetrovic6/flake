{ config, pkgs, ... }:

{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      tsserver.enable = true;
      lua-ls = {
        enable = true;
        settings.telemetry.enable = false;
      };
      nixd = {
        enable = true;
        autostart = true;
      };
      jsonls.enable = true;

      cssls.enable = true;
      dartls.enable = true;
      sqls.enable = true;

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

    keymaps.diagnostic = {
      "<leader>j" = "goto_next";
      "<leader>k" = "goto_prev";
    };
    keymaps.lspBuf = {
      "gd" = "definition";
      "gD" = "references";
      "gt" = "type_definition";
      "gi" = "implementation";
      "K" = "hover";
    };

  };

}
