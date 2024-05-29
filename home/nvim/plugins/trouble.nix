{ config, pkgs, ... }:

{
  programs.nixvim.plugins.trouble = {
    enable = true;

    settings = {
      position = "bottom";
      width = 50;
    };
  };


  programs.nixvim.keymaps = [
    {
      action = "<cmd>TroubleToggle<cr>";
      key = "<leader>tt";
      options.desc = "Toggle Trouble";
    }
    {
      action = "<cmd>TroubleToggle workspace_diagnostics<cr>";
      key = "<leader>tw";
      options.desc = "Workspace Diagnostics";
    }
    {
      action = "<cmd>TroubleToggle document_diagnostics<cr>";
      key = "<leader>td";
      options.desc = "Document Diagnostics";
    }
    {
      action = "<cmd>TroubleToggle quickfix<cr>";
      key = "<leader>tq";
      options.desc = "Quick Fix";
    }
    {
      action = "<cmd>TroubleToggle loclist<cr>";
      key = "<leader>tl";
      options.desc = "Loc List";
    }
    {
      action = "<cmd>TroubleToggle lsp_references<cr>";
      key = "<leader>tr";
      options.desc = "Lsp References";
    }

  ];
}
