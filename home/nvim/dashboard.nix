{ config, pkgs, ... }:

{
  programs.nixvim.plugins = {
     startup = {
       enable = true;



parts = [
  "header"
  "body"
  "footer"
];


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
    #margin = 5;
    oldfilesAmount = 0;
    title = "Srbija do Tokija";
    type = "mapping";
   content = [
     [
       " New File"
       "enew"
       "n"
     ]
      [
        " Find File "
        "Telescope find_files"
        "f"
      ]

      [
        "󰍉 Find Word"
        "Telescope live_grep"
        "w"
      ]

      [
        " File Browser"
        "Telescope file_browser"
        "e"
      ]

      [
        " Colorschemes "
        "Telescope colorscheme"
        "cs"
      ]
      
      [
        " Quit"
        "q"
        "q"
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

  footer = {
    align = "center";
    defaultColor = "";
    foldSection = false;
    highlight = "Statement";
    margin = 50;
    oldfilesAmount = 0;
    type = "text";
    content = ["Ooga Booga"];
   
  };

     };


     };
  };
}
