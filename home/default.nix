{ config, pkgs, lib, userSettings, inputs, ...}:

{
   imports = [
     inputs.hyprland.homeManagerModules.default
     ./hypr 
     ./starship
     ./shell-config.nix
   ];

    home.username = userSettings.username;
    home.homeDirectory = "/home/${userSettings.username}";


    home.packages = with pkgs; [
      htop
      btop
      curl
      tree
      zoxide
      protonup
      ripgrep
      unzip
      p7zip
      jq
      fzf
      nmap
      usbutils
    ];

    programs.git = {
      enable = true;
      userName = userSettings.gitUsername;
      userEmail = userSettings.gitEmail;
    };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };

 # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

 
 # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 13;
	normal =  {
          family = "FiraCodeNerdFont";
	  style = "Retina";
	};

};
     window = {
	padding =  {
	  x = 15;
	  y = 15;
	};

	};
   #     draw_bold_text_with_bright_colors = true;
scrolling.multiplier = 5;
      selection.save_to_clipboard = true;

      };
          };

#   programs.neovim = {
#    enable = true;
#
#    viAlias = true;
#    vimAlias = true;
#    vimdiffAlias = true;
#   }

#    programs.nixvim = {
#      enable = true;
#      defaultEditor = true;
#    };

#  xdg = {
#   userDirs = {
#      enable = true;
#      createDirectories = true;
#    };
#  };


  xdg.enable = true;


  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

dconf.settings = {
  "org/virt-manager/virt-manager/connections" = {
    autoconnect = ["qemu:///system"];
    uris = ["qemu:///system"];
  };
};


home.file = {
    ".config/fastfetch/config.jsonc" = {
      source = ./fastfetch/config.jsonc;
    };

     ".ideavimrc" = {
      source = ./ideavimrc;
    };

  };


   home.stateVersion = "23.11";

    programs.home-manager.enable = true;
}
