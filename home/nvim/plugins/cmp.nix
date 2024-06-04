{ config, pkgs, ... }:

{
  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = true;

    settings.sources = [
      { name = "nvim_lsp"; }
      { name = "path"; }
      { name = "buffer"; }
      { name = "cmdline"; }
      { name = "nvim_lua"; }
    ];

    settings.mapping = {
      "<C-Space>" = "cmp.mapping.complete()";
      "<C-s>" = "cmp.mapping.scroll_docs(-4)";
      "<C-r>" = "cmp.mapping.scroll_docs(4)";
      "<C-l>" = "cmp.mapping.close()";
      "<C-y>" = "cmp.mapping.confirm({ select = true })";
      "<C-i>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
      "<C-e>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
    };

  };
}
