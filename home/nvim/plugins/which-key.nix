{
  programs.nixvim.plugins.which-key = {
    enable = true;

    registrations = {
      "<leader>f" = "Find";
      "<leader>e" = "Explorer";
      "<leader>w" = "Window";
      "<leader>h" = "Harpoon";
      "<leader>t" = "Trouble";
      "<leader>c" = "Comment";
      "<leader>g" = "Git";
      "<leader>b" = "Buffers";
      "<leader>s" = "Search / Replace";
      "<leader>d" = "Debug";
      "<leader>l" = "LSP";
      "<leader>lg" = "Go To";
      "<leader>u" = "Flutter";

      "<C-Space>" = "Complete Completion";
      "<C-s" = "Scroll Docs Down";
      "<C-r>" = "Scroll Docs Up";
      "<C-l>" = "Close Completion Window";
      "<C-y>" = "Confirm Selection";
      "<C-i" = "Select Previous Completion Item";
      "<C-e>" = "Select Next Completion Item";
    };
  };
}
