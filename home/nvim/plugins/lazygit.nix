{ config, pkgs, ...}:

{
  programs.nixvim.plugins.lazygit = {
    enable = true;
  };
  
  programs.nixvim.keymaps = [
    {
      action = "<cmd>LazyGit<cr>";
      key = "<leader>gg";
      options.desc = "LazyGit";
    }
    {
      action = "<cmd>LazyGitConfig<cr>";
      key = "<leader>gc";
      options.desc = "LazyGit Config";
    }
    {
      action = "<cmd>LazyGitCurrentFile<cr>";
      key = "<leader>gf";
      options.desc = "Open LazyGit in the project root of the current file";
    }
    {
      action = "<cmd>LazyGitFilterCurrentFile<cr>";
      key = "<leader>gff";
      options.desc = "Open buffer commits";
    }

  ];
}
