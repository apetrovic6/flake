{ config, pkgs, ... }:

{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    sources = {
      formatting = {
        nixfmt.enable = true;
        markdownlint.enable = true;
        shellharden.enable = true;
        clang_format.enable = true;
        gofmt.enable = true;
        prettierd.enable = true;
        stylua.enable = true;
        csharpier.enable = true;
        dart_format.enable = true;
      };
    };
  };
}
