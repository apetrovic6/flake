{config, pkgs, ...}:

{
  programs.nixvim.plugins = {
    bufferline = {
      enable = true;

      alwaysShowBufferline = true;
      showTabIndicators = true;
      themable = true;
      numbers = "ordinal";
      # mode = "tabs";
    };
  };

  programs.nixvim.keymaps = [
    {
      action = "<cmd>BufferLineTogglePin<cr>";
      key = "<leader>bp";
      options.desc = "Toggle Pin";
    }
    {
      action = "<cmd>BufferLineGroupClose ungrouped<cr>";
      key = "<leader>bP";
      options.desc = "Delete Non-Pinned Buffers";
    }
    {
      action = "<cmd>BufferLineCloseOthers<cr>";
      key = "<leader>bo";
      options.desc = "Delete Other Buffers";
    }
    {
      action = "<cmd>BufferLineCloseRight<cr>";
      key = "<leader>br";
      options.desc = "Delete Buffers to the Right";
    }
    {
      action = "<cmd>BufferLineCloseLeft<cr>";
      key = "<leader>bl";
      options.desc = "Delete Buffers to the Left";
    }
    {
      action = "<cmd>BufferLineCyclePrev<cr>";
      key = "<s-n>";
      options.desc = "Previous Buffer";
    }
    {
      action = "<cmd>BufferLineCycleNext<cr>";
      key = "<s-o>";
      options.desc = "Next Buffer";
    }

  ];
}

