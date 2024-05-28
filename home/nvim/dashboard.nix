{ config, pkgs, ... }:

{
  programs.nixvim.plugins = {
     startup = {
       enable = true;

#       theme = "dashboard";


parts = [
  "header"
  "body"
];


     userMappings =  {
       "<leader>ff" = "<cmd>Telescope find_files<CR>";
     };

     mappings =  {
  executeCommand = "<CR>";
  openFile = "o";
  openFileSplit = "<c-o>";
  openHelp = "?";
  openSection = "<TAB>";
     };

     sections = {
body = {
 defaultColor = "";
 align = "center";
    foldSection = false;
    highlight = "String";
    margin = 5;
    oldfilesAmount = 0;
    title = "Srbija do Tokija";
    type = "mapping";
   content = [
      [
        " Find File"
        "Telescope find_files"
        "<leader>ff"
      ]

      [
        "󰍉 Find Word"
        "Telescope live_grep"
        "<leader>lg"
      ]
[
        " File Browser"
        "Telescope file_browser"
        "<leader>ee"
      ]
       [
        " Colorschemes"
        "Telescope colorscheme"
        "<leader>cs"
      ]
    ];

    };
 header = {
    align = "center";
    defaultColor = "";
    foldSection = false;
    highlight = "Statement";
    margin = 50;
    oldfilesAmount = 0;
    title = "Header";
    type = "text";
    content = [
         "██╗   ██╗ ██████╗  █████╗ ██╗      █████╗     ██╗   ██╗██╗███╗   ███╗"
         "██║   ██║██╔════╝ ██╔══██╗██║     ██╔══██╗    ██║   ██║██║████╗ ████║"
         "██║   ██║██║  ███╗███████║██║     ███████║    ██║   ██║██║██╔████╔██║"
         "██║   ██║██║   ██║██╔══██║██║     ██╔══██║    ╚██╗ ██╔╝██║██║╚██╔╝██║"
         "╚██████╔╝╚██████╔╝██║  ██║███████╗██║  ██║     ╚████╔╝ ██║██║ ╚═╝ ██║"
         " ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝      ╚═══╝  ╚═╝╚═╝     ╚═╝"

    ]; 
  };

     };


     };
  };
}
