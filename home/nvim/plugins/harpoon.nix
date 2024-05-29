{ pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      harpoon = {
        enable = true;
        enableTelescope = true;

        keymaps =  { # TODO: Add the rest of keymap
          addFile = "<leader>ha";
          cmdToggleQuickMenu = "<leader>hm";
        };
      };
    };
  };
}
