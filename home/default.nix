{ config, pkgs, userSettings, ...}:

{
   imports = [
     ./hyprlandconf.nix 
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
    ];

    programs.git = {
      enable = true;
      userName = userSettings.gitUsername;
      userEmail = userSettings.gitEmail;
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


  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };


dconf.settings = {
  "org/virt-manager/virt-manager/connections" = {
    autoconnect = ["qemu:///system"];
    uris = ["qemu:///system"];
  };
};



   home.stateVersion = "23.11";

    programs.home-manager.enable = true;
}
