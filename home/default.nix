{ config, pkgs, userSettings, inputs ,...}:

{
   imports = [
     inputs.hyprland.homeManagerModules.default
     ./hypr 
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
