{ config, pkgs, ... }:

{
  programs.nixvim.plugins.noice = {
    enable = true;

    cmdline.enabled = true;
    health.checker = true;
  };

  programs.nixvim.keymaps = [
    {
      action = "<cmd>Noice history<cr>";
      key = "gnn";
      options.desc = "Message History";
    }
    {
      action = "<cmd>Noice last<cr>";
      key = "gnl";
      options.desc = "Show last message";
    }
    {
      action = "<cmd>Noice dismiss<cr>";
      key = "gnd";
      options.desc = "Dismiss all visible messages";
    }
    {
      action = "<cmd>Noice telescope<cr>";
      key = "gnt";
      options.desc = "Open message history in telescope";
    }

  ];
}
