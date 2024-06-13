{ config, pkgs, lib, userSettings, inputs, ... }:
let nixvim = inputs.nixvim.packages."x86_64-linux".default;

in {
  imports = [
    inputs.hyprland.homeManagerModules.default
    #    inputs.nixvim.nixvim.homeManagerModules.nixvim
    ./hypr
    ./starship
    ./alacritty
    ./shell-config.nix
    ./waybar
  ];

  stylix.targets.waybar.enableCenterBackColors = true;
  stylix.targets.waybar.enableLeftBackColors = true;
  stylix.targets.waybar.enableRightBackColors = true;

  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  home.packages = [
    pkgs.htop
    pkgs.btop
    pkgs.curl
    pkgs.tree
    pkgs.zoxide
    pkgs.protonup
    pkgs.ripgrep
    pkgs.unzip
    pkgs.p7zip
    pkgs.jq
    pkgs.fzf
    pkgs.nmap
    pkgs.usbutils
    nixvim
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

  xdg = {
    enable = true;
    #   userDirs = {
    #      enable = true;
    #      createDirectories = true;
    #    };
  };

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
    FLAKE = "/home/${userSettings.username}/flake";

  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  home.file = {
    ".config/fastfetch/config.jsonc" = { source = ./fastfetch/config.jsonc; };

    ".ideavimrc" = { source = ./ideavimrc; };

  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
