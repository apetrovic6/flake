{ config, pkgs, ... }:

{
  programs.waybar.settings.mainBar = {
        "hyprland/workspaces" = {
            format = "{icon} {windows}";
            all-outputs = true;
            on-click = "activate";
            format-icons = {
              active = "󰮯";
              default = "󰊠";
	      persistent = "󰊠";
            };
            persistent-workspaces = {
              "1" = [];
              "2" = [];
              "3" = [];
              "4" = [];
              "5" = [];
              "6" = [];
              "7" = [];
              "8" = [];
              "9" = [];
              "10" = [];
            };
    
           "window-rewrite-default" = " ";
           "window-rewrite" = {
		"title<.*youtube.*>" = " ";
		"class<thunar>" = "󰝰 ";
	    };
        };
  };
}
