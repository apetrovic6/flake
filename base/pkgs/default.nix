{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pciutils
    gcc
    vim
    nh
    brightnessctl
    alacritty
    wget
    zathura
    git
    fastfetch
    firefox
    vlc
    brave
    kitty
    discord
    yazi
    gnome.file-roller
    (jetbrains.plugins.addPlugins jetbrains.clion [
      "ideavim"
      "nixidea"
      "github-copilot"
    ])

    devenv
    vscode.fhs
    xfce.thunar
    bluetuith
    lm_sensors
    killall
    obsidian
    insomnia
    postman
    wallust

    plex-media-player
    plexamp
    spotify

    blender

    mangohud
    lutris
    heroic
    bottles
  ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };

  programs.direnv.enable = true;

  programs.gamemode.enable = true;
}
