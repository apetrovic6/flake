{ config, pkgs, lib, userSettings, inputs, ... }:

let nixvim = inputs.nixvim.packages."x86_64-linux".default;
in {
  imports = [ ../starship ../alacritty ../shell-config.nix ];
  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  home.packages = [
    pkgs.htop
    pkgs.btop
    pkgs.curl
    pkgs.tree
    pkgs.zoxide
    pkgs.ripgrep
    pkgs.unzip
    pkgs.p7zip
    pkgs.jq
    pkgs.fzf
    pkgs.fastfetch
    pkgs.nmap
    pkgs.usbutils
    pkgs.git
    nixvim
  ];

  programs.git = {
    enable = true;
    userName = userSettings.gitUsername;
    userEmail = userSettings.gitEmail;
  };
  xdg = { enable = true; };

  home.sessionVariables = { FLAKE = "/home/${userSettings.username}/flake"; };

  home.file = {
    ".config/fastfetch/config.jsonc" = { source = ./fastfetch/config.jsonc; };
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;

}
