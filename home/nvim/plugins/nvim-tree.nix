{ config, pkgs, ... };

{
  programs.nixvim =  {
    plugins.nvim-tree.enable = true;
  };

  keymaps = [
    {
      action = "<cmd>NvimTreeToggle<cr>";
      key = "<leader>ee";
      options.desc = "Toggle Nvim Tree";
    }
    
    {
      action = "<cmd>NvimTreeFocus<cr>";
      key = "<leader>ef";
      options.desc = "Focus Nvim Tree";
    }

    {
      action = "<cmd>NvimTreeFindFile<cr>";
      key = "<leader>eff";
      options.desc = "Find File";
    }
    
    {
      action = "<cmd>NvimTreeCollapse<cr>";
      key = "<leader>ec";
      options.desc = "Tree Collapse";
    }

  ];
}
