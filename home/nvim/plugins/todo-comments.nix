{ config, pkgs, ... }:

{
  programs.nixvim.plugins.todo-comments = {
    enable = true;

  };

  programs.nixvim.keymaps = [
    {
      action = "<cmd>TodoTelescope<cr>";
      key = "<leader>ct";
      options.desc = "Todo Telescope";
    }
    {
      action = "<cmd>TodoQuickFix<cr>";
      key = "<leader>cq";
      options.desc = "Todo QuicFix";
    }
    {
      action = "<cmd>TodoLocList<cr>";
      key = "<leader>cl";
      options.desc = "Todo LocList";
    }
    {
      action = "<cmd>TodoTrouble<cr>";
      key = "<leader>ctr";
      options.desc = "Todo Trouble";
    }
    {
      action = "<cmd>TodoTrouble<cr>";
      key = "<leader>ct";
      options.desc = "Todo Trouble";
    }
    # {
    #   action = "<cmd>lua require('todo-comments').jump_next() end<cr>";
    #   key = "<leader>cn";
    #   options.desc = "Next Todo";
    # }
    # {
    #   action = "<cmd>lua require('todo-comments').jump_prev() end<cr>";
    #   key = "<leader>cp";
    #   options.desc = "Previous Todo";
    # }
  ];

}
