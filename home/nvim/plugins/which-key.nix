{ config, pkgs, ... }:

{
  programs.nixvim.plugins.which-key = {
     enable = true;

     registrations = {
        "<leader>f" = "Files";
        "<leader>e" = "Explorer";
        "<leader>w" = "Window";
        "<leader>h" = "Harpoon";
        "<leader>t" = "Trouble";
        "<leader>c" = "Comment";
        "<leader>g" = "Git";
        "<leader>b" = "Buffers";
        "<leader>fs" = "Search / Replace";
      };
  };
}