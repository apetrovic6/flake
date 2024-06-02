{ config, pkgs, ... }:

{
    programs.nixvim.plugins.dap = {
      enable = true;


      extensions.dap-ui = {
        enable = true;
      };
        
      extensions.dap-go = {
          enable = true;    

        delve = {
           path = "dlv";
           port = "\${port}";
           args = ["dap" "-l" "127.0.0.1:\${port}"];
        };
      };

    };

    programs.nixvim.keymaps = [
      {
        action = "<cmd>lua require('dap').toggle_breakpoint()<cr>";
        key = "<leader>dt";
        options.desc = "Toggle Breakpoint";
      } 
      {
        action = "<cmd>lua require('dap').set_breakpoint()<cr>";
        key = "<leader>dB";
        options.desc = "Set Breakpoint";
      } 
      {
        action = "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>";
        key = "<leader>dp";
        options.desc = "Set Breakpoint";
      } 
      {
        action = "<cmd>lua require('dap').repl_open()<cr>";
        key = "<leader>dr";
        options.desc = "Open Repl";
      } 
      {
        action = "<cmd>lua require('dap').run_last()<cr>";
        key = "<leader>dl";
        options.desc = "Run Last";
      } 
      {
        action = "<cmd>lua require('dap.ui.widgets').hover()<cr>";
        key = "<leader>dh";
        options.desc = "Run Last";
      } 
      {
        action = "<cmd>lua require('dap.ui.widgets').preview()<cr>";
        key = "<leader>dp";
        options.desc = "Preview";
      } 
      {
        action = "<cmd>lua require('dap.ui.widgets').widgets.centered_float(dap.ui.widgets.frames)<cr>";
        key = "<leader>df";
        options.desc = "Float";
      } 
      {
        action = "<cmd>lua require('dap.ui.widgets').widgets.centered_float(dap.ui.widgets.scopes)<cr>";
        key = "<leader>ds";
        options.desc = "Scopes";
      } 
      {
        action = "<cmd>lua require('dap').continue()<cr>";
        key = "<leader>dc";
        options.desc = "Connect Debugger";
      }
      {
        action = "<cmd>lua require('dap').step_over()<cr>";
        key = "<F10>";
        options.desc = "Step Over";
      }
      {
        action = "<cmd>lua require('dap').step_into()<cr>";
        key = "<F11>";
        options.desc = "Step Into";
      }
      {
        action = "<cmd>lua require('dap').step_out()<cr>";
        key = "<F12>";
        options.desc = "Step Out";
      }

    ];
 
}

