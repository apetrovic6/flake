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
        "<c-/>" = "Terminal";
      };
  };
}
